import createHttpError from 'http-errors';
import DbService from '../config/db.mjs';
import bcrytp from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { validationResult } from 'express-validator';
import { response } from 'express';
import User from '../models/user.mjs';
import nodemailer from 'nodemailer';
import ejs from 'ejs';
import { emailExists, usernameExists, findUserByUsername, findUserByEmail, findUserById, findUserByToken, findUserByRefreshToken, findUserOrders } from './users-shared.mjs';
import { findCartByUserId } from './shopping-kart-handler.mjs'

export const getUsers = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const query = 'SELECT * FROM users';

    const result = db.getData(query);

    result
        .then((data) => {
            res.json(data);
        })
        .catch((err) => {
            console.error(err);
        });
};

export const getUser = async (req, res, next) => {
    const requestData = req.userData;
    const db = DbService.getDbServiceInstance();
    const query = `SELECT users.username, users.first_name, users.last_name, users.id, 
        users.customer_type, users.email, address.id as address_id, address.type, address.phone, 
        address.address, address.city, address.state_province, address.postal_code, address.country, address.company,
        orders.order_date, orders.delivery_instructions, orders.requested_delivery_date,
        orders.purchase_order, orders.manual_address, orders.pickup_date, orders.pickup_time, orders.is_pickup
        FROM users 
        RIGHT OUTER JOIN user_address as address ON address.user_id = users.id AND customer_type = 1
        RIGHT OUTER JOIN orders ON users.id = orders.user_id and not orders.is_paid 
        where users.id = ?`;
    try {
        const result = await db.getData(query, [requestData.userId]);
        res.status(201).json({ 'success': `user found`, 'user': result });
    } catch (err) {
        console.error(err);
        const error = createHttpError(500, `Finding user address failed, please try again later. ${err}`);
        return next(error);
    }
}

export const profile = async (req, res, next) => {
    const requestData = req.userData;
    const db = DbService.getDbServiceInstance();
    const query = `SELECT users.username, users.first_name, users.last_name, users.id, 
        users.customer_type, users.email, address.id as address_id, address.type, address.phone, 
        address.address, address.city, address.state_province, address.postal_code, address.country, address.company
        FROM users 
        RIGHT OUTER JOIN user_address as address ON address.user_id = users.id AND customer_type = 1
        where users.id = ?`;
    try {
        const result = await db.getData(query, [requestData.userId]);
        res.status(201).json({ 'message': `ok`, 'profile': result[0] });
    } catch (err) {
        console.error(err);
        const error = createHttpError(500, `Finding user address failed, please try again later. ${err}`);
        return next(error);
    }
}


function getSignupErrors(errors) {
    console.log('Validation Errors:', errors);
    return errors.map(error => {
        return error.msg;
    });
}

export const signup = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    let query = 'SELECT * FROM users where username = ?';
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorList = getSignupErrors(errors.array());
        const HttpError = createHttpError(400, errorList.join(', '));
        return next(HttpError);
    }

    const user = req.body;
    const newUser = new User(user);

    if (await usernameExists(newUser.username)) {
        const error = createHttpError(422, 'Username exists already, please login instead.');
        return next(error);
    }

    if (await emailExists(newUser.email)) {
        const error = createHttpError(422, 'User email exists already, please login instead.');
        return next(error);
    }

    try {
        newUser.password = await bcrytp.hash(newUser.password, 12);
    } catch (err) {
        const error = createHttpError(500, `Error on hashing password: ${err}`);
        return next(error);
    }

    query = `INSERT INTO USERS SET ?`;

    console.log('user:', newUser.toUser());
    console.log('address:', newUser.toAddress());

    try {
        await db.getData(query, newUser.toUser());

        query = `INSERT INTO USER_ADDRESS SET ?`;

        await db.getData(query, newUser.toAddress());

    } catch (err) {
        console.error(err);
        const error = createHttpError(500, `Signing up failed, please try again later. ${err}`);
        return next(error);
    }
    res.status(201).json({ success: true, message: `Your account has be created!` });
};

export async function handleRefreshToken(req, res, next) {
    const db = DbService.getDbServiceInstance();
    const cookies = req.cookies;
    if (!cookies?.jwt) {
        const error = createHttpError(401, 'Failed to find refresh cookie');
        return next(error);
    }
    const refreshToken = cookies.jwt;
    res.clearCookie('jwt', { httpOnly: true, sameSite: 'None', secure: true });

    const user = await findUserByRefreshToken(refreshToken);
    if (!user) {
        const error = createHttpError(403, 'Invalid credentials, could not log you in.');
        return next(error);
    }

    jwt.verify(
        refreshToken,
        process.env.REFRESH_TOKEN_SECRET,
        async (err, decoded) => {
            if (err || user.username !== decoded.username) {
                const error = createHttpError(403, 'Invalid credentials, could not validate username.');
                return next(error);
            }
            const accessToken = jwt.sign(
                { userId: decoded.id, email: decoded.email },
                process.env.ACCESS_TOKEN_SECRET,
                { expiresIn: '1h' }
            );
            console.log('refreshToken:', refreshToken);
            const query = 'update users set refreshToken = ? where id = ?';
            await db.getData(query, [refreshToken, decoded.id]);
            res.cookie('jwt', refreshToken, { httpOnly: true, sameSite: 'None', secure: false, maxAge: 24 * 60 * 60 * 1000 });
            res.json({ accessToken })
        }
    )
}

export const login = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const { username, password } = req.body;

    const user = await findUserByUsername(username)
    if (!user) {
        const error = createHttpError(422, 'Invalid credentials, could not log you in.');
        return next(error);
    }

    let isValidPassword = false;
    try {
        isValidPassword = await bcrytp.compare(password, user.password);
    } catch (err) {
        const error = createHttpError(500, `Error validating password: ${err}`);
        return next(error);
    }

    if (!isValidPassword) {
        const error = createHttpError(403, `Invalid credential. could not log you in`);
        return next(error);
    }

    let token;
    let orders = [];
    let cart = []
    let refreshToken = '';
    try {
        token = jwt.sign(
            { userId: user.id, email: user.email },
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: '1h' }
        );
        refreshToken = jwt.sign(
            { userId: user.id, email: user.email },
            process.env.REFRESH_TOKEN_SECRET,
            { expiresIn: '1d' }
        );
        console.log('refreshToken:', refreshToken);
        const query = 'update users set refreshToken = ? where id = ?';
        await db.getData(query, [refreshToken, user.id]);
        // if there are orders for this user, get them
        orders = await findUserOrders(user.id);
        cart = await findCartByUserId(user.id);
        if (orders) {
            delete orders.cart_items;
        }
    } catch (err) {
        const error = createHttpError(500, 'logging in failed, please try again later.');
        return next(error);
    }

    res.cookie('jwt', refreshToken, { httpOnly: true, sameSite: 'None', secure: true, maxAge: 24 * 60 * 60 * 1000 }); //
    res.status(201).json({
        userId: user.id,
        username: user.username,
        firstName: user.first_name,
        lastName: user.last_name,
        email: user.email,
        phone: user.phone,
        token,
        orders,
        cart
    });

};

export const handleLogout = async (req, res, next) => {
    // On client, also delete the accessToken

    const cookies = req.cookies;
    if (!cookies?.jwt) {
        const error = createHttpError(401, 'Failed to find jwt cookie');
        return next(error);
    }
    const refreshToken = cookies.jwt;
    res.clearCookie('jwt', { httpOnly: true, sameSite: 'None', secure: true });

    const user = await findUserByRefreshToken(refreshToken);
    if (!user) {
        const error = createHttpError(500, { message: 'logout failed' });
        return next(error);
    }

    if (!user) {
        res.clearCookie('jwt', { httpOnly: true, sameSite: 'None', secure: true });
        return res.sendStatus(204);
    }

    // Delete refreshToken in db
    query = 'update users set refreshToken = NULL where id = ?';
    try {
        await db.getData(query, [user.id]);
    } catch (err) {
        const error = createHttpError(500, { message: 'logout failed' });
        return next(error);
    }

    res.clearCookie('jwt', { httpOnly: true, sameSite: 'None', secure: true });
    res.status(201).json({ success: true `Your have logged out` });
}

export const updateProfile = async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorList = getSignupErrors(errors.array());
        const HttpError = createHttpError(400, errorList.join(', '));
        return next(HttpError);
    }
    const db = DbService.getDbServiceInstance();
    const requestData = req.body;

    const user = req.body;
    const existingUser = new User(user);

    let query = 'SELECT users.id as userId, users.*, user_address.*  FROM users join user_address on users.id = user_address.user_id where users.id = ?';
    let userCurrent;

    try {
        userCurrent = await db.getData(query, [existingUser.user_id]);
    } catch (err) {
        console.error(err);
    }

    const updatedUser = existingUser.toUpdateUser(userCurrent[0]);
    console.log('updatedUser:', updatedUser);
    if (updatedUser) {
        query = `UPDATE users SET ${updatedUser} WHERE id = ?`;
        try {
            await db.getData(query, [userCurrent[0].userId]);
        } catch (err) {
            const error = createHttpError(500, `Update up failed, please try again later. ${err}`);
            return next(error);
        }
    }

    const updatedAddress = existingUser.toUpdateAddress(userCurrent[0]);
    if (updatedAddress) {
        query = `UPDATE user_address SET ${updatedAddress} WHERE user_id = ?`;
        try {
            await db.getData(query, [userCurrent[0].userId]);
        } catch (err) {
            const error = createHttpError(500, `Update up failed, please try again later. ${err}`);
            return next(error);
        }
    }

    res.status(200).json({ success: true, message: 'Your profile has been updated' });
};


export const changePassword = async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorList = getSignupErrors(errors.array());
        const HttpError = createHttpError(400, errorList.join(', '));
        return next(HttpError);
    }
    const db = DbService.getDbServiceInstance();
    const requestData = req.body;

    let query = 'SELECT * FROM users where id = ?';

    const user = await findUserById(req.userData.userId);
    if (!user) {
        const error = createHttpError(422, 'Invalid credentials, could not log you in.');
        return next(error);
    }

    let isValidPassword = false;
    try {
        isValidPassword = await bcrytp.compare(requestData.currentPassword, user.password);
    } catch (err) {
        const error = createHttpError(500, `Error validating password: ${err}`);
        return next(error);
    }

    if (!isValidPassword) {
        const error = createHttpError(403, `Invalid credential. could not update password`);
        return next(error);
    }

    try {
        requestData.newPassword = await bcrytp.hash(requestData.newPassword, 12);
    } catch (err) {
        const error = createHttpError(500, `Error on hashing password: ${err}`);
        return next(error);
    }

    query = 'update users set password = ? where id = ?';
    try {
        await db.getData(query, [requestData.newPassword, req.userData.userId]);
    } catch (err) {
        const error = createHttpError(500, `update password failed, please try again later. ${err}`);
        return next(error);
    }

    res.status(201).json({ success: true, message: 'Your password has been updated' });
}

export const forgotPassword = async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorList = getSignupErrors(errors.array());
        const HttpError = createHttpError(400, errorList.join(', '));
        return next(HttpError);
    }
    const db = DbService.getDbServiceInstance();
    const requestData = req.body;

    let query = '';

    const user = await findUserByEmail(requestData.email);
    if (!user) {
        const error = createHttpError(403, `Email not found. could not send reset password link`);
        return next(error);
    }

    let resetToken;
    try {
        resetToken = jwt.sign({ userId: user.id, email: user.email }, process.env.RESET_TOKEN_SECRET, { expiresIn: '1h' });
        query = 'update users set resetToken = ? where id = ?';
        await db.getData(query, [resetToken, user.id]);
    } catch (err) {
        const error = createHttpError(500, `update token failed, ${err} Could not send reset password link`);
        return next(error);
    }

    const resetUrl = `${process.env.FRONTEND_URL}/user/reset-password/${resetToken}`;
    const resetLinkName = 'Reset Password Here';
    let htmlEmail = '';
    await ejs.renderFile('./views/reset-password-email.ejs', { resetUrl, resetLinkName }, (err, html) => {
        if (err) {
            const error = createHttpError(500, `Error on rendering reset password email: ${err}`);
            return next(error);
        }
        return htmlEmail = html;
    });

    const mailOptions = {
        from: process.env.FROM_EMAIL_ADDRESS,
        to: user.email,
        subject: 'Reset your password',
        html: htmlEmail,
    };

    const transporter = nodemailer.createTransport({
        host: process.env.MAILER_HOST,
        port: process.env.MAILER_PORT,
        auth: {
            user: process.env.MAILER_AUTH_USER,
            pass: process.env.MAILER_AUTH_PASS
        }
    });

    transporter.sendMail(mailOptions, (err, info) => {
        if (err) {
            const error = createHttpError(500, `Could not send reset password link: ${err}`);
            return next(error);
        }
        res.status(201).json({ success: true, message: 'Reset password link has been sent to your email' });
    });
}

export const resetPassword = async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorList = getSignupErrors(errors.array());
        const HttpError = createHttpError(400, errorList.join(', '));
        return next(HttpError);
    }
    const db = DbService.getDbServiceInstance();
    const requestData = req.body;
    const token = req.headers.authorization.split(' ')[1];

    const user = await findUserByToken(token);
    if (!user) {
        const error = createHttpError(403, `Invalid reset token. could not reset password`);
        return next(error);
    }

    try {
        requestData.password = await bcrytp.hash(requestData.password, 12);
    } catch (err) {
        const error = createHttpError(500, `Error on hashing password: ${err}`);
        return next(error);
    }

    const query = 'update users set password = ?, resetToken = null where id = ?';
    try {
        await db.getData(query, [requestData.password, user.id]);
    } catch (err) {
        const error = createHttpError(500, `update password failed, please try again later. ${err}`);
        return next(error);
    }

    res.status(201).json({ 'success': 'Your password has been updated' });
}