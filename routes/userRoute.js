const express = require("express");
const userRouter = express.Router();
const suscripcionController = require("../services/suscriptionController");
const userController = require("../services/userController");


userRouter.get("/", async function (req, res, next) {
  try {
    res.json(await suscripcionController.getSuscripcion(req.query.page));
  } catch (err) {
    console.error(`Error while getting programming languages `, err.message);
    next(err);
  }
});


userRouter.post("/", async function (req, res, next) {
  try {
    res.json(await userController.createUser(req.body));
  } catch (err) {
    console.error(`Error while creating programming language`, err.message);
    next(err);
  }
});

userRouter.post("/confirm_suscription", async function (req, res, next) {
  try {
    res.json(await userController.confirm_suscription(req.body));
  } catch (err) {
    console.error(`Error while creating programming language`, err.message);
    // next(err);
     res.json({success: false, errors: 'Failed To Create User'});

  }
});

userRouter.post("/login", async function (req, res, next) {
  try {
    res.json(await userController.login(req.body));
  } catch (err) {
    console.error(`Error while creating programming language`, err.message);
    next(err);
  }
});



module.exports = userRouter;
