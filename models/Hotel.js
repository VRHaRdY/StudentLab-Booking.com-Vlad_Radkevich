
//схема заполнения полей в API по добавлению отеля

const { Schema, model } = require('mongoose')

const schema = new Schema({
  title: {
    type: String,
    required: true
  },
  number_of_rooms:{
    type: String,
    required: true
  },
  hotel_image:{
    type: String,
    default: "/src/nophoto.png"
  },
  completed: {
    type: Boolean,
    default: false
  }
})

module.exports = model('Hotel', schema)