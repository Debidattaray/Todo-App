import { Connection, createConnection, getConnection } from "typeorm";
import ormconfig from "../../ormconfig";
export const DBConnect = async () => {
  let connection: Connection | undefined;
  try {
    connection = getConnection();
  } catch (e) {}
  try {
    if (connection) {
      if (!connection.isConnected) {
        await connection.connect();
      }
    } else {
      await createConnection(ormconfig);
    }
    console.log("🌴 Database connection was successful!");
  } catch (e) {
    console.error("ERROR: Database connection failed!!", e);
    throw e;
  }
};

export const TryDBConnect = async () => {
  try {
    await DBConnect();
  } catch (e) {}
};
