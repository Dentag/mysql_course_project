DROP TRIGGER IF EXISTS bonuses_orders_update;
DROP TRIGGER IF EXISTS quantity_orders_insert;
DROP TRIGGER IF EXISTS rate_update_products_reviews_insert;

DELIMITER //
/*Вызывает ошибку при попытке оформить заказ на отсутствующий товар*/
CREATE TRIGGER quantity_orders_insert BEFORE INSERT ON orders
FOR EACH ROW
BEGIN 
	IF (SELECT quantity FROM storage WHERE product_id = NEW.product_id AND shop_id = NEW.shops_id) < 1 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'product is not available';
	END IF;
END//	

	
/* При изменении статуса заказа на "оплачен" убирает 1 ед. товара из склада магазина, где товар был приобретён.
После изменения статуса заказа на "получен" - добавляет пользователю бонусы в размере 5% от стоимости товара*/
CREATE TRIGGER bonuses_orders_update AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
	IF NEW.order_type_id = 2 THEN
		UPDATE storage SET quantity = quantity - 1 WHERE product_id = NEW.product_id AND shop_id = NEW.shops_id;
	END IF;
	IF NEW.order_type_id = 3 THEN 
		UPDATE users SET bonuses = bonuses + (SELECT price * 0.05 FROM products WHERE id = NEW.product_id) WHERE id = NEW.user_id; 
	END IF;
END//


/*Обновялет рейтинг товара в таблице products при добавлении нового отзыва*/
CREATE TRIGGER rate_update_products_reviews_insert AFTER INSERT ON products_reviews
FOR EACH ROW
BEGIN 
	UPDATE products SET 
		product_rate = (SELECT SUM(rate) / COUNT(id) FROM products_reviews WHERE product_id = NEW.product_id GROUP BY product_id)
	WHERE id = NEW.product_id;
END//
DELIMITER ;
