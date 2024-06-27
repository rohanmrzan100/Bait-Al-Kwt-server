import { cleanEnv, port, str } from "envalid";
import * as dotenv from "dotenv";

dotenv.config();
const env = cleanEnv(process.env, {
  PORT: port(),
  DATABASE_URL: str(),
  CLIENT_HOST: str(),
  NODE_ENV: str(),
  SECRET: str(),
  GOOGLE_CLIENT_ID: str(),
  GOOGLE_CLIENT_SECRET: str(),
  BASE_URL: str(),
});
export default env;
