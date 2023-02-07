const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;
const host = '0.0.0.0'

app.get('/', (req, res) => {
  res.send("<h1>Hello World</h1>");
})

app.listen(PORT, host, ()=> {console.log(`Listing to port ${PORT}`)});
