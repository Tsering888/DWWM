-- EXO_1.1
-- Afficher la liste des hôtels avec leur station
select * from station,hotel;

-- EXO_1.2
-- Afficher la liste des chambres et leur hôtel
select * from chambre,hotel;

-- EXO_1.3
-- Afficher la liste des réservations avec le nom des clients
select res_id,res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes, cli_nom from reservation inner join client on cli_id=res_cli_id;


-- EXO_1.4
-- Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station
select cha_id, cha_hot_id, cha_numero,cha_capacite, cha_type, hot_nom , sta_nom from chambre
inner join hotel on hot_id=cha_hot_id
inner join station on sta_id=hot_sta_id ;


-- EXO_1.5
-- Afficher les réservations avec le nom du client et le nom de l'hôtel
select res_id,res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes, cli_nom, hot_nom from reservation 
inner join chambre on cha_id=res_cha_id
inner join hotel on hot_id=cha_hot_id
inner join client on cli_id=res_cli_id;


