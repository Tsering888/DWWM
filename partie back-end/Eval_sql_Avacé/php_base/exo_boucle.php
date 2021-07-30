/*<?php 

$nombre=150;
for($i=1;$i<nombre;$i+2)
{
}
echo $i;


$n=150;
$i=1;
do{

    echo $i."<br>";
    $i+=2;
}
while($i<=$n);

?>*/

<!-- <?php -->
$demain = mktime(0, 0, 0, date("m"), date("d")+1, date("y"));
echo "Demain nous serons le ".date("m/d/y", $demain);


echo "Today is " . date("Y/m/d") . "<br>";
echo "Today is " . date("Y.m.d") . "<br>";
echo "Today is " . date("Y-m-d") . "<br>";
echo "Today is " . date("l");

echo date('Y-m-d H:i:s');  // 2012-10-11 15:35:53
echo date('l j F Y, H:i'); // Thursday 11 October 2012, 15:35
echo date('d F Y');        // 11 October 2012
echo date('d/m/Y');        // 11/10/12

$date_test = "2009-07-19";
$good_format=strtotime ($date_test);
echo date('W',$good_format);

$date=explode('-','2009-07-19');
echo date('W',mktime(0,0,0,$date[1],$date[2],$date[0]));


   $date = "2004-09-25"; // defini la date
   $aujourdhui = date("Y-m-d");
   $nbr_jours =  NbJours($date, $aujourdhui);
   echo" En ligne depuis $nbr_jours jours";

$d=strtotime("tomorrow");
echo date("Y-m-d h:i:sa", $d) . "<br>";

$d=strtotime("next Saturday");
echo date("Y-m-d h:i:sa", $d) . "<br>";

$d=strtotime("+3 Months");
echo date("Y-m-d h:i:sa", $d) . "<br>";

$startdate=strtotime("Saturday");
$enddate=strtotime("+6 weeks", $startdate);

while ($startdate < $enddate) {
  echo date("M d", $startdate) . "<br>";
  $startdate = strtotime("1 week", $startdate);
}

$d1=strtotime("July 04");
$d2=ceil(($d1-time())/60/60/24);
echo "There are " . $d2 ." days until 4th of July.";

there 24 days until 04 july

$now = time();
$mois =  mktime(0,0,0,date("m" ) +1  ,date("d" ) ,date("Y" ));
echo date("d m Y", $now)."<br />";
echo date("d m Y", $mois);
?>