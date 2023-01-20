console.log("Hello,babe");


holeUser();
holeBeitrag();

window.onscroll = function() {stickyNav()};

var navbar = document.getElementById("myTopnav");
var sticky = navbar.offsetTop;

function stickyNav() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}

function responsiveTopnav() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

function holeUser() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);


    fetch("https://173662-5.web.fhgr.ch/php/holeUser.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // falls die Sitzung nicht abgelaufen ist, verarbeite die JSON antwort
            if (res.status >= 200 && res.status < 300) {

                return res.json();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            //console.log(data[0].name);

            document.querySelector("#username").innerHTML = data[0].name;
        })



}

function holeBeitrag() {


    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://173662-5.web.fhgr.ch/php/holeBeitraege.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // falls die Sitzung nicht abgelaufen ist, verarbeite die JSON antwort
            if (res.status >= 200 && res.status < 300) {

                return res.json();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            // mache etwas
            console.log(data);

            beitraegeAnzeigen(data);

            // console.log(data[0].name);


        })

}

function beitraegeAnzeigen(data) {

    if(window.location.href == "https://173662-5.web.fhgr.ch/index.html" || window.location.href == "https://173662-5.web.fhgr.ch/"){
    data.forEach(BT => {

        if (parseInt(BT.status)) {

            let beitragContainer = document.createElement("div");
            
                beitragContainer.innerHTML =
                '<div class="liste-Beitraege">' +
                '<h2>👤' + BT.name + '</h2>' +
                '<img class="bt-image" src="' + BT.profilbild + '">' +
                '<p>📍 ' + BT.kanton + '</p>' +
                '<p class="beschreibung">' + BT.beschreibung + '</p>' +
                '<a style="text-decoration: none; word-wrap: break-word;" href="' + BT.links + '">🌐 ' + BT.links + '</a> <br><br>' +
                '<a style="text-decoration: none" target="_blank" href="mailto:' + BT.email + '">📧 ' + BT.email + '</a>' 
                
                document.getElementById("content").appendChild(beitragContainer);

        }else {}

        
        
    });
    }
}

function logout(){
    localStorage.clear();
    window.location = "/login.html"
}
