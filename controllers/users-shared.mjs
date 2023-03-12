import DbService from '../config/db.mjs';
import createHttpError from 'http-errors';
import User from '../models/user.mjs';
import jwt from 'jsonwebtoken';


async function findUser(searchBy, searchValue) {
    const db = DbService.getDbServiceInstance();
    const query = `SELECT * FROM USERS WHERE ${searchBy} = ?`;
    return await db.getData(query, [searchValue]);
}

export const findUserByEmail = async (email) => {
    try {
        const result = await findUser('email', email);
        if (result.length === 0) {
            return null;
        }
        return result[0];
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const findUserById = async (id) => {
    try {
        const result = await findUser('id', id);
        if (result.length === 0) {
            return null;
        }
        return result[0];
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const findUserByUsername = async (username) => {
    try {
        const result = await findUser('username', username);
        if (result.length === 0) {
            return null;
        }
        return result[0];
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const findUserByRefreshToken = async (token) => {
    try {
        const user = await findUser('refreshToken', token);
        if (!user) {
            throw new createHttpError(404, `User not found.`);
        }
        return user;
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const findUserByToken = async (token) => {
    try {
        const user = await findUser('resetToken', token);
        if (!user) {
            throw new createHttpError(404, `User not found.`);
        }
        return user;
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const findUserOrders = async (userId) => {
    const db = DbService.getDbServiceInstance();
    let query = `SELECT * FROM orders 
    RIGHT OUTER JOIN order_items on orders.id = order_items.order_id
    WHERE orders.user_id = ? and ( orders.is_paid = 0 or orders.is_delivered = 0 )`;

    let userOrder = {};
    let order = {};
    try {
        userOrder = await db.getData(query, [userId]);
        if (userOrder.length === 0) {
            return null;
        }
        if (userOrder.length === 0) {
            return {};
        }
        order = {
            id: userOrder[0].id,
            order_date: userOrder[0].order_date,
            tax_rate: userOrder[0].tax_rate,
            total_price: userOrder[0].total_price,
            delivery_instructions: userOrder[0].delivery_instructions,
            purchase_order: userOrder[0].purchase_order,
            requested_delivery_date: userOrder[0].requested_delivery_date,
            is_paid: userOrder[0].is_paid,
            is_delivered: userOrder[0].is_delivered,
            payment_method: userOrder[0].payment_method,
            manual_address: userOrder[0].manual_address,
            pickup_date: userOrder[0].pickup_date,
            pickup_time: userOrder[0].pickup_time,
            order_items: []
        };
        for (let item of userOrder) {
            order.order_items.push({
                item_id: item.order_item_id,
                category_id: item.category_id,
                product_id: item.product_id,
                sku: item.sku,
                quantity: item.quantity,
                price: item.price,
                unit: item.unit,
                color: item.color,
            });
        }
    } catch (error) {
        console.error(error);
        throw error;
    }

    query = `SELECT * FROM cart 
        LEFT OUTER JOIN cart_items on cart.id = cart_items.cart_id
        WHERE cart.user_id = ? order by cart_items.created_at desc`;

    let userCart = {};
    try {
        userCart = await db.getData(query, [userId]);
        if (userCart.length === 0) {
            return {};
        }
        const cart = {
            cart_id: userCart[0].id,
            cart_items: []
        };
        for (const item of userCart) {
            cart.cart_items.push({
                id: item.item_id,
                cart_id: item.cart_id,
                category_id: item.category_id,
                product_id: item.product_id,
                sku: item.sku,
                quantity: item.quantity,
                price: item.price,
                unit: item.unit,
                image: item.image,
                color: item.color,
            });
        }

        order = { ...order, ...cart };

        return order;
    } catch (error) {
        console.error(error);
        throw error;
    }
}

export const emailExists = async (email) => {
    try {
        const result = await findUser('email', email);
        return result.length > 0;
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const usernameExists = async (username) => {
    try {
        const result = await findUser('username', username);
        return result.length > 0;
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export function getSignupErrors(errors) {
    console.log('Validation Errors:', errors);
    return errors.map(error => {
        return error.msg;
    });
}

// export const createTokens = (user, res) => {
//     accessToken = jwt.sign({ user }, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '15m' });
//     const refreshToken = jwt.sign({ user }, process.env.REFRESH_TOKEN_SECRET);
//     res.cookie('jwt', refreshToken, { httpOnly: true, sameSite: 'None', secure: true, maxAge: 24 * 60 * 60 * 1000 });
//     return { accessToken, refreshToken };
// }