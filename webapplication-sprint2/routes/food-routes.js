const express = require('express')
const router = express.Router()
const foodController = require('../controllers/food-controller')
const reviewController = require('../controllers/review-controller')
const { verifyUser, verifyManager, verifyAdmin } = require('../middelware/auth')


router.route('/')
    .get(foodController.getAllfood)
    .post(verifyUser, foodController.createfood)
    .put((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .delete(verifyAdmin, foodController.deleteAllfood)

    router.route('/:id')
    .get(foodController.getfoodById)
    .post((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .put(foodController.updatefoodById)
    .delete(verifyAdmin, foodController.deletefoodById)

router.route('/:id/reviews')
    .get(reviewController.getAllReviews)
    .post(verifyUser,reviewController.createReview)
    .put((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .delete(verifyAdmin, reviewController.deleteAllReviews)

router.route('/:id/reviews/:review_id')
    .get(reviewController.getReviewById)
    .post((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .put(reviewController.updateReviewById)
    .delete(reviewController.deleteReviewById)

module.exports = router