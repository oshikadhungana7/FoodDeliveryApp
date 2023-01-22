const food = require('../models/food');

const getAllfood = (req, res, next) => {
    food.find()
        .then((food) => {
            res.json(food)
        }).catch(next)
}

const createfood = (req, res, next) => {
    let food = {
        name: req.body.name,
        price: req.body.price,
        // owner: req.user.id,
        description: req.body.description
    }
    Plant.create(food)
        .then((food) => {
            res.status(201).json(food)
        }).catch(next)
}

const deleteAllfood = (req, res, next) => {
    food.deleteMany()
        .then((status) => {
            res.json(status)
        }).catch(next)
}

const getfoodById = (req, res, next) => {
    food.findById(req.params.id)
        .populate('category')
        .then((food) => {
            res.json(food)
        }).catch(next)
}

const updatefoodById = (req, res, next) => {
    food.findById(req.params.id)
        .then(food => {
            if (food.owner != req.user.id) {
                res.status(403)
                return next(new Error('Not allowed'))
            }
            food.name = req.body.name ? req.body.name : food.name
            food.price = req.body.name ? req.body.name : food.name
            // book.category = req.body.category ? req.body.category : book.category
            food.save().then(food => res.json(food)).catch(next)
        }).catch(next)

    // Plant.findByIdAndUpdate(req.params.plant_id, { $set: req.body }, { new: true })
    //     .then((plant) => {
    //         res.json(plant)
    //     }).catch(next)
}

const deletefoodById = (req, res, next) => {
    food.findByIdAndDelete(req.params.id)
        .then((food) => {
            res.json(food)
        }).catch(next)
}

module.exports = {
    getAllfood,
    createfood,
    deleteAllfood,
    getAllfood,
    updatefoodById,
    deletefoodById
}