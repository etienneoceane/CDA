
// Controler input email
var email = document.getElementById("email");
var error1 = document.getElementById("error1");

email.addEventListener("blur", function()
{

    var filtreEmail = new RegExp(/^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/);
    var resultat1 = filtreEmail.test(email.value);

    if(resultat1==false){
        email.value = "";
        email.style.border = "2px solid red";
        error1.textContent = "Veuillez saisir une adresse mail valide";
        error1.style.color = "red";
    }
    else {
        error1.textContent = "";
        email.style.border = "";
    }
});


// Controler input Sujet
var sujet = document.getElementById("sujet");
var error2 = document.getElementById("error2");

sujet.addEventListener("blur", function()
{
    var filtreString = new RegExp("^[A-Za-z,?!]+$");
    var resultat = filtreString.test(sujet.value);

    if(resultat==false){
        sujet.value = "";
        sujet.style.border = "2px solid red";
        error2.textContent = "Veuillez n'utiliser que des lettres!";
        error2.style.color = "red";
    }
    else{
        error2.textContent = "";
        sujet.style.border = "";
    }
});

