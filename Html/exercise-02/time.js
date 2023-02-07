function displaytime()
{

    const today = new Date();
    let h = today.getHours();
    let m = today.getMinutes();
    let s = today.getSeconds();

    // Append zero in front of numbers<10
    m = m < 10? "0" + m : m;
    s = s < 10? "0" + s : s;

    let ampm = h >= 12? 'PM' : 'AM';

    // Convert hours to 12-hour format
    h = h == 0  ? 0 : h -= 12

    // Append zero in front of numbers<10
    h = h < 10? "0" + h : h;

    document.getElementById("dc").innerHTML= h + ":" + m + ":" + s + " " + ampm;

}

function toogleDarkMode()
{
    const element = document.body;
    element.classList.toggle("dark-mode");
}

document.getElementById("dc").innerHTML= "hello";
const text = document.getElementById("dc").innerHTML;

setInterval(displaytime, 1000);
