import express from "express";
import {
  DeleteProduct,
  EditProduct,
  GetAllProducts,
  GetProductByCategory,
  GetProductByFilter,
  GetProductById,
  ToggleStock,
  createProduct,
} from "../controllers/Product";
import IsAdmin from "../middlewares/isAdmin";
import upload from "../utils/multer";

const router = express.Router();
router.get("/get-all-products", GetAllProducts);
router.post("/get-product", GetProductById);
router.get("/category/:id", GetProductByCategory);
router.post("/filter", GetProductByFilter);

///protected Routes
router.post("/create", IsAdmin, upload.any(), createProduct);
router.put("/toggle-in-stock", IsAdmin, ToggleStock);
router.delete("/delete-product", IsAdmin, DeleteProduct);
router.post("/update-product", IsAdmin, EditProduct);

export default router;
