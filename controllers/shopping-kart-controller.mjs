import createHttpError from '../models/http-error.mjs';
import DbService from '../config/db.mjs';
import { addItemHandler } from './shopping-kart-handler.mjs';

/**
 * Adds a new item to the shopping cart. If the item is already in the cart,
 * the quantity is increased by 1.  If the item is not in the cart, a new item
 * is added to the cart.
 * @param {json} req 
 * @param {json} res 
 * @param {next route} next 
 */
export const addItem = async (req, res, next) => {
    let cartItem = req.body;
    const { userId } = req.userData;
    cartItem = !Array.isArray(cartItem) ? [cartItem] : cartItem;
    try {
        const cartItems = await addItemHandler(userId, cartItem);
        res.status(201).json({ message: 'success', action: 'Cart item(s) added', items: cartItems });
    } catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Add cart item, error updating cart item'. ${err}`);
        next(error);
    }
}

export const updateItem = async (req, res, next) => {
    const { itemId, quantity } = req.body;
    const db = DbService.getDbServiceInstance();
    const query = `UPDATE cart_items SET quantity = ? WHERE item_id = ?`;
    try {
        await db.getData(query, [quantity, itemId]);
        res.status(201).json({ message: 'success', action: `Cart item updated!` });
    }
    catch (err) {
        console.error(err);
        const error = new createHttpError(500, `Update cart item quantity, please try again later. ${err}`);
        next(error);
    }
};

export const getCart = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    let foundCart = '';
    let cartItems = '';
    let cart = '';
    let query = `select * from cart where user_id = ?`;
    try {
        foundCart = await db.getData(query, [req.userData.userId]);
        if (!foundCart[0]) {
            res.status(200).json([]);
        } else {
            query = `select * from cart_items where cart_id = ?`;
            cartItems = await db.getData(query, [foundCart[0].id]);
            cart = {
                id: foundCart[0].id,
                cartItems
            }
            res.status(200).json(cartItems);
        }
    } catch (err) {
        res.status(500).json({ 'error selecting cart': err });
    }
}

export const deleteItem = async (req, res, next) => {
    const { itemId } = req.body;
    const db = DbService.getDbServiceInstance();
    let foundCartItem = '';
    let query = `select * from cart_items where item_id = ?`;
    try {
        foundCartItem = await db.getData(query, [itemId]);
        if (!foundCartItem[0]) {
            res.status(404).json({ 'error': `Cart item not found` });
        } else {
            query = `delete from cart_items where item_id = ?`;
            await db.getData(query, [itemId]);
            res.status(200).json({ message: 'success', action: `Cart item deleted!` });
        }
    } catch (error) {
        res.status(500).json({ 'error selecting cart item': error });
    }
}

export const deleteCart = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    let foundCart = '';
    let query = `select * from cart where user_id = ?`;
    try {
        foundCart = await db.getData(query, [req.userData.userId]);
        if (!foundCart[0]) {
            res.status(404).json({ 'error': `Cart not found` });
        } else {
            query = `delete from cart where user_id = ?`;
            await db.getData(query, [req.userData.userId]);
            res.status(200).json({ message: 'success', action: `Cart deleted!` });
        }
    } catch (error) {
        res.status(500).json({ 'error selecting cart': error });
    }
}
