import express from "express";
import {
  CreateAdmin,
  deleteAllUsers,
  login,
  register,
} from "../controllers/User";
import IsAdmin from "../middlewares/isAdmin";

const router = express.Router();

router.post("/register", register);
router.post("/login", login);



router.delete("/delete-all-users", deleteAllUsers);


///protected Routes
router.post("/create-admin",  CreateAdmin);


export default router;
