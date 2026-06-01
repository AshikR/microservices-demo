const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const cors = require('cors');

const app = express();

app.use(bodyParser.json());
app.use(cors({
  origin: "*"
}));

const events = [];

app.post('/events', async (req, res) => {
  const event = req.body;
  events.push(event);
  console.log("Incoming Event", event.type);
  try {
    await Promise.all([
      axios.post('http://posts:8001/events', event),
      axios.post('http://comments:8002/events', event),
      axios.post('http://query:8003/events', event),
      axios.post('http://moderation:8004/events', event),
    ]);
    return res.send({}).end();
  } catch (e) {
    console.error(e.message);
    return res.status(500).send({ error: e.message }).end();
  }
});

app.get("/events", (req, res) => {
  res.send(events);
});

app.listen(8005, () => {
  console.log('listening on http://localhost:8005');
});
