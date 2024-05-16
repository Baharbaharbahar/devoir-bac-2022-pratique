<?php
require("config.php");
$conn=mysqli_connect($server,$username,$password,$bd);
$sql="SELECT M.libelle , AVG(securite) as 'e1', AVG(conduite) as 'e2' ,AVG(confort)  as 'e3', COUNT(E.idModele) as 'nb' FROM evaluation E, modelevoiture M WHERE  (E.idModele = M.idModele ) AND year(dateTest) = year(now()) GROUP BY (E.idModele)";
$res=mysqli_query($conn,$sql);
$nb = mysqli_num_rows($res);   
?>
<table border="1">
    <tr>
    <th>Modèle</th>
    <th>Sécurité</th>
    <th>Conduite</th>
    <th>Confort</th>
    <th>Nbr tests</th>
    </tr>

<?php
for($i=0;$i<$nb;$i++){
    $enreg=mysqli_fetch_array($res);
    ?>
    <tr>
        <td><?php echo  $enreg ['libelle']?></td>
        <td><?php echo $enreg ['e1']?></td>
        <td><?php echo $enreg ['e2']?></td>
        <td><?php echo  $enreg ['e3']?></td>
        <td><?php echo $enreg ['nb']?></td>
    </tr>
    <?php
}
?>
</table>