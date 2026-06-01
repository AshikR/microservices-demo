const app = require("express")();
const { randomBytes } = require("crypto");
const bodyParser = require("body-parser");
const cors = require("cors");
const axios = require("axios");

const DB = {};

app.use(bodyParser.json());
app.use(
  cors({
    origin: process.env.CORS_ORIGIN || "http://localhost:3000",
  })
);

// Welcome route
app.get("/", (req, res) => {
  res.send("<h1>Welcome to post service</h1>");
});

// Create a post
app.post("/post/create", async (req, res) => {
  const id = randomBytes(4).toString("hex");
  const { title } = req.body;

  // Save to in-memory DB
  DB[id] = { id, title };

  // Tell event-bus a post was created
  try {
    await axios.post("http://event-bus:8005/events", {
      type: "postCreated",
      data: { id, title },
    });
  } catch (e) {
    return res.send(e).end();
  }

  return res.status(201).json({
    message: "post created successfully",
    data: DB[id],
  }).end();
});

// Get all posts
app.get("/posts", (req, res) => {
  res.status(200).json({ data: DB }).end();
});

// Debug route - see DB in browser
app.get("/db", (req, res) => {
  res.status(200).send(`
    <p>Post service DB</p>
    <pre>${JSON.stringify(DB, null, "\t")}</pre>
  `);
});

// Receive events from event-bus
app.post("/events", (req, res) => {
  res.send({}).end();
});

app.listen(8001, () => {
  console.log("listening on http://localhost:8001");
});
