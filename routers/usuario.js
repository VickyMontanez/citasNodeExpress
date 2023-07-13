import mysql from "mysql2";
import { Router } from "express";

const usuarios = Router();
let connection;

usuarios.use((req, res, next) => {
  const config = JSON.parse(process.env.MY_CONNECT)
  connection = mysql.createPool(config);
  next();
});


usuarios.get("/", (req, res) => {
    connection.query('SELECT * FROM `usuario` ORDER BY nombre ASC', (err, result, fil) => {
        res.end(JSON.stringify(result));
    })
});


usuarios.get("/:id", (req, res) => {
    const userId = req.params.id;

    connection.query(
        "SELECT * FROM usuario WHERE id = ?",
        [userId],
        (err, result) => {
            if (err) {
                console.error("Error al obtener el usuario: ", err);
                return res.status(500).json({ mensaje: "Error al obtener el usuario" });
            }
            if (result.length === 0) {
                return res.status(404).json({ mensaje: "No se encontró el usuario" });
            }
            const User = result[0];
            return res.json(User);
        }
    );
});


usuarios.post("/", (req, res) => {
    const { usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usar, usu_segdo_apellido_usar, usu_telefono, usu_direccion, usu_email, usu_genero, usu_acudiente} = req.body;

    connection.query(
        'INSERT INTO `usuario`(usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usar, usu_segdo_apellido_usar, usu_telefono, usu_direccion, usu_email, usu_genero, usu_acudiente) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usar, usu_segdo_apellido_usar, usu_telefono, usu_direccion, usu_email, usu_genero, usu_acudiente],
        (err, result, fields) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Error al insertar en la base de datos");
            } else {
                res.end("Los datos fueron insertados con exito en la base de datos");
            }
        });
});

/* Actualizar un User por el ID */
usersStorage.put("/:id", (req, res) => {
    const userId = req.params.id;
    const {id, nombre, email, email_verified_at, estado, created_by, update_by, foto, password, deleted_at} = req.body;

    connection.query(
        "UPDATE users SET id = ?, nombre = ?, email = ?, email_verified_at = ?, estado = ?, created_by = ?, update_by = ?, foto = ?, password = ?, created_at = NOW(), updated_at = NOW(), deleted_at = ? WHERE id = ?",
        [id, nombre, email, email_verified_at, estado, created_by, update_by, foto, password, deleted_at, userId],
        (err, result) => {
            if (err) {
                console.error("Error al actualizar el User: ", err);
                return res.status(500).json({ mensaje: "Error al actualizar el User" });
            }

            return res.json({ mensaje: "User actualizado exitosamente" });
        }
    );
});

/* Emilinar User por Id */
usersStorage.delete("/:id", (req, res) => {
    const userId = req.params.id;

    connection.query(
        "DELETE FROM users WHERE id = ?",
        [userId],
        (err, result) => {
            if (err) {
                console.error("Error al eliminar el User: ", err);
                return res.status(500).json({ mensaje: "Error al eliminar el User" });
            }

            return res.json({ mensaje: "User eliminado exitosamente" });
        }
    );
});

export default usersStorage;
