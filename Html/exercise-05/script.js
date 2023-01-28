async function fetchpokemon(url)
{
    const response = await fetch(url);
    const data = await response.json();
    // console.log(data);
    load_more(data.next);
    return data;
}


async function pokemon_details(record)
{
    const response = await fetch(record.url);
    const data = await response.json();
    // console.log(data);
    details.push(data);
    create_cards(data);

    return data;
}

function create_cards(data)
{
    const main_container = document.querySelector("#main");
    // console.log(main_container);
    const card = document.createElement("div");
    card.classList = "card";
    const pokemon_card =
    `
        <img id="${data.id}" src=${data.sprites.front_default} alt="Avatar" style="width:100%" onmouseover="show_backimg(${data.id},'${data.sprites.back_default}')" onmouseout="show_frontimg(${data.id},'${data.sprites.front_default}')">
        <h1 class="pokemon-name">Name: ${data.name}</h1>
        <p id="weight_of_chacater">Weight: ${data.weight}</p>
        <p id="base_exp_of_chacater">Base_Exp: ${data.base_experience}</p>
        <p id="hp_of_chacater">HP: ${data.stats[0].base_stat}</p>
        <p><button id="know_more" value="${data.name}" onclick="more_deatils(this.value)">Know More</button></p>
    `;
    card.innerHTML += pokemon_card;
    main_container.appendChild(card);
}


function sort_by(val)
{
    var ac = 0;
    ac = val;
    if(ac == 1)
    {
        details.sort((a, b) => a.weight - b.weight);
    }
    else if(ac == 2)
    {
        details.sort((a, b) => a.base_experience - b.base_experience);
    }
    else
    {
        details.sort((a, b) => a.stats[0].base_stat - b.stats[0].base_stat);
    }

    const elements = document.getElementsByClassName("card");
    while(elements.length > 0)
    {
        elements[0].parentNode.removeChild(elements[0]);
    }

    details.forEach
    (data =>
        create_cards(data)
    )
}

function show_backimg(id, url)
{
    document.getElementById(id).src = url;
}

function show_frontimg(id, url)
{
    document.getElementById(id).src = url;
}

async function more_deatils(pokemonName)
{
    const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${pokemonName}`);
    const pokemon = await response.json();
    // console.log(pokemon)

    var iframe = document.getElementById('iframe');
    var iframeDoc = iframe.contentWindow;
    var species = iframeDoc.document.getElementById('species');
    var attack = iframeDoc.document.getElementById('attack');
    var defence = iframeDoc.document.getElementById('defence');
    var spattack = iframeDoc.document.getElementById('spattack');
    var speed = iframeDoc.document.getElementById('speed');
    var move0 = iframeDoc.document.getElementById('moves0');
    var move1 = iframeDoc.document.getElementById('moves1');

    species.innerHTML = `Species: ${pokemon.species.name}`;
    attack.innerHTML = `Attack: ${pokemon.stats[1].base_stat}`;
    defence.innerHTML = `Defence: ${pokemon.stats[2].base_stat}`;
    spattack.innerHTML = `Special Attack: ${pokemon.stats[3].base_stat}`;
    speed.innerHTML = `Speed: ${pokemon.stats[5].base_stat}`;
    move0.innerHTML = `Moves: ${pokemon.moves[0].move.name}`;
    move1.innerHTML = `Moves1: ${pokemon.moves[1].move.name}`;


    var sidepanel = document.getElementById('side-panel');
    if (sidepanel.style.display === "none")
    {
        sidepanel.style.display = "block";
    } else {
        sidepanel.style.display = "none";
    }
}

document.getElementById("search-bar").addEventListener("input", searchPokemon);

function searchPokemon()
{
    const input = document.getElementById("search-bar").value.toLowerCase();
    const pokemonCards = document.getElementsByClassName("card");
    for (let i = 0; i < pokemonCards.length; i++) {
      const pokemonName = pokemonCards[i].getElementsByClassName("pokemon-name")[0].innerText.toLowerCase();
      if (pokemonName.includes(input)) {
        pokemonCards[i].style.display = "block";
      } else {
        pokemonCards[i].style.display = "none";
      }
    }
}


fetchpokemon('https://pokeapi.co/api/v2/pokemon').then(data =>

    data.results.forEach((result) =>
    {
        pokemon_details(result)
    })

).catch(console.error());

var details = [];

function load_more(nexturl)
{

    window.onscroll = function()
    {
        if
        (
            window.innerHeight + window.scrollY >= document.body.offsetHeight - 200
        )
        {

            fetchpokemon(nexturl).then(data =>

                data.results.forEach((result) =>
                {
                    pokemon_details(result)
                })

            ).catch(console.error());
        }
    };
}


