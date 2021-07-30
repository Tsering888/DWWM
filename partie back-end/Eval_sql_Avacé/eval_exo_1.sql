-- EXO_1
-- Créez une vue qui affiche le catalogue produits. L'id, la référence et le nom des produits, ainsi que l'id et le nom de la catégorie doivent apparaître.

cat_produit AS SELECT products.pro_id, products.pro_ref, products.pro_name , categories.cat_id, categories.cat_name from products
INNER JOIN categories ON categories.cat_id=products.pro_cat_id
GROUP BY pro_id;

-- EXO_2
-- Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture en fonction d'un numéro de commande. Cette procédure doit sortir le montant total de la commande.

DELIMITER |
create procedure facture()
BEGIN
  SELECT orders.ord_id as fac_id, orders.ord_payment_date as fac_payment_date,  orders_details.ode_unit_price as prix ,
 SUM(orders_details.ode_unit_price * orders_details.ode_quantity) AS MontantTotal from orders
 INNER JOIN orders_details ON orders_details.ode_ord_id=orders.ord_id
 GROUP BY ord_id;
  END