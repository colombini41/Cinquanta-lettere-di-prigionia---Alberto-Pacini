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


function allinea (name){
    document.getElementById(name).scrollIntoView({block: "center"});
}


function visualizzaImmagine(src){

    var imm = src;
    console.log(imm);
    var path = "../Immagini/image/" + imm;

    window.open(path);

}


function visualizzaImm(name){
    var zone = document.getElementById(name).id;
    var zona = "zona_" + zone;
    
    var dati = zona.slice(-3);
    console.log(dati);
    var num = dati.slice(-3, -1);
    var lato = dati.slice(-1);

    console.log(lato);
    console.log(num);

    var path = "../Immagini/image/" + num + lato + ".png";

    window.open(path);
}