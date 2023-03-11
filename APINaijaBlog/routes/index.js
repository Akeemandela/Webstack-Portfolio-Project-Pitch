import {
  Router,
} from 'express';
import AppController from '../controllers/AppController';

const router = Router();

// check status and stats of db
router.get('/status', AppController.getStatus);
router.get('/stats', AppController.getStats);

export default router;
