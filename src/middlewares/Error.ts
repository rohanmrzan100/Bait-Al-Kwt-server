import { Request, Response, NextFunction } from "express";

export const ErrorHandler = (
  error: unknown,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let errorMessage = "An error in server has occurred";
  if (error instanceof Error) {
    errorMessage = error.message;
    console.log(error);
  }

  return res.status(500).json({ error: errorMessage });
};

export const handleNotFound = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  next(Error("Endpoint not found"));
};
