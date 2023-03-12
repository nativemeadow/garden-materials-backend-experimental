import createHttpError from '../models/http-error.mjs';
import DbService from '../config/db.mjs'

export const createOrder = async (req, res, next) => {
    const { userId } = req.userData;
    const db = DbService.getDbServiceInstance();
    const query = `INSERT INTO orders (user_id) VALUES (?)`;
    const selectLastInsertId = `SELECT max(id) as last_id FROM orders WHERE user_id = ?`;
    try {
        await db.execute(query, [userId]);
        const result = await db.execute(selectLastInsertId, [userId]);
        res.status(201).json({ message: 'success', action: 'Order created', orderId: result.last_id });
    } catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Create order, error creating order. ${err}`);
        next(error);
    }
}