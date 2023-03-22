import { validationResult } from 'express-validator';
import bcrypt  from 'bcryptjs';
import dbClient from '../utils/db';
const User = require('../models/user');
import { v4 as uuidv4, } from 'uuid';
import redisClient from '../utils/redis';

class AuthController {


  static async postSignup(req, res) {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { email, password, firstName, lastName } = req.body;

    if (!email) {
      res.status(400).send({
        error: 'Missing email',
      });
      return;
    }
    if (!password) {
      res.status(400).send({
        error: 'Missing password',
      });
      return;
    }

    try {
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ message: 'Cet email est déjà utilisé.' });
      }
      console.log(password);

      const hashedPassword = await bcrypt.hash(password, 12); 
      const passwordUser = hashedPassword;
      const newUser = { email, passwordUser, firstName, lastName };
      const user = User(newUser);
      await user.save();

      delete user.passwordUser;
      return res.status(201).json({ errors: "false", message: 'Inscription réussie.', data: user });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ message: 'Erreur serveur.', error: error });
    }

  }

  static async postLogin(req, res) {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    const { email, password } = req.body;

    if (!email) {
      res.status(400).send({
        error: 'Missing email',
      });
      return;
    }
    if (!password) {
      res.status(400).send({
        error: 'Missing password',
      });
      return;
    }

    const logUser = await User.findOne({email});
    const hashedPassword = logUser.passwordUser;

    if (logUser) {
      const verificationPasswords = await  bcrypt.compare(password, hashedPassword);
      console.log(hashedPassword);
      console.log(verificationPasswords);
      if (verificationPasswords) {
        const token = uuidv4();
        const key = `blogauth-${token}`;
        await redisClient.set(key, logUser._id.toString(), 43200)
        delete logUser.passwordUser;
        return res.status(200).json({errors: "false", data: logUser, token: key});
      }
    }

    return res.status(401).json({errors: "true", message: "Nom d'utilisateur ou mot de passe incorrecte"});

  }

}

export default AuthController;

/*module.exports = {
    signup: signup
  };  */
