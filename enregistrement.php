<?php
$npermis=$_POST["npermis"];
$n=$_POST["n"];
$p=$_POST["p"];
$g=$_POST["g"];
require("config.php");
$conn=mysqli_connect($server,$username,$password,$bd);
$sql="select  numPermis from testeur where numPermis='$npermis'; ";
$res=mysqli_query($conn,$sql);
if (mysqli_num_rows($res)==1){
    echo "Numéro de permis déjà existant";
}else{
    $sql1="insert into testeur values('$npermis','$n','$p','$g'); ";
    $res1=mysqli_query($conn,$sql1);
    if (mysqli_affected_rows($conn)>0){
        echo "Enregistrement fait avec succès";
    }
}


?>