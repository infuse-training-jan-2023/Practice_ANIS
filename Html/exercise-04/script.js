const user = {
    name: "Piyush Sharma",
    designation: "Senior Software Engineer",
    company: "Infuse Consulting",
    hobbies: ["Reading", "Listening to music", "Collecting stamps"]
}

/**
 * Use destructuting to log the following
*/

const printUserProfile = ({ name, designation, company, hobbies } = user) => {


    hobbies.forEach(string_operation)
    // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps
    console.log(name + " is a " +  designation + " at " + company + `. He likes ${hob}`);
}

let hob = ""
function string_operation(items, index, array)
{
    if(index == array.length-1)
    {
        hob += "and " + items;
    }
    else
    {
        hob += items + ", ";
    }
}

printUserProfile()

