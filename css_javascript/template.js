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
    n_home.classList.add("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.remove("checked");
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
    div_con.style.height = "auto";
    n_home.classList.remove("checked");
    n_1943.classList.add("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.remove("checked");
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
    div_con.style.height = "auto";
    n_home.classList.remove("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.add("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.remove("checked");
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
    div_con.style.height = "auto";
    n_home.classList.remove("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.add("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.remove("checked");
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
    div_con.style.height = "auto";
    n_home.classList.remove("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.add("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.remove("checked");
}

function funzioneStats () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "stats",
        logLevel:2
        }, "async"
    );
    div_con.style.height = "auto";
    n_home.classList.remove("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.add("checked");
    n_bio.classList.remove("checked");
}

function funzioneBio () {
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "biografia",
        logLevel:2
        }, "async"
    );
    div_con.style.height = "auto";
    n_home.classList.remove("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.add("checked");
}

function funzioneVisualizzaLettera () {
    var x= this.id;
    console.log(x);
    SaxonJS.transform({
        sourceLocation:"50lettere_included.xml",
        stylesheetLocation:"50lettere.sef.json",
        initialTemplate: "lettere",
        templateParams:{
            "id_lettera": [x]
        },
        logLevel:2
    }, "sync"
    );
    div_con.style.height = "700px";
    n_home.classList.remove("checked");
    n_1943.classList.remove("checked");
    n_1944.classList.remove("checked");
    n_1945.classList.remove("checked");
    n_tutte.classList.remove("checked");
    n_stats.classList.remove("checked");
    n_bio.classList.remove("checked");
}


var n_home;
var n_1943;
var n_1944;
var n_1945;
var n_tutte;
var n_stats;
var n_bio;
var lettere = new Array();
var div_con;

function gestoreLoad() { 
    try{
        n_home = document.getElementById("nav_home");
        n_1943 = document.getElementById("nav_1943");
        n_1944 = document.getElementById("nav_1944");
        n_1945 = document.getElementById("nav_1945");
        n_tutte = document.getElementById("nav_tutte");
        n_stats = document.getElementById("nav_stats")
        n_bio = document.getElementById("nav_bio");
        div_con = document.getElementById("contenitore_contenuti");
        n_home.onclick = funzioneHome;
        n_1943.onclick = funzione1943;
        n_1944.onclick = funzione1944;
        n_1945.onclick = funzione1945;
        n_tutte.onclick = funzioneTutte;
        n_stats.onclick = funzioneStats;
        n_bio.onclick = funzioneBio;
        div_con.style.height = "auto";
    } catch (e) {
        alert("gestoreLoad" + e); 
    }
}