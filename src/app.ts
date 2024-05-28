import express, { Application, Request, Response } from "express";

const app: Application = express();

const port: number = 80;

console.log("HELLO FROM HERE");

app.get("/hello", (req: Request, res: Response) => {
  console.log("here");

  res.send("Hello World");
});

const server = app.listen(port, function () {
  console.log(`App is listening on port ${port} !`);
});

process.on("SIGTERM", () => {
  console.log("SIGTERM signal received: closing HTTP server");
  server.close(() => {
    console.log("HTTP server closed");
  });
});
