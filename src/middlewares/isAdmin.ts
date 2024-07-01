import { NextFunction, Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";
import env from "../env"; // Ensure this is correctly imported

const prisma = new PrismaClient();

async function IsAdmin(req: Request, res: Response, next: NextFunction) {
  const token = req.headers.authorization;

  if (!token || !token.startsWith("Bearer ")) {
    return res.status(401).json({ message: "No token provided" });
  }

  const tokenWithoutBearer = token.split(" ")[1];
  console.log(tokenWithoutBearer);

  try {
    const decoded: any = jwt.verify(tokenWithoutBearer, env.SECRET);

    if (!decoded || !decoded.id) {
      return res.status(401).json({
        message: "Error while decoding the token",
      });
    }

    const user = await prisma.user.findUnique({
      where: {
        id: decoded.id,
      },
    });

    if (user && user.role === "admin") {
      next();
    } else {
      return res.status(403).json({
        message: "Only admin can use this function",
      });
    }
  } catch (error) {
    return res.status(401).json({
      message: "Invalid token",
    });
  }
}

export default IsAdmin;
