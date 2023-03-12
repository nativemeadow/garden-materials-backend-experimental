import express from 'express';
import { search } from '../controllers/search-controller.mjs';

const router = express.Router();

router.post('/products', (req, res, next) => {
    console.log('Search');
    search(req, res, next);
});

export default router;