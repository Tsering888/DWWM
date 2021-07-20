-- LES REQUËTES

-- Questin 1.
-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne, les noms et prénoms des employés qui ont des enfants. Présenter d'abord ceux qui en ont le plus

select emp_lastname, emp_firstname, emp_children from employees
order by emp_children DESC
,emp_lastname ASC;



-- Question 2.
-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.

select cus_lastname, cus_firstname, cus_countries_id from customers
WHERE NOT cus_countries_id='FR'	;



-- Question 3.
-- Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.

select cus_city, cus_countries_id ,cou_name from customers, countries
 WHERE cou_name='FRANCE'
 order by cus_city;




-- Question 4.
-- Q4. Afficher le nom des clients dont les fiches ont été modifiées

SELECT cus_lastname,cus_update_date FROM `customers` where NOT cus_update_date='null';




-- Question 5.
-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?

SELECT  cus_id ,cus_lastname,cus_firstname  FROM customers where cus_city like '%divos%';




-- Question 6.
-- Q6. Quel est le produit dont le prix de vente est le moins cher ? Afficher le prix, l'id et le nom du produit.

SELECT MIN(pro_price) FROM products;



-- Question 7.
-- Q7. Lister les produits qui n'ont jamais été vendus

select pro_id , pro_ref, pro_name from products  
where pro_id NOT IN (SELECT ode_pro_id from orders_details);



-- Question 8.
-- Q8. Afficher les produits commandés par Madame Pikatchien.

SELECT pro_id, pro_ref, pro_color, pro_name, cus_id, cus_lastname, ord_id, ode_id 
FROM products
INNER JOIN orders_details ON products.pro_id=orders_details.ode_pro_id
INNER JOIN orders ON orders_details.ode_ord_id=orders.ord_id
INNER JOIN customers ON orders.ord_cus_id=customers.cus_id
WHERE cus_lastname='Pikatchien';



-- Question 9
--Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés.

SELECT cat_id, cat_name, pro_name FROM categories INNER 
JOIN products ON categories.cat_id=products.pro_cat_id 
ORDER by cat_name ASC;


-- Question 10
-- Q10. Afficher l'organigramme du magasin de Compiègne Afficher le nom et prénom des employés, classés par ordre alphabétique, ainsi que celui de leur supérieur hiérarchique (et éventuellement leurs postes respectifs, si vous y parvenez).
-- *
SELECT concat(t1.emp_lastname , t1.emp_firstname) AS employé , concat(t2.emp_lastname, t2.emp_firstname) AS superieur
FROM employees AS t1
INNER JOIN employees AS t2 ON t2.emp_superior_id=t1.emp_id
ORDER BY t1.emp_lastname ASC;


-- Question 11
-- Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficherle numéro et le nom du produit, le numéro de commande, le numéro de ligne de commande, et le montant de la remise.
-- *
SELECT products.pro_id, products.pro_name, orders.ord_id , orders_details.ode_ord_id 
FROM products AS tab1
INNER JOIN (SELECT MAX(products.pro_price*orders_details.ode_discount/100) as max_remise FROM products) AS tab2 
ON tab2.max_remise=tab1.pro_id
INNER JOIN orders_details ON  products.pro_id=orders_details.ode_pro_id
INNER JOIN orders ON orders_details.ode_ord_id=orders.ord_id;


-- Question 12
-- Q12. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'

SELECT COUNT(cus_id) AS customers  from customers
INNER JOIN countries ON cus_countries_id=cou_id
where cus_countries_id='CA';


-- Question 13
-- Q13. Afficher le détail des commandes de 2020.

 
SELECT  ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id, ord_order_date  from orders_details
INNER JOIN orders ON orders_details.ode_ord_id = orders.ord_id
WHERE ord_order_date like '2020%';

-- Question 14
-- Q14. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.

SELECT sup_id from suppliers
 INNER JOIN products ON products.pro_sup_id=suppliers.sup_id
 WHERE sup_id  IN (SELECT pro_sup_id from products) ;


--  Question 15
-- Q15. Quel est le chiffre d'affaires de 2020 ?
-- *
 SELECT SUM(pro_price) - SUM(pro_price*ode_discount/100)  AS resultat from orders_details
 INNER JOIN products ON products.pro_id=orders_details.ode_pro_id
 INNER JOIN orders ON orders_details.ode_ord_id=orders.ord_id
 WHERE ord_order_date like '2020%' ;

- SUM(pro_price*ode_discount/100) 

-- Question 16
-- Q16. Lister le total de chaque commande par total décroissant. Afficher le numéro de commande, la date, le total et le nom du client).

SELECT ord_id, cus_lastname, ord_order_date, ode_quantity, (ode_unit_price * ode_quantity) AS 'Total' FROM orders_details
JOIN orders ON orders.ord_id = orders_details.ode_ord_id 
JOIN customers ON customers.cus_id = orders.ord_cus_id
ORDER BY (ode_unit_price * ode_quantity) DESC;

-- Question 17
-- Q17. Quel est le montant du panier moyen ?

SELECT AVG(ode_unit_price * ode_quantity) from orders_details;

-- Question 18
-- Q18. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%. Mettre à jour la fiche de ce produit.
UPDATE products SET pro_price =100, pro_name='camper';

SELECT pro_id, pro_name, pro_price, (pro_price*(10/100)) as remise, (pro_price-(pro_price*(10/100))) AS price_after_reduction   FROM products
WHERE pro_ref='barb004';

-- Question 19
-- Q19. L'inflation en France l'année dernière a été de 1,1%. Appliquer cette augmentation à la gamme de parasols.

SELECT pro_id, pro_name, pro_price, (pro_price*(1.1/100)) as augmentation, (pro_price+(pro_price*(1.1/100))) AS price_after_augmentation   FROM products
 WHERE pro_id BETWEEN 25 AND 27;

--  Question 20
-- Q20. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". Vous devez utiliser une sous-requête sans indiquer de valeurs de clés.
DELETE gescom_afpa.products FROM gescom_afpa.products 
JOIN gescom_afpa.categories ON categories.cat_id = products.pro_cat_id
WHERE  pro_id  NOT IN
(SELECT ode_pro_id from orders_details)
AND cat_name ='Tondeuses électriques'


