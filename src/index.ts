import express, { Request, Response } from "express";
import dotenv from "dotenv";
import cors from "cors";
import env from "./env";
import { ErrorHandler, handleNotFound } from "./middlewares/Error";
import { PrismaClient } from "@prisma/client";
import userRouter from "./routes/User";
import productRouter from "./routes/Product";
import AuthRouter from "./routes/GoogleSignIn";
import path from "path";

import cookieParser from "cookie-parser";
import session from "express-session";
import passport from "passport";

dotenv.config();
const app = express();
const prisma = new PrismaClient();

const PORT = process.env.PORT;

let clienthost = "http://localhost:3000";
if (env.NODE_ENV !== "development") {
  clienthost = `${env.CLIENT_HOST}`;
}

const corsOptions = {
  origin: ["http://www.baitalkwt.com", "http://localhost:3000"],
  optionsSuccessStatus: 200,
  credentials: true,
};
app.use(express.static(path.join(__dirname, "../public/assets")));
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ extended: true, limit: "50mb" }));
app.use(cors(corsOptions));

app.use(cookieParser());

app.use(
  session({
    name: "ecommerce",
    secret: "keyboard_cat",
    resave: false,
    saveUninitialized: true,
  })
);
app.use(passport.authenticate("session"));
app.use(passport.initialize());
app.use(passport.session());
app.get("/", (request: Request, response: Response) => {
  response.status(200).send("Hello World");
});
app.use("/api/user", userRouter);
app.use("/api/product", productRouter);
app.use("/api/auth", AuthRouter);

app.use(handleNotFound);
app.use(ErrorHandler);

async function main() {
  app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
  });
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
