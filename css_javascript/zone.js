function gestoreEvidenzia(name){
    var x= name.substr(0,15);
    if (x == "iniziomessaggio"){
        var y= name.replace("iniziomessaggio", "salute");
        var z= document.getElementById(y);
    } else {
        var z= document.getElementById(name);
    }
    z.style.color="red";
}

function gestoreDisEvidenzia(name){  
    var x= name.substr(0,15);
    if (x == "iniziomessaggio"){
        var y= name.replace("iniziomessaggio", "salute");
        var z= document.getElementById(y);
    } else {
        var z= document.getElementById(name);
    }
    z.style.color="#faebd7";
                                    
}