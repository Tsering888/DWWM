-- exo_2.1
-- v_Details correspondant à la requête : _A partir de la table orders_details, afficher par code produit, la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.
CREATE VIEW v_ventes
AS 
SELECT * FROM orders_details;

SELECT pro_id, SUM(ode_quantity) as QteTot , SUM(ode_unit_price) as PrixTot from orders_details
inner join products on pro_id=ode_pro_id
GROUP by pro_id;

-- exo_2.2
-- v_Ventes_Zoom correspondant à la requête : Afficher les ventes dont le code produit est ZOOM (affichage de toutes les colonnes de la table orders_details).

CREATE VIEW v_ventes_Zoom
AS 
SELECT * FROM orders_details;

SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_pro_id, ode_ord_id, pro_id FROM orders_details 
inner join products on pro_id=ode_pro_id
WHERE pro_id='ZOOM';




DELIMITER |

CREATE PROCEDURE Lst_suppliers()

BEGIN 
  SELECT sup_name from suppliers;
  
  END |

SHOW CREATE PROCEDURE Lst_Suppliers;






DELIMITER |
CREATE PROCEDURE lst_Rush_Orders ()
BEGIN 
  SELECT ord_stastus FROM orders
  where ord_status='commande urgente';
  
  
  END |