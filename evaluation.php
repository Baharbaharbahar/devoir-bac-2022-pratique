<?php
$npermis=$_POST["npermis"];
$m=$_POST["m"];
$s=$_POST["s"];
$co=$_POST["co"];
$con=$_POST["con"];

require("config.php");
$conn=mysqli_connect($server,$username,$password,$bd);
$sql="select * from testeur where numPermis='$npermis'; ";
$res=mysqli_query($conn,$sql);
if (mysqli_num_rows($res)==1){
    echo "Testeur non inscrit";
}
else{
    $sql1="select * from evaluation where numPermis='$npermis' and idModele='$m';";
    $res1=mysqli_query($conn,$sql1);
    if (mysqli_num_rows($res1)!=0){
        echo "Vous avez déjà testé ce modèle";
    }else{
        $d=date('Y-m-d');
        $sql2="insert into evaluation values('$d','$npermis','$m','$s','$co','$con'); ";
        // echo $sql2;
        $res2=mysqli_query($conn,$sql2);
        if (mysqli_affected_rows($conn)>0){
            echo "Evaluation enregistrée avec succès";
        }
    }
}


?>