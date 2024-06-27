import { RequestHandler } from "express";
import { PrismaClient, User } from "@prisma/client";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import env from "../env";
import passport from "passport";
import { Strategy as LocalStrategy } from "passport-local";
import { user } from "../types/costom";
const prisma = new PrismaClient();

// @route      /api/user/register
// @desc       register users
// @auth       public
interface registerBody {
  name: string;
  email: string;
  password: string;
}

export const register: RequestHandler<
  unknown,
  unknown,
  registerBody,
  unknown
> = async (req, res, next) => {
  try {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
      return res.status(400).json({
        msg: "Please provide all required data",
      });
    }
    const checkUser = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });
    if (checkUser)
      return res.status(400).json({ msg: "Email is already taken." });

    const salt = bcrypt.genSaltSync(10);
    const Hashpassword = bcrypt.hashSync(password, salt);

    await prisma.user.create({
      data: {
        name: name,
        email: email,
        password: Hashpassword,
        role: email.trim() === "rohanmrzan100@gmail.com" ? "admin" : "user",
      },
    });

    res.status(201).json({ msg: "Register success" });
  } catch (error) {
    next(error);
  }
};

// @route      /api/user/login
// @desc       login users
// @auth       public

passport.use(
  new LocalStrategy(
    {
      usernameField: "email",
      passwordField: "password",
    },
    async (email, password, done) => {
      try {
        const user = await prisma.user.findUnique({
          where: { email: email },
        });
        if (!user) {
          return done(null, false, { message: "Incorrect email." });
        }
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
          return done(null, false, { message: "Incorrect password." });
        }
        return done(null, user);
      } catch (err) {
        return done(err);
      }
    }
  )
);

passport.serializeUser(function (user, cb) {
  process.nextTick(function () {
    cb(null, user);
  });
});

passport.deserializeUser(function (user: any, cb) {
  process.nextTick(function () {
    return cb(null, user);
  });
});
interface loginBody {
  email: string;
  password: string;
}
export const login: RequestHandler<unknown, unknown, loginBody> = async (
  req,
  res,
  next
) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ msg: "Please provide all required data" });
    }
    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });
    if (!user)
      return res
        .status(400)
        .json({ msg: "User not found please sign in first." });

    passport.authenticate("local", (err: any, user: User, info: any) => {
      if (err) {
        return next(err);
      }
      if (!user) {
        return res.status(400).json({ msg: info.message });
      }
      req.logIn(user, (err) => {
        if (err) {
          return next(err);
        }
        const token = jwt.sign({ id: user.id, name: user.name }, env.SECRET, {
          expiresIn: "1d",
        });

        res.cookie("token", token, {
          httpOnly: true,
          maxAge: 24 * 60 * 60 * 1000,
        });
        return res.status(200).json({
          msg: "Login Successful",
          user: user,
        });
      });
    })(req, res, next);
  } catch (error) {
    next(error);
  }
};
// @route      /api/user/create-admin
// @desc       login users
// @auth       protected

interface loginBody {
  email: string;
}
export const CreateAdmin: RequestHandler<unknown, unknown, loginBody> = async (
  req,
  res,
  next
) => {
  try {
    const { email } = req.body;
    if (!email) {
      return res.status(400).json({ msg: "Please provide all required data" });
    }
    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });
    if (!user)
      return res
        .status(400)
        .json({ msg: "User not found please sign in first." });

    await prisma.user.update({
      where: {
        email: email,
      },
      data: {
        role: "admin",
      },
    });

    return res.status(200).json({
      msg: "Admin creating successful.",
    });
  } catch (error) {
    next(error);
  }
};
// @route      /api/user/delete-all-users
// @desc       login users
// @auth       public

export const deleteAllUsers: RequestHandler = async (req, res, next) => {
  try {
    await prisma.user.deleteMany();

    return res.status(200).json({
      msg: "deleting Successful",
    });
  } catch (error) {
    next(error);
  }
};
