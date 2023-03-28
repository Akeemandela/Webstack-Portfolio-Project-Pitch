import express from 'express';
const mongoose = require('mongoose');
import router from './routes';
const { MongoClient, ServerApiVersion } = require('mongodb');
import { env, } from 'process';

const app = express();
const port = env.PORT || 6000;


app.use(express.json());
app.use(express.urlencoded());
app.use(router);


// Connect to MongoDB
//const username = env.DB_USERNAME || 'root';
//const password = env.DB_PASSWORD || '';
const host = env.DB_HOST || 'localhost';
const portdb = env.DB_PORT || 27017;
const dbName = env.DB_DATABASE || 'blognaija';
const uri = "mongodb+srv://hegeldirkk:IxbLtImLTzCyrx9r@cluster0.ffolp2x.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(`${uri}`, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 })
  .then(() => {
    console.log(`Connected to MongoDB ${portdb}`);
    app.listen(port, () => console.log(`Server running on port ${port}`));
  })
  .catch((err) => {
    console.error(err);
  });