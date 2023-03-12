import express from 'express';
import { check } from 'express-validator';
import { getGuestUser, createGuestUser, updateGuestUser, createUserFromGuest } from '../controllers/guest-users-controller.mjs';

const router = express.Router();

router.get('/:id', (req, res, next) => {
    console.log('get guest user:');
    getGuestUser(req, res, next);
});

router.post('/createGuestUser', (req, res, next) => {
    console.log('create guest user:');
    createGuestUser(req, res, next);
});

router.put('/updateGuestUser', (req, res, next) => {
    console.log('update guest user:');
    updateGuestUser(req, res, next);
});

router.put(
    '/createUserFromGuest',
    [
        check('username')
            .not()
            .isEmpty().withMessage('username is required. please enter a username for your new account'),
        check('email')
            .normalizeEmail()
            .isEmail().withMessage('please enter a valid email for you account.'),
        check('password').isLength({ min: 6 }).withMessage('please enter password with minimum of 6 character'),
        check(
            'passwordConfirmation',
            'passwordConfirmation field must have the same value as the password field',
        )
            .exists()
            .custom((value, { req }) => value === req.body.password)
            .withMessage('passwordConfirmation field must have the same value as the password field'),
        check('first_name')
            .not()
            .isEmpty().withMessage('please enter your first name.'),
        check('last_name')
            .not()
            .isEmpty().withMessage('please enter your last name.'),
        // check('phone')
        //     .not()
        //     .isEmpty().withMessage('please enter your phone number.'),
        // check('address')
        //     .not()
        //     .isEmpty().withMessage('please enter your street address.'),
        // check('city')
        //     .not()
        //     .isEmpty().withMessage('please enter your city.'),
        // check('country')
        //     .not()
        //     .isEmpty().withMessage('please enter your country.'),
        // check('state')
        //     .not()
        //     .isEmpty().withMessage('please enter your state or province.'),
        // check('postal_code')
        //     .not()
        //     .isEmpty().withMessage('please enter your zip or postal code.'),
    ],
    createUserFromGuest
);



export default router;