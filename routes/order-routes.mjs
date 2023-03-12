import express from 'express';
import { check } from 'express-validator';
import { getOrders, getOrder, getUserOrder, createOrder, updateOrder, updateCustomerInfo, deleteOrder, getZones, updateDeliveryCost } from '../controllers/orders-controller.mjs';
import { checkAuth } from '../middleware/check-auth.mjs';

const router = express.Router();

router.get('/getOrder/:id', (req, res, next) => {
    console.log('get specific order');
    getOrder(req, res, next);
});

router.patch('/updateOrder', (req, res, next) => {
    console.log('Update order');
    updateOrder(req, res, next);
});

router.delete('/deleteOrder/:id', (req, res, next) => {
    console.log('Delete order');
    deleteOrder(req, res, next);
});

router.use(checkAuth);

router.get('/', (req, res, next) => {
    console.log('get orders');
    getOrders(req, res, next);
});

router.post('/createOrder', (req, res, next) => {
    console.log('Create order');
    createOrder(req, res, next);
});

router.get('/getUserOrder', (req, res, next) => {
    console.log('get specific order');
    getUserOrder(req, res, next);
});

router.patch('/updateCustomerInfo', (req, res, next) => {
    console.log('update customer info');
    updateCustomerInfo(req, res, next);
});

router.get('/getDeliveryZones', (req, res, next) => {
    console.log('get zones');
    getZones(req, res, next);
});

router.put('/updateDeliveryCost', (req, res, next) => {
    console.log('update delivery cost');
    updateDeliveryCost(req, res, next);
});

export default router;