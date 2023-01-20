var btID;

holeProfil();

function neuesProfil() {

    let profilbild = document.querySelector("#profilbild").value;
    let name = document.querySelector("#name").value;
    let email = document.querySelector("#email").value;
    let beschreibung = document.querySelector("#beschreibung").value;
    let links = document.querySelector("#links").value;
    let kanton = document.querySelector("#kanton").value;
    let status = document.querySelector('input[name="status"]:checked').value;

    let formData = new FormData();
    formData.append('profilbild', profilbild)
    formData.append('name', name);
    formData.append('email', email);
    formData.append('beschreibung', beschreibung);
    formData.append('links', links);
    formData.append('kanton', kanton);
    //displayRadioValue();
    formData.append('status', status);
    // formData.append('kanton', kanton);
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    formData.append('user', userID);

    fetch("https://173662-5.web.fhgr.ch/php/artist.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((response) => {

            return response.text();

        })
        .then((data) => {

            //console.log(data);
            document.querySelector('#nachricht').innerHTML = data;
            holeProfil();

        }
        )
}

function holeProfil() {

    // get authentication variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://173662-5.web.fhgr.ch/php/holeUserBeitrag.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                return res.json();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            console.log(data);

            if (data.length == 0) {

               
                document.querySelector('#button-neue').classList.remove("hidden");

                
            } else {

              
                btID = data[0].ID;

                
                document.querySelector('#button-neue').classList.add("hidden");
                document.querySelector('#button-aktualisieren').classList.remove("hidden");
                document.querySelector('#button-loeschen').classList.remove("hidden");

                // fülle das Formular mit den Werten aus der DB aus
                document.querySelector('#profilbild').value = data[0].profilbild;
                document.querySelector('#name').value = data[0].name;
                document.querySelector('#email').value = data[0].email;
                document.querySelector('#beschreibung').value = data[0].beschreibung;
                document.querySelector('#links').value = data[0].links;
                document.querySelector('#kanton').value = data[0].kanton;

                if (data[0].status == 1) {

                    document.querySelector('#oeffentlich').checked = true;

                } else {

                    document.querySelector('#privat').checked = true;

                }

            }
        })
}

function aktualisiereProfil() {

    // get authentication variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    // Formulardaten in Body übertragen
    let profilbild = document.querySelector('#profilbild').value;
    let name = document.querySelector('#name').value;
    let email = document.querySelector('#email').value;
    let beschreibung = document.querySelector('#beschreibung').value;
    let links = document.querySelector('#links').value;
    let kanton = document.querySelector('#kanton').value;
    let status = document.querySelector('input[name="status"]:checked').value;

    let formData = new FormData();
    formData.append('userID', userID);
    formData.append('profilbild', profilbild);
    formData.append('name', name);
    formData.append('email', email);
    formData.append('beschreibung', beschreibung);
    formData.append('links', links);
    formData.append('kanton', kanton);
    formData.append('status', status);

    formData.append('btID', btID);

    fetch("https://173662-5.web.fhgr.ch/php/aktualisiereBeitrag.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                return res.text();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            // zeige die Nachricht an
            document.querySelector('#nachricht').innerHTML = data;

        })
}

function loescheProfil(){

    // get authentication variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);
    formData.append('btID', btID);

    fetch("https://173662-5.web.fhgr.ch/php/loescheProfil.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                return res.text();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            console.log(data);
            //document.querySelector('#nachricht').innerHTML = data;

            // button aktualisieren
            document.querySelector('#button-neue').classList.remove("hidden");
            document.querySelector('#button-aktualisieren').classList.add("hidden");
            document.querySelector('#button-loeschen').classList.add("hidden");

            // Formularfelder leeren
            document.querySelector('#profilbild').value = "";
            document.querySelector('#name').value = "";
            document.querySelector('#email').value = "";
            document.querySelector('#beschreibung').value = "";
            document.querySelector('#links').value = "";
            document.querySelector('#kanton').value = "";
            document.querySelector('#oeffentlich').checked = false;
            document.querySelector('#privat').checked = false;

            document.querySelector('#profilbild').src = "";

            // Variablen leeren
            btID = "";



        })
}