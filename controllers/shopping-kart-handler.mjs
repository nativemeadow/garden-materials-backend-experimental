import createHttpError from '../models/http-error.mjs';
import DbService from '../config/db.mjs';

export const findCartByUserId = async (userId) => {
    const db = DbService.getDbServiceInstance();
    let cart = '';
    const query = `select * from cart RIGHT OUTER JOIN cart_items on cart.id = cart_items.cart_id where user_id = ?`;
    try {

        cart = await db.getData(query, [userId]);
        if (!cart) {
            return [];
        }
        return cart
    } catch (error) {
        throw new createHttpError(500, `Could not find cart, please try again later. ${error}`);
    }
}

/**
 * Gets the cart for the user. If the cart is not found, a cart is created.
 * The cart is then returned.
 * @param {*} userId 
 * @returns 
 */
export const getCartHandler = async (userId) => {
    const db = DbService.getDbServiceInstance();
    let foundCart = '';

    let query = `select * from cart where user_id = ?`;
    try {
        /**
         * Check if cart exists for user
         * If not, create new cart for user
         * If yes, get cart id
         * If no, throw error
         */
        foundCart = await db.getData(query, [userId]);
        if (!foundCart[0]) {
            query = 'insert into cart SET ?';
            await db.getData(query, { user_id: [userId] });
            query = `select * from cart where user_id = ?`;
            foundCart = await db.getData(query, [userId]);
        }
        return foundCart[0].id;
    } catch (error) {
        throw new createHttpError(500, `Cart update failed, please try again later. ${error}`);
    }
}

/**
 * Adds a new item(s) to the shopping cart. If the item is already in the cart,
 * the quantity is increased by 1.  If the item is not in the cart, a new item
 * is added to the cart. If the cart is not found, a new cart is created.
 */
export const addItemHandler = async (userId, cartItem) => {
    const db = DbService.getDbServiceInstance();

    const queryForItem = `select * from cart_items where cart_id = ? and product_id = ?`;
    const insertQuery = 'insert into cart_items SET ?';
    const updateQuery = `update cart_items SET quantity = ? where cart_id = ? and product_id = ?`;
    const selectLastInsertId = 'select max(item_id) as last_id from cart_items';
    let foundCartItem = '';
    const cartItems = [];
    try {
        const cartId = await getCartHandler(userId);
        for (const element of cartItem) {
            /**
             * check if cart item already exists in cart
             * if it does, update quantity
             * if it doesn't, insert new cart item
             */
            foundCartItem = await db.getData(queryForItem, [cartId, element.product_id]);
            if (!foundCartItem[0]) {
                element.cart_id = cartId;
                await db.getData(insertQuery, element);
                const item_id = await db.getData(selectLastInsertId);
                cartItems.push({
                    cart_id: cartId,
                    item_id: item_id[0].last_id,
                    quantity: element.quantity,
                    product_id: element.product_id
                });
            } else {
                await db.getData(updateQuery, [element.quantity, cartId, element.product_id]);
                cartItems.push({
                    cart_id: cartId,
                    item_id: foundCartItem[0].id,
                    quantity: element.quantity,
                    product_id: element.product_id
                });
            }
            return cartItems;
        }
    } catch (error) {
        throw new createHttpError(500, `Adding cart item failed, please try again later. ${error}`);
    }
}
