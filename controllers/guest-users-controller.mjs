import createHttpError from 'http-errors';
import DbService from '../config/db.mjs';
import User from '../models/user.mjs';
import bcrytp from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { validationResult } from 'express-validator';
import { emailExists, usernameExists, getSignupErrors } from './users-shared.mjs';

export const createGuestUser = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const query = `INSERT INTO USERS SET ?`;

    const user = { 'username': 'guest' };
    const newUser = new User(user);
    newUser.customer_type = 'Guest';

    try {

        await db.getData(query, newUser.toUser());

        query = `INSERT INTO USER_ADDRESS SET ?`;

        await db.getData(query, newUser.toAddress());

        token = jwt.sign(
            { userId: newUser.id, email: newUser.email },
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: '1h' }
        );
        const refreshToken = jwt.sign(
            { userId: newUser.id, email: newUser.email },
            process.env.REFRESH_TOKEN_SECRET,
            { expiresIn: '1d' }
        );
        console.log('refreshToken:', refreshToken);
        const query = 'update users set refreshToken = ? where id = ?';
        await db.getData(query, [refreshToken, newUser.id]);
        res.cookie('jwt', refreshToken, { httpOnly: true, sameSite: 'None', secure: true, maxAge: 24 * 60 * 60 * 1000 });
    } catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Error creating guest user. ${err}`);
        next(error);
    }

    res.status(201).json({
        'success': `Guest user created!`,
        guestUser: {
            userId: newUser.id,
            username: newUser.username,
            firstName: newUser.first_name,
            lastName: newUser.last_name,
            email: newUser.email,
            token,
        }
    });
}

export const updateGuestUser = async (req, res, next) => {
    const { id } = req.body;
    const db = DbService.getDbServiceInstance();
    const query = `UPDATE USERS SET ? WHERE id = ?`;

    const user = req.body;
    const guestUser = new User(user);

    try {
        const result = await db.getData(query, [guestUser.toJSON(), id]);
        res.status(201).json({ message: 'success', action: 'User updated', guestUser: guestUser.toJSON() });
    } catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Update user, error updating user. ${err}`);
        next(error);
    }
}

export const getGuestUser = async (req, res, next) => {
    const { id } = req.params;
    const db = DbService.getDbServiceInstance();
    const query = `SELECT * FROM USERS WHERE id = ?`;

    try {
        const result = await db.getData(query, [id]);
        if (result.length === 0) {
            throw new createHttpError(404, `User not found.`);
        }
        res.status(200).json({ message: 'success', action: 'User found', user: result[0] });
    } catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Get user, error getting user. ${err}`);
        next(error);
    }
}

export const createUserFromGuest = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorList = getSignupErrors(errors.array());
        const HttpError = createHttpError(400, errorList.join(', '));
        return next(HttpError);
    }

    const user = req.body;
    const guestUser = new User(user);
    guestUser.customer_type = 'Registered';

    if (await usernameExists(guestUser.username)) {
        const error = createHttpError(422, 'Username exists already, please login instead.');
        return next(error);
    }

    if (await emailExists(guestUser.email)) {
        const error = createHttpError(422, 'User email exists already, please login instead.');
        return next(error);
    }

    try {
        guestUser.password = await bcrytp.hash(guestUser.password, 12);
    } catch (err) {
        const error = createHttpError(500, `Error on hashing password: ${err}`);
        return next(error);
    }

    const query = `UPDATE USERS SET ? WHERE id = ?`;

    let token;
    try {
        token = jwt.sign(
            { userId: guestUser.id, email: guestUser.email },
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: '1h' }
        );
        const refreshToken = jwt.sign(
            { userId: guestUser.id, email: guestUser.email },
            process.env.REFRESH_TOKEN_SECRET,
            { expiresIn: '1d' }
        );
        guestUser['refreshToken'] = refreshToken;
        // Save off the user's id for use in updating the user on the database.
        const userId = guestUser.id;
        // remove the id from from the user object.  Will not be updated in the database if it is included.
        delete guestUser['id'];
        await db.getData(query, [guestUser.toJSON(), userId]);
        res.cookie('jwt', refreshToken, { httpOnly: true, sameSite: 'None', secure: true, maxAge: 24 * 60 * 60 * 1000 });
    } catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Update user, error updating user. ${err}`);
        next(error);
    }

    res.status(201).json({
        userId: user.id,
        username: user.username,
        firstName: user.first_name,
        lastName: user.last_name,
        email: user.email,
        token: token,
    });
}