import express from "express";

const app = express();
const port = 8080;

app.get("/", (req, res) => {
  res.sendFile('index.html');
});

app.listen(port, () => {
  console.log(`Listening on port ${port}...`);
});