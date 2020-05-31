INSERT INTO regions(name) VALUES 
	('Krasnodarskiy_kray'),
	('Moscow oblast'),
	('Rostov oblast');


INSERT INTO cities(name, region_id) VALUES
	('Moscow', 2),
	('Krasnodar', 1),
	('Rostov on Don', 3),
	('Sochi', 1);


INSERT INTO shops(city_id, adress, email, phone_number, opens_at, closes_at) VALUES
	(1, 'Amore Circle Apt. 520', 'carissa58@example.org', '034-390-7379', '10:00:00', '21:00:00'),
	(1, '660 Ubaldo Views Apt.', 'kaleb98@example.net', '+18(0)3250435362', '10:00:00', '21:00:00'),
	(2, '11885 Destin Manor Suite', 'myles.runolfsson@example.com', '+38(3)4424982747', '10:00:00', '21:00:00'),
	(3, 'Amore Circle Apt. 520', 'weimann.matt@example.org', '(066)324-9095', '10:00:00', '21:00:00'),
	(2, 'Amore Circle Apt. 520', 'breitenberg.lessie@example.com', '1-891-582-9607', '10:00:00', '21:00:00'),
	(4, 'Amore Circle Apt. 520', 'tconnelly@example.org', '02748273862', '10:00:00', '21:00:00');


INSERT INTO main_categories(name) VALUES
	('home appliances'),
	('computers and parts'),
	('phones'),
	('tv and audio');


INSERT INTO sub_categories(name, main_category_id) VALUES
	('kitchen', 1),
	('bathroom', 1),
	('computers', 2),
	('PC parts', 2),
	('mouse/keyboards', 2),
	('smartphones', 3),
	('tablets', 3),
	('TV', 4), 
	('audio', 4);


INSERT INTO product_type(name, sub_category_id) VALUES
	('toasters', 1),
	('coffie machines', 1),
	('hair dryers', 2),
	('washing machines', 2),
	('base unit', 3),
	('laptops', 3),
	('processors', 4),
	('video cards', 4),
	('mouses', 5),
	('android', 6),
	('ios', 7),
	('smart tv', 8),
	('regular tv', 8),
	('speakers', 9),
	('players', 9);
	
	
INSERT INTO products(name, price, description, product_type_id) VALUES
	('Bosh TAT 3F011', 2000, 'Многофункциональный тостер Bosch TAT 3A011 станет идеальным помощником в каждом доме.', 1),
	('Delonghi 2600', 25000, 'Кофемашина Delonghi ESAM 2600 предназначена для приготовления напитков из зернового и молотого кофе. ', 2),
	('BaByliss D410E', 2000, 'Фен BaByliss D410E имеет четыре температурных и два скоростных режима с независимой регулировкой, обеспечивающей возможность гибкой настройки параметров работы техники.', 3),
	('Haier HW70-12829A', 20000, 'Aвтоматическая стиральная машина Haier HW70-12829A характеризуется максимальной загрузкой, равной 7 кг', 4),
	('Acer Aspire XC-330', 12000, 'ПК Acer Aspire XC-330 в тонком корпусе черного цвета отлично впишется в офисный или домашний интерьер. ', 5),
	('HP 15s-fq1013ur', 28000, 'Выпускается 15.6" ультрабук HP 15s-fq1013ur в серебристом корпусе из надежного пластика. Качество сборки устройства высокое', 6),
	('AMD Sempron 2650', 1500, 'роцессор AMD Sempron 2650 объединяет оптимальные технические характеристики и высокое качество исполнения. ', 7),
	('KFA2 GeForce GT 710', 2800, 'Если вы хотите собрать по-настоящему тихий компьютер, но возможности интегрированного видео вас по каким-то причинам не устраивают, то рассматриваемая модель видеокарты станет для вас отличным выбором', 8),
	('SVEN RX-200', 600, 'Мышь проводная SVEN RX-200 с многоцветной RGB-подсветкой станет одним из лучших приобретений для геймера', 9),
	('HTC Wildfire E1', 8000, 'Смартфон HTC Wildfire E1 может узнавать своего хозяина по лицу или по отпечатку пальца. ', 10),
	('Apple iPad 2019', 28000, 'Планшет Apple iPad 2019 – это мощная аппаратная часть, дружелюбный интерфейс и множество полезных функций, способных порадовать как рядового пользователя, так и профессионала', 11),
	('LED LG 24MT49S-PZ', 14000, 'Телевизор LED LG 24MT49S-PZ с диагональю экрана, равной 24 дюймам (60 см), станет оптимальным приобретением для установки в помещение с небольшой или средней площадью', 12),
	('Haier LE24K6000S', 7000, ' LED Haier LE24K6000S с тонким черным корпусом получил экран на основе матрицы Direct LED с разрешением 1366x768 пикселей.', 13),
	('Sven PS-40BL', 500, 'Портативная аудиосистема Sven PS-40BL – акустическая система для воспроизведения музыки с независимым автономным источником питания.', 14),
	('MP3 плеер Aceline i-100', 300, 'Выполненный в дизайне серебристый цвета плеер MP3 Aceline I-100 имеет особую форму исполнения в виде клипсы', 15);


INSERT INTO colours(name) VALUES
	('black'),
	('white');


INSERT INTO manufacturers(name) VALUES
	('Bosh'),
	('Delonghi'),
	('BaByliss'),
	('Haier'),
	('Acer'),
	('HP'),
	('AMD'),
	('GeForce'),
	('SVEN'),
	('HTC'),
	('Apple'),
	('LG'),
	('Sven'),
	('Aceline');


INSERT INTO product_specifications(product_id, manufacturer_id, model_name, colour_id, product_power, width, height, deepth, weight) VALUES
	(1, 1, 'TAT 3F011', 1, 100, 10, 10, 10, 20),
	(2, 2, '2600', 2, 233, 10, 10, 10, 20),
	(3, 3, 'D410E', 2, 3500, 10, 10, 10, 20),
	(4, 4, 'HW70-12829A', 2, 333, 10, 10, 10, 20),
	(5, 5, 'Aspire XC-330', 2, 500, 10, 10, 10, 20),
	(6, 6, '15s-fq1013ur', 1, 800, 10, 10, 10, 20),
	(7, 7, 'Sempron 2650', 1, 660, 10, 10, 10, 20),
	(8, 8, 'GT 710', 2, 20, 10, 10, 10, 20),
	(9, 9, 'RX-200', 1, 180, 10, 10, 10, 20),
	(10, 10, 'Wildfire E1', 1, 210, 10, 10, 10, 20),
	(11, 11, 'iPad 2019', 2, 10, 10, 10, 10, 20),
	(12, 12, '24MT49S-PZ', 2, 20, 10, 10, 10, 20),
	(13, 4, 'LE24K6000S', 1, 200, 10, 10, 10, 20),
	(14, 13, 'PS-40BL', 2, 90, 10, 10, 10, 20),
	(15, 14, 'i-100', 2, 120, 10, 10, 10, 20);


INSERT INTO users(first_name, last_name, email, phone_number, birth_date, city_id) VALUES
	('Quinton', 'Ullrich', 'bobby.lang@example.org', '1-508-845-8688', '1990-06-29', 1),
	('Martina', 'Huel', 'teagan.hyatt@example.com', '+75(3)6820337827', '1994-05-21', 1),
	('Armand', 'Cruickshank', 'malcolm77@example.com', '09477301335', '2016-04-16', 2),
	('Jensen', 'West', 'kjast@example.net', '05511838731', '1983-05-16', 2),
	('Harley', 'Bashirian', 'simeon26@example.com', '1-898-504-9999x016', '1978-11-10', 2),
	('Issac', 'Dare', 'jonatan.hackett@example.com', '561-300-7485x77071', '1978-07-11', 1),
	('Charles', 'Thiel', 'ehoppe@example.com', '1-173-946-8783x244', '2001-08-12', 3),
	('Aubree', 'Prosacco', 'vladimir.halvorson@example.net', '595-238-8724x2269', '1982-09-16', 4),
	('Edison', 'Adams', 'vtremblay@example.com', '794-577-7332', '1977-03-30', 1),
	('Scarlett', 'Cummings', 'nmohr@example.com', '+97(4)2069622282', '2018-04-02', 4);
	

INSERT INTO products_reviews(user_id, product_id, rate, review) VALUES
	(1, 1, 5, 'Quia sed veniam sequi. Voluptate consequatur at quod rerum at'),
	(10, 1, 4, 'Distinctio quia sunt quas temporibus asperiores nam. Et libero'),
	(7, 1, 3, 'Aut neque possimus nihil quo non');
	

INSERT INTO favourites(user_id, product_id) VALUES
	(1, 2),
	(1, 9),
	(3, 1);


INSERT INTO users_feedback (user_id, feedback_text, user_name, email, phone_number, city_id) VALUES
	(NULL, 'Illum alias fugit repudiandae perferendis voluptatem sunt cupiditate vitae. Totam veniam est nihil quas et hic mollitia. Rerum alias quo harum.', 'Rhegis', 'example@ex.com', '+7888445114', 1);


INSERT INTO promos(description, product_id, product_type_id, region_id, promo_starts, promo_ends) VALUES
 ('Скидки на процессоры в Московской обсласти', NULL, 7, 2, '2020-06-01 10:00:00', '2020-07-01 00:00:00');


INSERT INTO order_types(name) VALUES
	('in cart'),
	('payed'),
	('received');


INSERT INTO media_types(name) VALUES
	('video'),
	('photo');


INSERT INTO media(media_type_id, product_id, file_directory) VALUES
	(2, 1, 'http://www.mayerwisozk.info/1.jpeg'),
	(2, 2, 'http://www.mayerwisozk.info/2.jpeg'),
	(2, 3, 'http://www.mayerwisozk.info/3.jpeg'),
	(2, 4, 'http://www.mayerwisozk.info/4.jpeg'),
	(2, 5, 'http://www.mayerwisozk.info/5.jpeg'),
	(2, 6, 'http://www.mayerwisozk.info/6.jpeg'),
	(2, 7, 'http://www.mayerwisozk.info/7.jpeg'),
	(2, 8, 'http://www.mayerwisozk.info/8.jpeg'),
	(2, 9, 'http://www.mayerwisozk.info/9.jpeg'),
	(2, 10, 'http://www.mayerwisozk.info/10.jpeg'),
	(2, 11, 'http://www.mayerwisozk.info/11.jpeg'),
	(2, 12, 'http://www.mayerwisozk.info/12.jpeg'),
	(2, 13, 'http://www.mayerwisozk.info/13.jpeg'),
	(2, 14, 'http://www.mayerwisozk.info/14.jpeg'),
	(2, 15, 'http://www.mayerwisozk.info/15.jpeg');
	
	
INSERT INTO storage(product_id, shop_id, quantity) VALUES
	(1, 1, 10),
	(2, 1, 10),
	(3, 1, 11),
	(4, 1, 10),
	(5, 1, 12),
	(6, 1, 11),
	(7, 1, 15),
	(8, 1, 12),
	(9, 1, 13),
	(10, 1, 12),
	(11, 1, 10),
	(12, 1, 13),
	(13, 1, 11),
	(14, 1, 12),
	(15, 1, 13),
	(1, 2, 0),
	(2, 2, 5),
	(3, 2, 1),
	(4, 2, 0),
	(5, 2, 0),
	(6, 2, 1),
	(7, 2, 5),
	(8, 2, 2),
	(9, 2, 3),
	(10, 2, 2),
	(11, 2, 3),
	(12, 2, 3),
	(13, 2, 1),
	(14, 2, 3),
	(15, 2, 3),
	(1, 3, 3),
	(2, 3, 0),
	(3, 3, 1),
	(4, 3, 2),
	(5, 3, 1),
	(6, 3, 1),
	(7, 3, 5),
	(8, 3, 2),
	(9, 3, 0),
	(10, 3, 0),
	(11, 3, 1),
	(12, 3, 1),
	(13, 3, 1),
	(14, 3, 1),
	(15, 3, 1),
	(1, 4, 1),
	(2, 4, 1),
	(3, 4, 1),
	(4, 4, 1),
	(5, 4, 2),
	(6, 4, 2),
	(7, 4, 4),
	(8, 4, 4),
	(9, 4, 4),
	(10, 4, 22),
	(11, 4, 10),
	(12, 4, 11),
	(13, 4, 9),
	(14, 4, 0),
	(15, 4, 12);


INSERT INTO orders(user_id, product_id, shops_id, order_type_id) VALUES
	(1, 1, 1, 3),
	(10, 1, 1, 3),
	(7, 1, 1, 3),
	(3, 2, 1, 1),
	(4, 3, 1, 2);