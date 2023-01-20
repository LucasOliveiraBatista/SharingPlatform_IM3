console.log("Hello,registrieren");

function reg() {

    let username = document.querySelector("#username").value;
    let email = document.querySelector("#email").value;
    let password1 = document.querySelector("#password1").value;
    let password2 = document.querySelector("#password2").value;
    // let kanton = document.querySelector("#kanton").value;

    

    let formData = new FormData();
    formData.append('username', username);
    formData.append('email', email);
    formData.append('password1', password1);
    formData.append('password2', password2);
    // formData.append('kanton', kanton);

    fetch("https://173662-5.web.fhgr.ch/php/registrieren.php",
        {
            body: formData,
            method: "post",
        })

        .then((response) => {

            return response.text();

        })
        .then((data) => {

            //console.log(data);
            document.querySelector('#nachricht').innerHTML = data;

           
        }
        )
}
