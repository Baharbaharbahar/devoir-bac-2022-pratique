function alpha(ch) {
    ch = ch.toUpperCase();
    for (let i = 0; i < ch.length; i++) {
    if (ch.charAt(i)<"A"||ch.charAt(i)>"Z") {
        return false;
    }
    }
    return true;
}
function verif1(){
    pe=document.getElementById("pe").value;
    n=document.getElementById("n").value;
    p=document.getElementById("p").value;
    f=document.getElementById("f").checked;
    m=document.getElementById("m").checked;
    if ((pe.length!=8)||(isNaN(pe.substr(0,2)))||(isNaN(pe.substr(3)))||(pe.charAt(2)!='/')){
        alert("format num permis invalide!!!");
    }
    else if (!alpha(n)||n.length<3||n.length>20){
        alert ("le nom doit etre 3 et 20");
    }
    else if (!alpha(p)||p.length<3||p.length>20){
        alert ("le prenom doit etre 3 et 20");
    }
    else if (f==false && m==false){
        alert("vous devez devez selectin genre");
    }

}
function verif2(){
    p=document.getElementById("p").value;
    m=document.getElementById("m").selectedIndex;
    s=document.getElementById("s").value;
    co=document.getElementById("co").value;
    con=document.getElementById("con").value;
    if ((p.length!=8)||(isNaN(p.substr(0,2)))||(isNaN(p.substr(3)))||(p.charAt(2)!='/')){
        alert("format num permis invalide!!!");
    }
    else if (m==0){
        alert("vous devez selectioner un model");
    }
    else if (Number(s)<1 || Number(s)>5){
        alert("securite droit etre 1 et 5 ");
    }
    else if (Number(co)<1 || Number(co)>5){
        alert("conduite droit etre 1 et 5 ");
    }
    else if (Number(con)<1 || Number(con)>5){
        alert("confort droit etre 1 et 5 ");
    }
}