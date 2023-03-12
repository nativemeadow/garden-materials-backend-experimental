import express from 'express';
import { payments } from '../controllers/payments-controller.mjs';

const router = express.Router();

router.get('/', (req, res, next) => {
    console.log('get specific get payments');
    payments(req, res, next);
});

export default router;