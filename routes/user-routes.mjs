import express from 'express';
import { check } from 'express-validator';
import { getUsers, getUser, signup, login, handleLogout, updateProfile, changePassword, forgotPassword, resetPassword, handleRefreshToken } from '../controllers/users-controller.mjs';
import { checkAuth } from '../middleware/check-auth.mjs';
import { checkPasswordResetAuth } from '../middleware/check-password-reset-auth.mjs';

const router = express.Router();

router.get('/', (req, res, next) => {
    console.log('get all users:');
    getUsers(req, res, next);
});

router.post(
    '/signup',
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
    signup
);

router.post('/login', login);

router.put('/forgotPassword', [
    check('email')
        .normalizeEmail()
        .isEmail().withMessage('please enter a valid email for you account.')],
    forgotPassword);

router.use('/resetPassword', checkPasswordResetAuth)

router.put('/resetPassword', [
    check('password')
        .isLength({ min: 6 })
        .withMessage('please enter password with minimum of 6 character'),
    check(
        'passwordConfirmation',
        'passwordConfirmation field must have the same value as the password field',
    ).exists()
        .custom((value, { req }) => value === req.body.password)
        .withMessage('passwordConfirmation field must have the same value as the password field')],
    resetPassword);

router.use(checkAuth);

router.get('/getUser', (req, res, next) => {
    console.log('get user:');
    getUser(req, res, next);
});

router.put('/updateProfile', [
    check('email')
        .normalizeEmail()
        .isEmail().withMessage('please enter a valid email for you account.'),
    check('first_name')
        .not()
        .isEmpty().withMessage('please enter your first name.'),
    check('last_name')
        .not()
        .isEmpty().withMessage('please enter your last name.'),
], updateProfile);

router.put('/changePassword', [
    check('currentPassword').not()
        .isEmpty().withMessage('please your current password.'),
    check('newPassword').isLength({ min: 6 }).withMessage('please enter password with minimum of 6 character'),
    check(
        'passwordConfirmation',
        'passwordConfirmation field must have the same value as the password')
        .exists()
        .custom((value, { req }) => value === req.body.newPassword)
        .withMessage('passwordConfirmation field must have the same value as the new password'),
], changePassword);

router.post('/logout', (req, res, next) => {
    handleLogout(req, res, next);
});

router.post('/refresh', (req, res, next) => {
    handleRefreshToken(req, res, next);
}); // all routes below this line will require authentication

export default router;