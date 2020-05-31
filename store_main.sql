DROP DATABASE IF EXISTS tech_store;
CREATE DATABASE tech_store;
USE tech_store;

/*ТАБЛИЦА РЕГИОНОВ ПРИСУТСТВИЯ */
DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);
/*ТАБЛИЦА ГОРОДОВ */
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	region_id BIGINT UNSIGNED,
	CONSTRAINT cities_region_id_fk FOREIGN KEY (region_id) REFERENCES regions(id) ON DELETE RESTRICT 
);
/*ТАБЛИЦА МАГАЗИНОВ */
DROP TABLE IF EXISTS shops;
CREATE TABLE shops (
	id SERIAL PRIMARY KEY,
	city_id	BIGINT UNSIGNED,
	adress VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL,
	phone_number VARCHAR(120) NOT NULL,
	opens_at TIME NOT NULL,
	closes_at TIME NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT shops_city_id_fk FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE RESTRICT
);


/*ОСНОВНЫЕ КАТЕГОРИИ ТОВАРОВ */
DROP TABLE IF EXISTS main_categories;
CREATE TABLE main_categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
/*ПОДКАТЕГОРИИ ТОВАРОВ */
DROP TABLE IF EXISTS sub_categories;
CREATE TABLE sub_categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	main_category_id BIGINT UNSIGNED NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT sub_categories_main_category_id_fk FOREIGN KEY (main_category_id) REFERENCES main_categories(id) ON DELETE RESTRICT
);
/*ТИП ТОВАРА */
DROP TABLE IF EXISTS product_type;
CREATE TABLE product_type (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	sub_category_id BIGINT UNSIGNED NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT product_type_sub_category_id_fk FOREIGN KEY (sub_category_id) REFERENCES sub_categories(id) ON DELETE RESTRICT
);
/*ТАБЛИЦА ТОВАРОВ */
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	price INT UNSIGNED,
	product_rate DECIMAL(3, 2),
	description TEXT,
	product_type_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT products_product_type_id_fk FOREIGN KEY (product_type_id) REFERENCES product_type(id) ON DELETE RESTRICT
);
/*ТАБЛИЦА ЦВЕТОВ*/
DROP TABLE IF EXISTS colours;
CREATE TABLE colours (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);
/*ТАБЛИЦА ПРОИЗВОДИТЕЛЕЙ*/
DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);
/*ТАБЛИЦА ОПИСАНИЯ ХАРАКТЕРИСТИК ТОВАРА */
DROP TABLE IF EXISTS product_specifications;
CREATE TABLE product_specifications (
	product_id BIGINT UNSIGNED NOT NULL UNIQUE,
	manufacturer_id BIGINT UNSIGNED,
	model_name VARCHAR(100) NOT NULL,
	colour_id BIGINT UNSIGNED, 
	product_power INT UNSIGNED,
	width INT UNSIGNED,
	height INT UNSIGNED,
	deepth INT UNSIGNED,
	weight INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT product_specifications_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT,
	CONSTRAINT product_specifications_manufacturer_id_fk FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id) ON DELETE RESTRICT,
	CONSTRAINT product_specifications_colour_id_fk FOREIGN KEY (colour_id) REFERENCES colours(id) ON DELETE RESTRICT
);
/*ПОЛЬЗОВАТЕЛИ*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	phone_number VARCHAR(120) NOT NULL UNIQUE,
	birth_date DATE,
	city_id BIGINT UNSIGNED,
	bonuses INT UNSIGNED DEFAULT 0, 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT users_city_id_fk FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE SET NULL
);
/*ОТЗЫВЫ О ТОВАРЕ */
DROP TABLE IF EXISTS products_reviews;
CREATE TABLE products_reviews (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED NOT NULL,
	rate TINYINT UNSIGNED NOT NULL,
	review TEXT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT products_reviews_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT products_reviews_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id)
);
/*ЗАКЛАДКИ*/
DROP TABLE IF EXISTS favourites;
CREATE TABLE favourites (
	user_id BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT favourites_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT favourites_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
/*ОБРАТНАЯ СВЯЗЬ*/
DROP TABLE IF EXISTS users_feedback;
CREATE TABLE users_feedback (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	feedback_text TEXT NOT NULL,
	user_name VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL,
	phone_number VARCHAR(120) NOT NULL,
	city_id BIGINT UNSIGNED,
	is_solved BOOLEAN DEFAULT 0,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	solved_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT users_feedback_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
	CONSTRAINT users_feedback_city_id_fk FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE SET NULL
);
/*АКЦИИ*/
DROP TABLE IF EXISTS promos;
CREATE TABLE promos (
	id SERIAL PRIMARY KEY,
	description TEXT NOT NULL,
	product_id BIGINT UNSIGNED,
	product_type_id BIGINT UNSIGNED,
	region_id BIGINT UNSIGNED,
	promo_starts DATETIME,
	promo_ends DATETIME,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT promos_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT,
	CONSTRAINT promos_product_type_id_fk FOREIGN KEY (product_type_id) REFERENCES product_type(id) ON DELETE RESTRICT,
	CONSTRAINT promos_region_id_fk FOREIGN KEY (region_id) REFERENCES regions(id) ON DELETE RESTRICT
);

/*ТАБЛИЦА ТИПОВ ЗАКАЗА */
DROP TABLE IF EXISTS order_types;
CREATE TABLE order_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);
/*ЗАКАЗЫ*/
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED NOT NULL,
	shops_id BIGINT UNSIGNED,
	order_type_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT orders_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
	CONSTRAINT orders_shops_id_fk FOREIGN KEY (shops_id) REFERENCES shops(id) ON DELETE SET NULL,
	CONSTRAINT orders_order_type_id_fk FOREIGN KEY (order_type_id) REFERENCES order_types(id) ON DELETE RESTRICT,
	CONSTRAINT orders_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT
);
/*ТАБЛИЦА ТИПОВ МЕДИА ФАЙЛОВ */
DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);
/*МЕДИА ФАЙЛЫ */
DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
	media_type_id BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	file_directory VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT media_media_type_id_fk FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON DELETE RESTRICT,
	CONSTRAINT media_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT
);
/*СКЛАД*/
DROP TABLE IF EXISTS storage;
CREATE TABLE storage (
	product_id BIGINT UNSIGNED NOT NULL,
	shop_id BIGINT UNSIGNED NOT NULL,
	quantity INT UNSIGNED,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT storage_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT,
	CONSTRAINT storage_shop_id_fk FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE RESTRICT
);


