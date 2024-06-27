import { NextFunction, Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";
import env from "../env";
const prisma = new PrismaClient();
async function IsAdmin(req: Request, res: Response, next: NextFunction) {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ message: "No token provided" });
  }
  const tokenWithoutBearer = token?.split(" ")[1] || "";
  const decoded: any = jwt.verify(tokenWithoutBearer, env.SECRET);

  if (!decoded || !decoded.id) {
    return res.status(401).json({
      msg: "Error while decoding the token",
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
    return res.status(401).json({
      message: "Only admin can use this function",
    });
  }
}

export default IsAdmin;
