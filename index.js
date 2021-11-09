//Основной файл MAIN
const express = require('express')
const mongoose = require('mongoose')
const exphbs = require('express-handlebars')
const hotelRoutes = require('./routes/Hotels')
const path = require('path')

const PORT = process.env.PORT || 3000

const app = express()
const hbs = exphbs.create({
    defaultLayout: 'main',
    extname: 'hbs'
})

app.engine('hbs', hbs.engine)
app.set('view engine', 'hbs')
app.set('views', 'views')

app.use(express.urlencoded({ extended: true }))
app.use(hotelRoutes)

app.use(express.static(path.join(__dirname, 'public')))


async function start() {
    try{
        await mongoose.connect(
            'mongodb+srv://VladRadkevich:28022003@cluster0.vieea.mongodb.net/booking',
            {
            useNewUrlParser: true,
            //useFindAndModify: false
        })
        app.listen(PORT, () => {
            console.log('Server has been started...')
        })
    } catch(e){
        console.log(e)
    }
}


start()