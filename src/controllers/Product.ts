import { PrismaClient } from "@prisma/client";
import { RequestHandler } from "express";
import env from "../env";
const prisma = new PrismaClient();

let BASE_URL = "http://localhost:5000";
if (env.NODE_ENV !== "development") {
  BASE_URL = `${env.BASE_URL}`;
}

// @route      /api/product/create
// @desc       register users
// @auth       private

interface imagesInterface {
  color: string;
  colorCode: string;
  image: string;
}
interface CreateProductBody {
  name: string;
  price: string;
  category: string;
  description: string;
  inStock: boolean;
  images: imagesInterface[];
}

export const createProduct: RequestHandler<
  unknown,
  unknown,
  CreateProductBody,
  unknown
> = async (req, res, next) => {
  try {
    const body = req.body;

    const files = req.files as Express.Multer.File[];
    console.log(files);

    const createProductBody: CreateProductBody = {
      name: body.name,
      price: body.price,
      category: body.category,
      description: body.description,
      inStock: body.inStock, // Convert to boolean
      images: [],
    };
    // Dynamically extract color-related properties
    const colorIndices: string[] = [];
    Object.keys(body).forEach((key) => {
      const match = key.match(/^color-(\d+)$/);
      if (match) {
        colorIndices.push(match[1]);
      }
    });

    colorIndices.forEach((index) => {
      const colorKey = `color-${index}` as keyof CreateProductBody;
      const colorCodeKey = `colorCode-${index}` as keyof CreateProductBody;
      const color = body[colorKey];
      const colorCode = body[colorCodeKey];
      const image = files.find(
        (file) => file.fieldname === `images-${index}`
      )?.filename;

      if (color && colorCode && image) {
        createProductBody.images.push({
          color: color as string,
          colorCode: colorCode as string,
          image,
        });
      }
    });

    await prisma.product.create({
      data: {
        name: createProductBody.name,
        price: parseFloat(createProductBody.price),
        category: createProductBody.category,
        description: createProductBody.description,
        inStock: true,
        image: {
          create: createProductBody.images.map((img) => ({
            image: BASE_URL + "/" + img.image,
            color: img.color,
            colorCode: img.colorCode,
          })),
        },
      },
    });

    res.status(201).json({ msg: "Product created sucessfully !" });
  } catch (error) {
    next(error);
  }
};

export const GetAllProducts: RequestHandler = async (req, res, next) => {
  try {
    const products = await prisma.product.findMany({
      include: {
        image: true, // Include related images
        review: true,
      },
    });
    res.status(200).json(products);
  } catch (error) {
    next(error);
  }
};

export const ToggleStock: RequestHandler = async (req, res, next) => {
  try {
    const { id, inStock } = req.body;

    if (!id || inStock === undefined) {
      return res.status(400).json({ msg: "Please provide all required data" });
    }

    const product = await prisma.product.findUnique({
      where: { id: id },
    });

    if (!product) {
      return res.status(404).json({ msg: "Product not found" });
    }

    await prisma.product.update({
      where: {
        id: id,
      },
      data: {
        inStock: !inStock,
      },
    });
    res.status(200).json({ msg: "Product Updated sucessfully !" });
  } catch (error) {
    next(error);
  }
};

export const DeleteProduct: RequestHandler = async (req, res, next) => {
  try {
    const { id } = req.body;

    if (!id) {
      return res.status(400).json({ msg: "Please provide all required data" });
    }

    const product = await prisma.product.findUnique({
      where: { id: id },
    });

    if (!product) {
      return res.status(404).json({ msg: "Product not found" });
    }

    await prisma.product.delete({
      where: {
        id: id,
      },
    });
    res.status(200).json({ msg: "Product Deleted sucessfully !" });
  } catch (error) {
    next(error);
  }
};

export const GetProductById: RequestHandler = async (req, res, next) => {
  try {
    const { id } = req.body;

    if (!id) {
      return res.status(400).json({ msg: "Please provide all required data" });
    }

    const product = await prisma.product.findUnique({
      where: { id: id },
      include: {
        image: true,
        review: true,
      },
    });

    if (!product) {
      return res.status(404).json({ msg: "Product not found" });
    }

    res.status(200).json({ msg: "Product retrived sucessfully !", product });
  } catch (error) {
    next(error);
  }
};

export const GetProductByCategory: RequestHandler = async (req, res, next) => {
  try {
    const { id } = req.params;

    const product = await prisma.product.findMany({
      where: { category: id },
      include: {
        image: true,
        review: true,
      },
      take: 8,
    });

    if (!product) {
      return res.status(404).json({ msg: "Product not found" });
    }

    res.status(200).json({ msg: "Product Retrived sucessfully !", product });
  } catch (error) {
    next(error);
  }
};

export const GetProductByFilter: RequestHandler = async (req, res, next) => {
  try {
    const { color, category, sort, searchTerm } = req.body;

    const products = await prisma.product.findMany({
      where: {
        AND: [
          searchTerm
            ? {
                name: {
                  contains: searchTerm,
                },
              }
            : {},
          category?.length
            ? {
                category: {
                  in: category,
                },
              }
            : {},
          color?.length
            ? {
                image: {
                  some: {
                    color: {
                      in: color,
                    },
                  },
                },
              }
            : {},
        ],
      },
      include: {
        image: true,
        review: true,
      },
      orderBy: {
        price:
          sort === "Low to High"
            ? "asc"
            : sort === "High to Low"
            ? "desc"
            : undefined,
        createdAt: sort === "Newest" ? "desc" : undefined,
      },
      take: 10,
    });

    res.status(200).json({ msg: "Product Retrieved successfully!", products });
  } catch (error) {
    next(error);
  }
};


interface EditProductBody {
  id: string;
  name: string;
  price: number;
  description: string;
  inStock: boolean;
}

export const EditProduct: RequestHandler<
  unknown,
  unknown,
  EditProductBody,
  unknown
> = async (req, res, next) => {
  try {
    const { id, name, price, description, inStock } =
      req.body as EditProductBody;

   
    console.log({ body: req.body });

    const updatedProduct = await prisma.product.update({
      where: { id },
      data: {
        name,
        price,
        description,
        inStock,
      },
    });

    console.log("Product updated:", updatedProduct);

    res.status(200).json({ msg: "Product updated successfully!" });
  } catch (error) {
    console.error("Error updating product:", error);
    next(error); // Pass error to the next middleware or error handler
  }
};
