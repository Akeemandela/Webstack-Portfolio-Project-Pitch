import {
  Router,
} from 'express';
import AppController from '../controllers/AppController';
import AuthController from '../controllers/AuthController';

const router = Router();

// check status and stats of db
router.get('/status', AppController.getStatus);
router.get('/stats', AppController.getStats);

// Authenticate user
router.post('/signup', AuthController.postSignup);
router.post('/login', AuthController.postLogin);

// Create post and read post
router.post('/posts/create', AppController.postCreate);
router.get('/posts', AppController.postRead);

export default router;
