import mysql from "mysql2";
import { Router } from "express";

const usuarios = Router();
let connection;

usuarios.use((req, res, next) => {
  const config = JSON.parse(process.env.MY_CONNECT)
  connection = mysql.createPool(config);
  next();
})
