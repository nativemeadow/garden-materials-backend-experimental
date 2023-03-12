import httpError from '../models/http-error.mjs';
import DbService from '../config/db.mjs';
import { isString } from '../utils/string-utils.mjs';
import { response } from 'express';

export const getProduct = async (req, res, next) => {
    const { categoryId, id } = req.params;
    const db = DbService.getDbServiceInstance();
    let categoryLookupKey = 'category.id';
    let productLookupKey = 'product.id';
    if (isString(categoryId)) {
        categoryLookupKey = 'category.url_key';
    }
    if (isString(id)) {
        productLookupKey = 'product.url_key';
    }
    const query = `SELECT category.id as categoryId, category.url_key as category_url_key, category.title as categoryTitle,  
        product.id, product.url_key, product.sku, product.title, product.description, product.image, product.image_lens_size, product.extended,
        price.id as priceKey, price.sku as priceSku, price.title as priceTitle, price.description as priceDescr, price.image as priceImage, price.price, price.size, price.units, price.coverage, price.coverage_value, price.online_minimum 
        FROM product 
        JOIN price ON price.product = product.id   
        JOIN product_category ON product_category.product = product.id
        JOIN category ON product_category.category = category.id
        WHERE ${categoryLookupKey} = ? and ${productLookupKey} = ?`

    console.log('Category:', categoryId, 'Product:', id);
    const result = db.getData(query, [categoryId, id]);

    result
        .then(data => {
            const productArray = [];
            let productObject = {};
            let pricingObject = {};
            data.forEach((prod, index, prodArray) => {
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
                        pricing: [],
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

            res.json(productObject);
        })
        .catch(err => {
            console.error(err);
        });
}