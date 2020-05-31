/*Представление с продукцией по категориям*/
CREATE VIEW category_product AS
	SELECT mc.name AS category, p.name AS product FROM main_categories mc 
		JOIN sub_categories sc ON sc.main_category_id = mc.id
		JOIN product_type pt ON pt.sub_category_id = sc.id
		JOIN products p ON p.product_type_id = pt.id;
	
/*Представление с ценами товаров по типу продукции*/	
CREATE VIEW product_type_specifications AS
	SELECT pt.name AS product_type, m.name AS manufacturer, ps.model_name, p.price FROM product_specifications ps 
		LEFT JOIN manufacturers m ON m.id=ps.manufacturer_id
		LEFT JOIN products p ON p.id = ps.product_id
		LEFT JOIN product_type pt ON pt.id = p.product_type_id;

/*Таблица городов и адреса магазинов*/
CREATE VIEW city_store_adress AS
	SELECT c.name, s.adress FROM shops s JOIN cities c ON c.id = s.city_id;

/*Выборка товаров типа колонки, которые есть в наличии в г. Москва*/
SELECT c.name AS city, s.adress, p.name, st.quantity, p.price FROM storage st
	LEFT JOIN shops s ON s.id = st.shop_id
	LEFT JOIN cities c ON c.id = s.city_id
	LEFT JOIN products p ON p.id = st.product_id
	LEFT JOIN product_type pt ON pt.id = p.product_type_id
	WHERE pt.name = 'speakers' AND st.quantity > 0 AND c.name = 'Moscow';

/*Остаток по магазинам в денежном эквиваленте*/
SELECT c.name AS city, s.adress, SUM(st.quantity * p.price) AS total FROM storage st
	LEFT JOIN products p ON p.id = st.product_id
	LEFT JOIN shops s ON s.id = st.shop_id
	LEFT JOIN cities c ON c.id = s.city_id
	GROUP BY s.id;

/*Выручка по магазинам на определенную дату*/
SELECT s.id, s.adress, SUM(price) FROM orders o
	LEFT JOIN products p ON p.id = o.product_id
	LEFT JOIN shops s ON s.id = o.shops_id
	WHERE order_type_id = 3 AND o.updated_at LIKE '%2020-05-31%'
	GROUP BY o.shops_id;

/*Подсчёт наименований продукции по цвету*/
SELECT c.name, COUNT(*) FROM products p 
	LEFT JOIN product_specifications ps ON ps.product_id = p.id
	LEFT JOIN colours c ON c.id = ps.colour_id
	GROUP BY c.name;



	


