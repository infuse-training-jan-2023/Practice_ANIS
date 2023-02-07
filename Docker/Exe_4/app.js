const moment = require("moment/moment");
var msg = "hello"
console.log(msg);
todays_date = moment().format('MMMM Do YYYY');
time = moment().format('h:mm:ss a');
console.log("Todays Date : " +todays_date+" and Time: "+time);

