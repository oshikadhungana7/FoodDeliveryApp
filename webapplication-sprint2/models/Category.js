const mongoose = require('mongoose')

const categorySchema = mongoose.Schema({
    name : {
        type: String,
        required: [true, 'Category name is required']
        
    },
    food: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'food'
    }]
})

module.exports = mongoose.model('Category', categorySchema)