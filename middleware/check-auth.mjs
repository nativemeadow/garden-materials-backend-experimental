import HttpError from '../models/http-error.mjs';
import jwt from 'jsonwebtoken';

export const checkAuth = (req, res, next) => {
    if (req.method === 'OPTIONS') {
        return next();
    }
    let token;
    try {
        token = req.headers.authorization.split(' ')[1]; // Authorization: 'Bearer TOKEN'
        if (!token) {
            throw new Error('Authentication failed');
        }
        const decodedToken = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
        req.userData = { userId: decodedToken.userId, email: decodedToken.email };
        next();
    } catch (err) {
        console.log('headers: ', req.headers.authorization)
        const error = new HttpError(err, 500);
        return next(error);
    }
};