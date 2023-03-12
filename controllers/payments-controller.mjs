import httpError from '../models/http-error.mjs';
import DbService from '../config/db.mjs';
import { response } from 'express';


const payments = (req, res, next) => {
    res.render('payments-handler', {});
}

export { payments }