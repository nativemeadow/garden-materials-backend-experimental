import express from 'express';
import { checkAuth } from '../middleware/check-auth.mjs';
import { addItem, getCart, deleteItem, deleteCart, updateItem } from '../controllers/shopping-kart-controller.mjs';

const router = express.Router();

router.use(checkAuth);

router.post('/addItem', (req, res, next) => {
    console.log('insert new cart item');
    addItem(req, res, next);
});

router.get('/', (req, res, next) => {
    console.log('get cart');
    getCart(req, res, next);
});

router.put('/updateItem', (req, res, next) => {
    console.log('update cart item');
    updateItem(req, res, next);
});

router.delete('/deleteItem', (req, res, next) => {
    console.log('delete cart item');
    deleteItem(req, res, next);
});

router.delete('/clearCart', (req, res, next) => {
    console.log('delete cart');
    deleteCart(req, res, next);
});

export default router;