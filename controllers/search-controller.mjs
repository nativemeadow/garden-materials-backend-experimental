import DbService from '../config/db.mjs';
import createHttpError from 'http-errors';
import { isString } from '../utils/string-utils.mjs';

const buildSearchResults = (result) => {
    const productArray = [];
    let productObject = {};
    let pricingObject = {};

    result.forEach((prod, index, prodArray) => {
        if (index === 0 || prod.id !== prodArray[index - 1].id) {
            productObject = {
                categoryId: prod.categoryId,
                categoryUrlKey: prod.category_url_key,
                categoryTitle: prod.categoryTitle,
                id: prod.id,
                url_key: prod.url_key,
                sku: prod.sku,
                title: prod.title,
                description: prod.description,
                image: prod.image,
                imageLensSize: prod.image_lens_size,
                extended: prod.extended,
                relevance: prod.relevance,
                pricing: []
            };

            productArray.push(productObject);
        }
        pricingObject = {
            key: prod.priceKey,
            sku: prod.priceSku,
            title: prod.priceTitle,
            description: prod.priceDescr,
            image: prod.priceImage,
            price: prod.price,
            size: prod.size,
            units: prod.units,
            coverage: prod.coverage,
            coverage_value: prod.coverage_value,
            online_minimum: prod.online_minimum
        };
        productObject.pricing.push(pricingObject);
    });

    return productArray;
};

const mergeResults = (arrayOne, arrayTwo) => {
    const mergedArray = [];

    for (const item of arrayOne) {
        let shared = false;
        for (const item2 of arrayTwo) {
            if (item.id === item2.id) {
                mergedArray.push(item);
                shared = true;
                break
            }
        }
        if (!shared) {
            mergedArray.push(item);
        }
    }
    return mergedArray;
};

export const search = async (req, res, next) => {
    const { search, sorted } = req.body;
    const sortOrder = sorted ? sorted : ' `relevance`+0 DESC';
    const db = DbService.getDbServiceInstance();
    const query = `SELECT category.id as categoryId, category.url_key as category_url_key ,category.title as categoryTitle, 
            product.id, product.url_key, product.title, product.description, product.image, product.image_lens_size, product.extended, product.sku, price.id as priceKey,
            price.title as priceTile, price.description as priceDescr, price.price, 
            price.size, price.units, price.coverage, price.coverage_value, price.image as priceImage, price.sku as priceSku, price.online_minimum,
            MATCH(product.title, product.description) AGAINST (? IN BOOLEAN MODE) as relevance
        FROM product
        JOIN product_category ON product_category.product = product.id
        JOIN category ON product_category.category = category.id  
        JOIN price ON product.id = price.product where `;
    const prodFocus = `MATCH(product.title, product.description) AGAINST (? IN BOOLEAN MODE)`;
    const priceFocus = `MATCH(price.title, price.description) AGAINST (? IN BOOLEAN MODE)`;
    const orderBy = ' ORDER BY ?'
    let focusedQuery = query + prodFocus;
    let productArray = [];
    let priceViewProductArray = [];

    try {
        const result = await db.getData(focusedQuery, [search, search, sortOrder]);
        const query2 = focusedQuery.replace(prodFocus, priceFocus).replace(prodFocus, priceFocus);
        const result2 = await db.getData(query2, [search, search, sortOrder]);

        productArray = buildSearchResults(result);
        priceViewProductArray = buildSearchResults(result2);

        const mergedArray = mergeResults(productArray, priceViewProductArray);

        console.log('search results:', mergedArray);
        console.log('search term:', search);

        res.json(mergedArray);
    } catch (err) {
        const error = createHttpError('Could not get cart', 500);
        return next(error);
    }
}
