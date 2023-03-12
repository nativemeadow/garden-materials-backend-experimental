import express from 'express';
import { getCategories, getCategory, getCategoryByUrlKey, getHierarchy, getCategoryProducts, getProductPricing, getProductsPerCategory } from '../controllers/category-controller.mjs';

const router = express.Router();

router.get('/', (req, res, next) => {
    console.log('get categories');
    getCategories(req, res, next);
});

router.get('/:id', (req, res, next) => {
    console.log('get specific categories');
    getCategory(req, res, next);
});

router.get('/by-url-key/:urlKey', (req, res, next) => {
    console.log('get specific category by url key:');
    getCategoryByUrlKey(req, res, next);
});

router.get('/hierarchy/:id', (req, res, next) => {
    console.log('get parent categories');
    getHierarchy(req, res, next);
});

router.get('/products/:id', (req, res, next) => {
    console.log('get products');
    getCategoryProducts(req, res, next);
});

router.get('/pricing/:id', (req, res, next) => {
    console.log('get products');
    getProductPricing(req, res, next);
});

router.get('/product-pricing/:id', (req, res, next) => {
    console.log('get product pricing');
    getProductsPerCategory(req, res, next);
});

export default router;