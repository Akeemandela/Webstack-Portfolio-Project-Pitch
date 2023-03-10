const express = require('express');
const morgan = require('morgan');
const mongoose = require('mongoose');

// express app

const app = express();

// Connect to MongoDB..... uncomment to connect to the Database
// const dbURI = 'mongodb+srv://swift:Magnetic123@alx-portfolio-project.fkxjfut.mongodb.net/alx-portfolio-project?retryWrites=true&w=majority'
// mongoose.connect(dbURI);

app.set('view engine', 'ejs');

app.use(express.static('public'));
// Listen for request
app.listen(3000);

app.get('/', (req, res) => {
    // res.send('<p>Home Page</p>')
    res.render('index', { title: 'Home'});
});

app.get('/about', (req, res) => {
    // res.send('<p>Home Page</p>')
    res.render('about', { title: 'About Page'});
});

app.get('/blogs/create', (req, res) => {
    // res.send('<p>Home Page</p>')
    res.render('create', { title: 'Create a New Blog'});
});

app.use((req, res) => {
    // res.send('<p>Home Page</p>')
    res.status(404).render('404', { title: '404'});
});
