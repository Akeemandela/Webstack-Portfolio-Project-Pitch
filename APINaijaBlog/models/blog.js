import { mongoose } from 'mongoose';

const blogSchema = new mongoose.Schema({

    title: {
        type: String,
        required: true 
    },
    snippet: {
        type: String,
        required: true
    },
    body: {
        type: String,
        required: true
    },
    createdAt: {
        type: Date,
        default: Date.now,
      },
});

const Blog = mongoose.model('Blog', blogSchema);

module.exports = Blog;