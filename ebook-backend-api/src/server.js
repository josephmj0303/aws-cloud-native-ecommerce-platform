require('dotenv-flow').config();
const app = require('./app');
const { connectDB } = require('./config/database');
const logger = require('../src/utils/logger');


(async () => {
  try {
    await connectDB();
    console.log("DB connected");
  } catch (err) {
    console.error("DB connection failed, starting server anyway:", err.message);
  }

  const PORT = process.env.PORT || 8080;

  app.listen(PORT, () => {
    console.log(`🚀 Server running on ${PORT}`);
  });
})();
