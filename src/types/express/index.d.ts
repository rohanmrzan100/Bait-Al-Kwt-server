import { Request, Response } from "express";

export interface IUser {
    id: string;
    email: string;
    name: string;
    password: string;
    avatar: string | null;
    role: Role;
    createdAt: Date;
  }

declare global {
  namespace Express {
    interface User extends IUser {} // Extending User interface with IUser
    interface Request {
      user?: User; // Make sure to include this line to define the user property in Request
    }
  }
}
