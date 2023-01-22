const food = require('../models/food')
const Plant = require('../models/food')

const getAllReviews = (req, res, next) => {
    food.findById(req.params.id)
    .then((food) => {
        res.json(food.reviews)
    }).catch(next)
}

const createReview = (req, res, next) => {
    food.findById(req.params.id)
    .then((food) => {
        food.reviews.push(req.body)
        food.save()
            .then((p) => res.status(201).json(p.reviews))
    }).catch(next)
}

const deleteAllReviews = (req, res, next) => {
    food.findById(req.params.id)
        .then((food) => {
            food.reviews = []
            food.save()
                .then(p => res.json(p.reviews))
        }).catch(next)
}

const getReviewById = (req, res, next) => {
    food.findById(req.params.id) 
        .then((food) => {
            let review = food.reviews
                .find((item) => item.id == req.params.review_id)
            res.json(review)
        }).catch(next)
}

const updateReviewById = (req, res, next) => {
    food.findById(req.params.id)
        .then(food => {
            let updatedReviews = food.reviews.map((item) => {
                if(item.id == req.params.review_id){
                    item.body = req.body.body //one body from schema
                }
                return item
            })
            food.reviews = updatedReviews
            food.save().then(p => res.json(p.reviews))
        }).catch(next)
}

const deleteReviewById = (req, res, next) => {
    food.findById(req.params.id)
        .then(food => {
            let deletedReviews = food.reviews.filter((item) => {
                return item.id != req.params.review_id
            })
            food.reviews = deletedReviews
            food.save().then(p => res.json(p.reviews))
        }).catch(next)
}

module.exports = {
    getAllReviews,
    createReview,
    deleteAllReviews,
    getReviewById,
    updateReviewById,
    deleteReviewById
}