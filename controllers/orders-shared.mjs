import DbService from '../config/db.mjs';
import createHttpError from 'http-errors';
import User from '../models/user.mjs';
import jwt from 'jsonwebtoken';

async function findOrders(searchBy, searchValue) {
    const db = DbService.getDbServiceInstance();
    const query = `SELECT * FROM ORDERS RIGHT OUTER JOIN order_items on orders.id = order_items.order_id 
        WHERE ${searchBy} = ? and not orders.is_paid ORDER BY orders.created_at`;
    return await db.getData(query, [searchValue]);
}

export const findOrdersByUserId = async (id) => {
    try {
        const result = await findOrders('user_id', id);
        if (result.length === 0) {
            return null;
        }
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
}

export const findOrdersByOrderId = async (id) => {
    try {
        const result = await findOrders('order.id', id);
        if (result.length === 0) {
            return null;
        }
        return result[0];
    } catch (err) {
        console.error(err);
        throw err;
    }
}