function displaytime()
{

    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();

    // Append zero in front of numbers<10
    m = m < 10? "0" + m : m;
    s = s < 10? "0" + s : s;

    var ampm = h >= 12? 'PM' : 'AM';

    // Convert hours to 12-hour format
    h = h == 0  ? 0 : h -= 12

    // Append zero in front of numbers<10
    h = h < 10? "0" + h : h;

    document.getElementById("dc").innerHTML= h + ":" + m + ":" + s + " " + ampm;

}

function darkMode()
{
    var element = document.body;
    element.classList.toggle("dark-mode");
}

document.getElementById("dc").innerHTML= "hello";
var text = document.getElementById("dc").innerHTML;

setInterval(displaytime, 1000);

// displaytime();


