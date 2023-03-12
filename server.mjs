import express from 'express';
import path from 'path';
import dotenv from 'dotenv';
import colors from 'colors';
import bodyParser from 'body-parser';
import corsOptions from './config/corsOptions.mjs';
import cors from 'cors';
import ejs from 'ejs';
import cookieParser from 'cookie-parser';

import categoryRoutes from './routes/category-routes.mjs';
import productRoutes from './routes/product-routes.mjs';
import userRoutes from './routes/user-routes.mjs';
import shoppingCartRoutes from './routes/shopping-kart-routes.mjs';
import guestUserRoutes from './routes/guest-users-routes.mjs';
import orderRoutes from './routes/order-routes.mjs';
import searchRoutes from './routes/search-routes.mjs';
import errorHandlerMiddleware from './middleware/error-handler.js';
import paymentsRoutes from './routes/payments-router.mjs';

dotenv.config();

const app = express();
app.use(bodyParser.json());
app.use(cookieParser())
app.use(express.urlencoded({ extended: false }));
app.use(cors(corsOptions));
app.use('/images', express.static(path.join('images')));
app.use('/pdf', express.static(path.join('pdf')));

app.set('view engine', 'ejs');

const PORT = process.env.PORT || 5001

app.use('/api/categories', categoryRoutes);
app.use('/api/products', productRoutes);
app.use('/api/auth/', userRoutes);
app.use('/api/shopping', shoppingCartRoutes);
app.use('/api/guestUser', guestUserRoutes);
app.use('/api/orders', orderRoutes);
app.use('/api/search', searchRoutes);
app.use('/payments', paymentsRoutes);

app.use(errorHandlerMiddleware);

app.listen(
    PORT,
    console.log(
        `Server running in ${process.env.NODE_ENV} mode on port ${PORT}`.yellow
            .bold
    )
);