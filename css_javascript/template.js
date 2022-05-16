function funzioneHome (){
    SaxonJS.transform ({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "initial",
        logLevel:2
        }, "sync"
    );
    gestoreLoad();
    creazioneGalleria();
}

function funzione1943 () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "anteprime_1943",
        logLevel:2
        }, "sync"
    );
    lettere = document.querySelectorAll(".div_anteprima");
    console.log(lettere);
    lettere.forEach(function(lettera){
        lettera.onclick = funzioneVisualizzaLettera;
    });
}

function funzione1944 () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "anteprime_1944",
        logLevel:2
        }, "sync"
    );
    lettere = document.querySelectorAll(".div_anteprima");
    console.log(lettere);
    lettere.forEach(function(lettera){
        lettera.onclick = funzioneVisualizzaLettera;
    });
}

function funzione1945 () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "anteprime_1945",
        logLevel:2
        }, "sync"
    );
    lettere = document.querySelectorAll(".div_anteprima");
    console.log(lettere);
    lettere.forEach(function(lettera){
        lettera.onclick = funzioneVisualizzaLettera;
    });
}

function funzioneTutte () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "anteprime_tutte",
        logLevel:2
        }, "sync"
    );
    lettere = document.querySelectorAll(".div_anteprima");
    console.log(lettere);
    lettere.forEach(function(lettera){
        lettera.onclick = funzioneVisualizzaLettera;
    });
}

function funzioneBio () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "biografia",
        logLevel:2
        }, "async"
    );
}

function funzioneVisualizzaLettera () {
    var x= this.id;
    console.log(x);
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "lettere",
        templateParams:{
            "id_lettera" : [x]
        },
        logLevel:2
    }, "sync"
    );
}


var n_home;
var n_1943;
var n_1944;
var n_1945;
var n_tutte;
var n_bio;
var lettere = new Array();

function gestoreLoad() { 
    try{
        n_home = document.getElementById("nav_home");
        n_1943 = document.getElementById("nav_1943");
        n_1944 = document.getElementById("nav_1944");
        n_1945 = document.getElementById("nav_1945");
        n_tutte = document.getElementById("nav_tutte");
        n_bio = document.getElementById("nav_bio");
        n_home.onclick = funzioneHome;
        n_1943.onclick = funzione1943;
        n_1944.onclick = funzione1944;
        n_1945.onclick = funzione1945;
        n_tutte.onclick = funzioneTutte;
        n_bio.onclick = funzioneBio;
    } catch (e) {
        alert("gestoreLoad" + e); 
    }
}