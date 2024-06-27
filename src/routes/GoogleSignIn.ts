import express from "express";
import passport from "passport";
import { Strategy as GoogleStrategy } from "passport-google-oauth20";
import { PrismaClient } from "@prisma/client";
import env from "../env";
const prisma = new PrismaClient();
import jwt from "jsonwebtoken";

let CALLBACK_URL = "http://localhost:5000/api/auth/google/callback";
let BASE_URL = "http://localhost:5000";
let CLIENT_URL = "http://localhost:3000";

passport.use(
  new GoogleStrategy(
    {
      clientID: env.GOOGLE_CLIENT_ID,
      clientSecret: env.GOOGLE_CLIENT_SECRET,
      callbackURL: CALLBACK_URL,
      scope: ["profile"],
      state: true,
    },
    async function (accessToken, refreshToken, profile, done) {
      try {
        //check if user exists in our db
        let user = await prisma.user.findUnique({
          where: {
            email: profile.emails?.[0].value,
          },
        });

        console.log(user);

        if (!user) {
          const user = await prisma.user.create({
            data: {
              name: profile.displayName,
              email: profile.emails?.[0].value || "",
              password: "",
              avatar: profile.photos?.[0].value || "",
            },
          });
          return done(null, user);
        }
        return done(null, user);
      } catch (error: any) {
        return done(error, undefined);
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

const router = express.Router();

router.get(
  `/google/callback`,
  passport.authenticate("google", {
    successReturnToOrRedirect: CLIENT_URL,
    failureRedirect: CLIENT_URL,
  })
);

router.get(
  "/google",
  passport.authenticate("google", {
    scope: ["profile", "email"],
    prompt: "select_account",
  })
);
router.get("/success", (req, res) => {
  if (req.user) {
    const token = jwt.sign(
      { id: req.user.id, name: req.user.name },
      env.SECRET,
      {
        expiresIn: "1d",
      }
    );

    res.cookie("token", token, {
      httpOnly: false,
      maxAge: 24 * 60 * 60 * 1000,
      path: "/",
      domain: "localhost",
      secure: true,
    });
    res.status(200).json({
      message: "successful",
      user: req.user,
    });
  } else {
    res.status(401).json({ msg: "User not Authorized .Login First" });
  }
});

router.delete("/logout", (req, res, next) => {
  res.clearCookie("ecommerce");
  res.clearCookie("token");
  req.logOut(function (err) {
    if (err) {
      console.error("Error logging out:", err);
      return next(err);
    }
    req.session.destroy(function (err) {
      if (err) {
        console.error("Error logging out:", err);
        return next(err);
      }
      res.send();
    });
  });
});
export default router;
