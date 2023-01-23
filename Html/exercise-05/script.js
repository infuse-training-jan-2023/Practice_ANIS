async function fetchdata(url)
{
    const response = await fetch(url);
    const data = await response.json();
    // console.log(data);
    // data.results.forEach((result) =>
    // {
    //     getimage(result);
    // });

    return data;

}


async function getimage(record)
{
    const response = await fetch(record.url);
    const data = await response.json();
    console.log(data);

    // console.log(main_container);

    const card = document.createElement("div");
    card.classList = "card";
    const pokemon_card =
    `
        <img id="${data.id}" src=${data.sprites.front_default} alt="Avatar" style="width:100%" onmouseover="show_backimg(${data.id},'${data.sprites.back_default}')" onmouseout="show_frontimg(${data.id},'${data.sprites.front_default}')">
        <h1 id="name_of_chacater">Name: ${record.name}</h1>
        <p id="weight_of_chacater">Weight: ${data.weight}</p>
        <p id="base_exp_of_chacater">Base_Exp: ${data.base_experience}</p>
        <p id="hp_of_chacater">HP: ${data.stats[0].base_stat}</p>
        <p><button id="know_more" value="0" onclick="">Know More</button></p>
    `;
    card.innerHTML += pokemon_card;
    main_container.appendChild(card);

    return data;


}


async function load_more_details(details)
{

    const response = await fetch(details.url);
    const data = await response.json();
    console.log(data.abilities[0].ability.name);

    hideToggle();
}


function show_backimg(id, url)
{
    document.getElementById(id).src = url;
}

function show_frontimg(id, url)
{
    document.getElementById(id).src = url;
}

function hideToggle()
{

    counter = document.getElementById("know_more").value;
    if (counter == 0)
    {
        document.getElementById("iframe").style.display = "none";
        document.getElementById("know_more").value = 1;
    }
    else
    {
        document.getElementById("iframe").style.display = "block";

        document.getElementById("know_more").value = 0;
    }
}

// function hideToggle(button, elem)
// {

//     $(button).toggle
//     (
//       function ()
//       {
//         $(elem).hide();
//       },
//       function ()
//       {
//         $(elem).show();
//       }
//     );
// }







var btn_know_more = document.getElementsByClassName(".know_more");
var ifrm = document.getElementsByClassName(".iframe");

// hideToggle(btn_know_more, ifrm);



const main_container = document.querySelector("#main");

const iframe = document.createElement("div");
    iframe.classList = "iframe";

    const more_info =
    `
        <iframe id="iframe" src="" frameborder="1"
        srcdoc=
        "

            <p>Species: </p>

            Stats
            <p>Attack: </p>
            <p>Defense: </p>
            <p>Special Attack: </p>
            <p>Speed: </p>

            <p>Forms: </p>
            <p>Moves0: </p>
            <p>Moves1: </p>
        "
        >
        </iframe>
    `;
    iframe.innerHTML += more_info;
    main_container.appendChild(iframe);

var second_obj;
var id_arr = [];

fetchdata('https://pokeapi.co/api/v2/pokemon').then(data =>
{

    data.results.forEach((result) =>
    {
        getimage(result).then(data =>
        {

            // data.results.forEach((result) =>
            // {
            //     console.log(result);
            // });

            // console.log(data.id);
            id_arr.push(data.id);


        }
        );

    });

    // const response =  fetch(data.url);
    // const newdata =  response.json();
}
);


id_arr.forEach(id =>
{
    console.log("id array " + id[0]);
});



// ------------------- Need to be completed -------------------

// const resArray = [];
    // for (const [key, value] of Object.entries(data))
    // {
    //     resArray.push([`${key}`, `${value}`]);

    // }


    // for (let i = 0; i < resArray.length; i++)
    // {
    //     console.log("elements " + resArray[i][0]);
    //     console.log("elements " + resArray[i][1]);
    // }


// var sort_value = document.getElementById("sort_value");

// function sortvalue(val)
// {
//     val = sort_optn.value;
//     console.log(val);
// }
