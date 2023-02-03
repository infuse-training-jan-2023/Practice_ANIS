async function fetchPokemon(url)
{
    const response = await fetch(url);
    const data = await response.json();
    // console.log(data);
    loadMore(data.next);
    return data;
}


async function pokemonDetails(record)
{
    const response = await fetch(record.url);
    const data = await response.json();
    // console.log(data);
    details.push(data);
    createCards(data);

    return data;
}

function createCards(data)
{
    const main_container = document.querySelector("#main");
    // console.log(main_container);
    const card = document.createElement("div");
    card.classList = "card";
    const pokemon_card =
    `
        <img id="${data.id}" src=${data.sprites.front_default} alt="Avatar" style="width:100%" onmouseover="displayBackImg(${data.id},'${data.sprites.back_default}')" onmouseout="displayFrontImg(${data.id},'${data.sprites.front_default}')">
        <h1 class="pokemon-name">Name: ${data.name}</h1>
        <p id="weight_of_chacater">Weight: ${data.weight}</p>
        <p id="base_exp_of_chacater">Base_Exp: ${data.base_experience}</p>
        <p id="hp_of_chacater">HP: ${data.stats[0].base_stat}</p>
        <p><button id="know_more" value="${data.name}" onclick="moreDeatils(this.value)">Know More</button></p>
    `;
    card.innerHTML += pokemon_card;
    main_container.appendChild(card);
}


function sortBy(val)
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
        createCards(data)
    )
}

function displayBackImg(id, url)
{
    document.getElementById(id).src = url;
}

function displayFrontImg(id, url)
{
    document.getElementById(id).src = url;
}

async function moreDeatils(pokemonName)
{
    const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${pokemonName}`);
    const pokemon = await response.json();
    // console.log(pokemon)

    let iframe = document.getElementById('iframe');
    let iframeDoc = iframe.contentWindow;
    let species = iframeDoc.document.getElementById('species');
    let attack = iframeDoc.document.getElementById('attack');
    let defence = iframeDoc.document.getElementById('defence');
    let spAttack = iframeDoc.document.getElementById('spattack');
    let speed = iframeDoc.document.getElementById('speed');
    let move0 = iframeDoc.document.getElementById('moves0');
    let move1 = iframeDoc.document.getElementById('moves1');

    species.innerHTML = `Species: ${pokemon.species.name}`;
    attack.innerHTML = `Attack: ${pokemon.stats[1].base_stat}`;
    defence.innerHTML = `Defence: ${pokemon.stats[2].base_stat}`;
    spAttack.innerHTML = `Special Attack: ${pokemon.stats[3].base_stat}`;
    speed.innerHTML = `Speed: ${pokemon.stats[5].base_stat}`;
    move0.innerHTML = `Moves: ${pokemon.moves[0].move.name}`;
    move1.innerHTML = `Moves1: ${pokemon.moves[1].move.name}`;


    let sidePanel = document.getElementById('side-panel');
    if (sidePanel.style.display === "none")
    {
        sidePanel.style.display = "block";
    } else {
        sidePanel.style.display = "none";
    }
}

document.getElementById("search-bar").addEventListener("input", searchPokemon);

function searchPokemon()
{
    // Get the user input
    const input = document.getElementById("search-bar").value.toLowerCase();

    // Get all the Pokémon cards
    const pokemonCards = document.getElementsByClassName("card");
    console.log(pokemonCards);

    // Loop through all the cards and hide those that do not match the user input
    for (let i = 0; i < pokemonCards.length; i++) {
      const pokemonName = pokemonCards[i].getElementsByClassName("pokemon-name")[0].innerText.toLowerCase();
      if (pokemonName.includes(input)) {
        pokemonCards[i].style.display = "block";
      } else {
        pokemonCards[i].style.display = "none";
      }
    }
}


fetchPokemon('https://pokeapi.co/api/v2/pokemon').then(data =>

    data.results.forEach((result) =>
    {
        pokemonDetails(result)
    })

).catch(console.error());

let details = [];

function loadMore(nexturl)
{
    // Check if the user has scrolled to the bottom of the page
    window.onscroll = function()
    {
        if
        (
            window.innerHeight + window.scrollY >= document.body.offsetHeight - 200
        )
        {
            // Fetch additional content and append it to the page
            fetchPokemon(nexturl).then(data =>

                data.results.forEach((result) =>
                {
                    pokemonDetails(result)
                })

            ).catch(console.error());
        }
    };
}


