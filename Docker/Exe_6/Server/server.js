const express = require('express')
const cors = require('cors')
const app = express()

app.use(cors())

const PORT = process.env.PORT || 5000;

app.get("/api", (req, res) => {
    res.json({"users": ["userOne", "userTwo", "userThree", "userFour", "userFive"]})
})

app.listen(PORT, () => { console.log(`listening on port ${PORT}`)} )
