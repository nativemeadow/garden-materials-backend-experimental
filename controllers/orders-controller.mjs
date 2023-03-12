import createHttpError from '../models/http-error.mjs';
import DbService from '../config/db.mjs';
import { findOrdersByUserId, findOrdersByOrderId } from './orders-shared.mjs'
import { findCartByUserId } from './shopping-kart-handler.mjs'
import { buildDeliveryZones, getDeliveryZones } from '../models/delivery-zones.mjs'


export const getZones = async (req, res, next) => {
    try {
        const zones = await buildDeliveryZones();
        res.status(200).json({ zones });
    } catch (err) {
        const error = createHttpError('Could not get zones', 500);
        return next(error);
    }
}

export const updateDeliveryCost = async (req, res, next) => {
    const { deliveryDistanced } = req.body;

    let deliveryCost = deliveryDistanced * (process.env.DELIVERY_COST_PER_MILE_FEE * 2);
    const calculateUnitDeliveryCost = (units, unitQuantity, deliveryCost) => {
        switch (units) {
            case 'ton':
                deliveryCost += unitQuantity * (process.env.DELIVERY_TONS_FEE);
                break;
            case 'EA':
            case 'qt':
            case 'ea':
                deliveryCost += unitQuantity * (process.env.DELIVERY_EACH_FEE);
                break;
            case 'lbs':
                deliveryCost += unitQuantity * (process.env.DELIVERY_POUNDS_FEE);
                break;
            case 'sf':
            case 'yd':
            case 'cf':
            case 'cu ft':
                deliveryCost += unitQuantity * (process.env.DELIVERY_VOLUME_FEE);
                break;
            default:
                deliveryCost += unitQuantity * (process.env.DELIVERY_EACH_FEE);
                break;
        }
    }

    try {
        const cartItems = await findCartByUserId(req.userData.userId);
        cartItems.forEach(item => {
            calculateUnitDeliveryCost(item.unit, item.quantity, deliveryCost);
        }
        );
        deliveryCost += cartItems.length * process.env.DELIVERY_SETUP_FEE;
    } catch (err) {
        const error = createHttpError('Could not get cart', 500);
        return next(error);
    }
    const updatedOrder = { deliveryCost: deliveryCost };
    res.status(200).json({ order: updatedOrder });
}


export const getOrders = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const query = `select * from orders where user_id = ? and not is_paid order by created_at`;
    try {
        const orders = await db.getData(query, [req.userData.userId]);
        res.status(200).json({ message: 'success', action: 'order', orders });
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get orders, please try again later. ${err}`);
        return next(error);
    }
}

export const getOrder = async (req, res, next) => {
    try {
        const order = await findOrdersByOrderId(req.params.id);
        res.status(200).json({ message: 'success', action: 'order', order });
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get order, please try again later. ${err}`);
        return next(error);
    }
}

export const getUserOrder = async (req, res, next) => {
    try {

        let userOrder = {};

        userOrder = await findOrdersByUserId(req.userData.userId);

        if (userOrder.length === 0) {
            const error = new createHttpError(404, `Couldn't find order for the provided user id.`);
            return next(error);
        }

        const order = {
            id: userOrder[0].id,
            order_date: userOrder[0].order_date,
            tax_rate: userOrder[0].tax_rate,
            total_price: userOrder[0].total_price,
            address_id: userOrder[0].address_id,
            delivery_instructions: userOrder[0].delivery_instructions,
            purchase_order: userOrder[0].purchase_order,
            requested_delivery_date: userOrder[0].requested_delivery_date,
            is_paid: userOrder[0].is_paid,
            is_delivered: userOrder[0].is_delivered,
            payment_method: userOrder[0].payment_method,
            manual_address: userOrder[0].manual_address,
            pickup_date: userOrder[0].pickup_date,
            pickup_time: userOrder[0].pickup_time,
            items: []
        };
        for (const item of userOrder) {
            order.items.push({
                item_id: item.order_item_id,
                category_id: item.category_id,
                product_id: item.product_id,
                title: item.title,
                image: item.image,
                sku: item.sku,
                quantity: item.quantity,
                price: item.price,
                unit: item.unit,
                color: item.color,
            });
        }

        res.status(200).json({ message: 'success', action: 'getUserOrder', order });
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get order, please try again later. ${err}`);
        return next(error);
    }
}

export const createOrder = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    let order = '';
    let cart;
    let cartItems;

    let query = `select * from orders where not is_paid and not is_delivered and user_id = ? order by created_at`;
    try {
        order = await db.getData(query, [req.userData.userId]);
        if (order.length === 0) {
            query = `insert into orders (user_id, delivery_instructions, purchase_order, requested_delivery_date) values (?, ?, ?, ?)`;
            order = await db.getData(query, [req.userData.userId, req.body.delivery_instructions, req.body.purchase_order, req.body.requested_delivery_date]);
        } else {
            query = `update orders set delivery_instructions = ?, purchase_order = ?, requested_delivery_date = ? where user_id = ?`;
            order = await db.getData(query, [req.body.delivery_instructions, req.body.purchase_order, req.body.requested_delivery_date, req.userData.userId]);
        }
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't update order, please try again later. ${err}`);
        return next(error);
    }

    query = `select * from orders where user_id = ? and created_at = (select max(created_at) from orders where user_id = ?)`;
    try {
        order = await db.getData(query, [req.userData.userId, req.userData.userId]);
    }
    catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get orders, please try again later. ${err}`);
        return next(error);
    }

    query = `select * from cart where user_id = ?`;
    try {
        cart = await db.getData(query, [req.userData.userId]);
    }
    catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get cart, please try again later. ${err}`);
        return next(error);
    }

    query = `select * from cart_items where cart_id = ?`;
    try {
        cartItems = await db.getData(query, [cart[0].id]);
    }
    catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get cart items, please try again later. ${err}`);
        return next(error);
    }

    const cartItemArray = cartItems.map(item => {
        return { order_id: order[0].id, category_id: item.category_id, product_id: item.product_id, sku: item.sku, quantity: item.quantity, price: item.price, title: item.title, image: item.image, unit: item.unit, color: item.color };
    });

    query = `delete FROM order_items WHERE order_id = ?`;
    try {
        await db.getData(query, [order[0].id]);
    }
    catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't delete order items, please try again later. ${err}`);
        return next(error);
    }

    query = `insert into order_items set ? `;
    try {
        cartItemArray.forEach(async (item) => {
            await db.getData(query, item);
        });
    }
    catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't create order items, please try again later. ${err}`);
        return next(error);
    }
    res.status(200).json({ message: 'success', action: 'Order created', order });
}

export const updateOrder = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    let order = '';
    const query = `update orders set delivery_instructions = ?, purchase_order = ?, requested_delivery_date = ? where user_id = ?`;
    try {
        order = await db.getData(query, [req.body.delivery_instructions, req.body.purchase_order, req.body.requested_delivery_date, req.body.user_id]);
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't update order, please try again later. ${err}`);
        return next(error);
    }
    res.status(200).json({ message: 'success', action: 'Order updated', order });
}

export const updateCustomerInfo = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const request = req.body;
    let order = '';
    let query = `update orders set address_id = ?, pickup_date = ?, pickup_time = ?  where user_id = ?`;
    try {
        if (request.is_pickup) {
            order = await db.getData(query, [request.address_id, request.pickup_date, request.pickup_time, req.userData.userId]);
        }
        if (request.is_manual_address) {
            const manualAddress = JSON.stringify(request.manual_address);
            query = `update orders set manual_address = ? where user_id = ?`;
            order = await db.getData(query, [manualAddress, req.userData.userId]);
        }
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't update order, please try again later. ${err}`);
        return next(error);
    }
    res.status(200).json({ message: 'success', action: 'Order updated', order });
}

export const deleteOrder = async (req, res, next) => {
    const db = DbService.getDbServiceInstance();
    const query = `delete from orders where id = ?`;
    try {
        await db.getData(query, [req.params.id]);
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't delete order, please try again later. ${err}`);
        return next(error);
    }
    res.status(200).json({ message: 'success', action: 'Order deleted' });
}