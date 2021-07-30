<<html>
<body>

<?php

// Exercice 1
// Ecrire un script PHP qui affiche tous les nombres impairs entre 0 et 150, par ordre croissant : 1 3 5 7...

$n=150;
$i=1;
do{

    echo "$i<br>";
    $i+=2;
}
while($i<=$n);

// Exercice 2
// Écrire un programme qui écrit 500 fois la phrase Je dois faire des sauvegardes régulières de mes fichiers.
$i=1;
do{

    echo $i.  " => Je dois faire des sauvegardes régulières de mes fichiers."."<br>";
    $i++;
}
while($i<=500)


// Exercice 3
// Ecrire un script qui affiche la table de multiplication totale de {1,...,12} par {1,...,12}, le résultat doit être le suivant :

for($i=-1;$i<=12;$i++){

    if($i>=0){
        echo('<th>'.$i.'</th>');
    }
    else{
        echo('<th>   </th>');
    }
}

for($x=0;$x<=12;$x++){
    echo('<tr>');
    echo('<th>'.$x.'</th>');
    for($y=0;$y<=12;$y++){
        
        echo('<td>'.$x*$y.'</td>');
}
echo('</tr>');

}




?>


</body>
</html>
