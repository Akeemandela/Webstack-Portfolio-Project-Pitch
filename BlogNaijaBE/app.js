const express = require('express');
const morgan = require('morgan');
const mongoose = require('mongoose');
const Blog = require('./models/blog');

// express app

const app = express();

// Connect to MongoDB..... uncomment to connect to the Database
const dbURI = 'mongodb+srv://swift:Magnetic123@alx-project.fkxjfut.mongodb.net/alx-portfolio-project?retryWrites=true&w=majority'


mongoose.connect(dbURI)
    .then( () => app.listen(3000))
    
    .catch( (err) => {
        console.error(`Error connecting to the database. n${err}`);
    })

app.set('view engine', 'ejs');

app.use(express.static('public'));
app.use(express.urlencoded({extended: true}));

app.get('/', (req, res) => {
    res.redirect('/blogs');
    
});

app.get('/about', (req, res) => {
    // res.send('<p>Home Page</p>')
    res.render('about', { title: 'About Page'});
});

app.get('/blogs', (req, res) =>{
    Blog.find().sort( { createdAt: -1})
      .then((result) => {
        res.render('index', { title: 'All Blogs', blogs: result})
      })
      .catch((err) => {
        console.log(err);
      })
})
app.get('/blogs/create', (req, res) => {
    // res.send('<p>Home Page</p>')
    res.render('create', { title: 'Create a New Blog'});
});

app.post('/blogs', (req, res) => {
    const blog = new Blog(req.body);

    blog.save()
      .then((result) => {
        res.redirect('/blogs');
      })
      .catch((err) => {
        console.log(err);
      })
})

app.get('/blogs/:id', (req, res) =>{
    const id = req.params.id;
    Blog.findById(id)
      .then((result) => {
        res.render('details', { blog: result, title: 'Blog Details' });
      })
      .catch((err) => {
        res.status(404).render('404', { title: 'Blog not found'});
      });
     
       
})


app.delete('/blogs/:id', (req, res) =>{
    const id = req.params.id;
    Blog.findByIdAndDelete(id)
      .then((result) => {
        res.json({ redirect: '/blogs' });
      })
      .catch((err) => {
        console.log(err);
      });
     
       
})

app.use((req, res) => {
    // res.send('<p>Home Page</p>')
    res.status(404).render('404', { title: '404'});
});
