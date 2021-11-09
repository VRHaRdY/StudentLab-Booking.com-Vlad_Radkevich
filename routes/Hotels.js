//Получение и предача данных об отеле
const { Router } = require('express')
const Hotel=require('../models/Hotel')
const router = Router()


router.get('/', async (req, res) => {
    const hotels = await Hotel.find({}).lean()
   // await Todo.find({}).lean()
    res.render('index', {
      title: 'Hotel list',
      isIndex: true,
      hotels
    })
})


router.get('/add', (req, res) => {
    res.render('add', {
      title: 'Add hotel',
      isAdd: true
    })
})

router.post('/add', async (req, res) => {
    const hotel = new Hotel({
      title: req.body.title,
      number_of_rooms: req.body.number_of_rooms,
      image: req.body.hotel_image
    })
  
    await hotel.save()
    res.redirect('/')
})

router.post('/complete', async(req,res)=>{
    const hotel = await Hotel.findById(req.body.id)
    hotel.completed = !!req.body.completed
    await hotel.save()

    res.redirect('/')
})

router.get('/delete', async (req, res) => {
  const hotels = await Hotel.find({}).lean()
 // await Todo.find({}).lean()
  res.render('delete', {
    title: 'Hotel list',
    isDelete: true,
    hotels
  })
})

router.post('/choose', async(req,res)=>{
  const hotel = await Hotel.findById(req.body.id)
  //hotel.completed = !!req.body.completed
  await hotel.delete()

  res.redirect('/delete')
})

module.exports = router