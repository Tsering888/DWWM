<!-- 1 -->

<?php
echo "Today is " . date("l Y/m/d") . "<br>";

?>

<!-- 2 -->
<?php
$date_test = "2019-07-19";
 $semaine=strtotime ($date_test);
 echo date("WS",$semaine)."  semaine"."<br>";
// OR

$date=explode('-','2019-07-19');
echo date('WS',mktime(0,0,0,$date[1],$date[2],$date[0]))."  semaine"."<br>";
?>

<!-- 3 -->
<?php
$d1=strtotime("11 feb 2022");
$d2=ceil(($d1-time())/60/60/24);
echo "There are " . $d2 ." days to 11 feb 2022."."<br>";
?>


<!-- 4 -->
<?php

$dnow = date('r', mktime(0, 0, 0));

$dafter = date('r', mktime(0, 0, 0, 2, 11, 2022));

echo $dnow."<br>".$dafter."<br>";

$date1=date_create($dnow);
$date2=date_create($dafter);
$diff=date_diff($date1,$date2);
echo "There are ".($diff->days)."<br>";

?>

<!-- 5 -->
<?php
function est_bissextile($annee) {
return((($annee & 3) == 0) && (($annee % 100 != 0) || ($annee % 400 == 0)));
}
 
for($I=2021;$I<=2025;$I++) {
  
 if(est_bissextile($I)) echo strval($I)."  la prochaine année bissextile"."<br>";
  
}
// OR

$day = "";
for($i=0; $i<4; $i++)
{
    $day =  date("d", mktime(0, 0, 0, 2, 29, date("Y")+$i));
    if($day == 29)
    {
        $year = date("Y")+$i;
        break;
    }
}
echo "The next leap year is 29th February $year"."<br>";    

?>

<!-- 6 -->
<?php
   $check = checkdate(17, 17, 2019);
   
   if($check){
      echo "Given date is valid";
   }
   else{
      echo $check."Given date is invalid"."<br>";
   }
   
?>


<!-- 7 -->
<?php
echo "Il est :";
date_default_timezone_set('Europe/Paris');
setlocale(LC_TIME, 'fr_FR.utf8','fra');
echo date("H\h\ i")."<br>";

// OR

date_default_timezone_set('Europe/Paris');
setlocale(LC_TIME, 'fr_FR.utf8','fra');
 
echo strftime( '%Hh%M')."<br>";

?>

<!-- 8 -->
<?php
$now = time();
$mois =  mktime(0,0,0,date("m" ) +1  ,date("d" ) ,date("Y" ));
echo date("d m Y", $now)."<br />";
echo date("d m Y", $mois);
?>