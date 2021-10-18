--user

INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini Admin 1', 'admin1@gmail.com', '123456', '0801212', 'admin');
	
INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini Admin 2', 'admin2@gmail.com', '123456', '0801212', 'admin');
	
INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini Buyer 1', 'buyer1@gmail.com', '123456', '0801212', 'user');

INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini Buyer 2', 'buyer2@gmail.com', '123456', '0801212', 'user');

INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini seller 1', 'seller1@gmail.com', '123456', '0801212', 'seller');

INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini seller 2', 'seller2@gmail.com', '123456', '0801212', 'seller');
	
INSERT INTO public.users(
	user_name, user_email, user_password, user_handphone, user_roles)
	VALUES ('Ini seller 3', 'seller3@gmail.com', '123456', '0801212', 'seller');

-- address

INSERT INTO public.address(
	addr_name, addr_detail, addr_latitude, addr_longitude, addr_user_id)
	VALUES ( 'jln user 1', 'detail user1', '34', '123', 3);
	
INSERT INTO public.address(
	addr_name, addr_detail, addr_latitude, addr_longitude, addr_user_id)
	VALUES ( 'jln user 2', 'detail user2', '34', '123', 4);

INSERT INTO public.address(
	addr_name, addr_detail, addr_latitude, addr_longitude, addr_user_id)
	VALUES ( 'jln seller 1', 'detail seller 1', '34', '123', 5);
	
INSERT INTO public.address(
	addr_name, addr_detail, addr_latitude, addr_longitude, addr_user_id)
	VALUES ( 'jln seller 2', 'detail seller 2', '34', '123', 6);
	
	INSERT INTO public.address(
	addr_name, addr_detail, addr_latitude, addr_longitude, addr_user_id)
	VALUES ( 'jln seller 3', 'detail seller 3', '34', '123', 7);
	

-- resto category
INSERT INTO public.resto_category(
	reca_name, reca_desc)
	VALUES ('japanese', 'ini japanese');
	
INSERT INTO public.resto_category(
	reca_name, reca_desc)
	VALUES ('chinese', 'ini chinese');
	
INSERT INTO public.resto_category(
	reca_name, reca_desc)
	VALUES ('Masakan Padang', 'ini masakan padang');
	
INSERT INTO public.resto_category(
	reca_name, reca_desc)
	VALUES ('Indonesia', 'ini Indonesia');
	

-- resto shop
INSERT INTO public.resto_shop(
	reto_name, reto_open_hours, reto_rating, reto_approval, reto_user_id, reto_resto_type)
	VALUES ( 'Resto Punya Seller 1', '08:00-19:00', 340,TRUE,  5, 'japanese');
	
INSERT INTO public.resto_shop(
	reto_name, reto_open_hours, reto_rating, reto_approval, reto_user_id, reto_resto_type)
	VALUES ( 'Resto Punya Seller 2a', '08:00-19:00', 340,TRUE,  6, 'japanese');
	
INSERT INTO public.resto_shop(
	reto_name, reto_open_hours, reto_rating, reto_approval, reto_user_id, reto_resto_type)
	VALUES ( 'Resto Punya Seller 2b', '08:00-19:00', 340, FALSE,  6, 'chinese');
	
INSERT INTO public.resto_shop(
	reto_name, reto_open_hours, reto_rating, reto_approval, reto_user_id, reto_resto_type)
	VALUES ( 'Resto Punya Seller 3', '08:00-19:00', 340,TRUE,  7, 'chinese');
	

--resto menu type 
INSERT INTO public.menu_type(
	mety_name)
	VALUES ('appetizer');
	
INSERT INTO public.menu_type(
	mety_name)
	VALUES ('main course');
	
INSERT INTO public.menu_type(
	mety_name)
	VALUES ('dessert');
	
	

-- resto menu
-- resto ke 1 -japanese
INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Sushi', 'ini Sushi', 14000, '', 'appetizer', 1);
	
INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Ramen', 'ini Sushi', 50000, '', 'main course', 1);

INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Nerikiri', 'ini Nerikiri', 3000, '', 'dessert', 1);
	
	
-- resto ke 2a --japansese
INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Gyoza', 'ini Gyoza', 34000, '', 'appetizer', 2);
	
INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Baked Teriyaki Salmon', 'ini teriyaki', 150000, '', 'main course', 2);

INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Manju', 'ini Manju', 3000, '', 'dessert', 2);
	
-- resto ke 2b chinese not approval

--resto ke 3 chinese
INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Cantonese Spring Roll', 'ini Cantonese', 24000, '', 'appetizer', 3);
	
INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Cumin Beef', 'ini Cumin Beef', 1250000, '', 'main course', 3);

INSERT INTO public.resto_menu(
	 reme_name, reme_desc, reme_price, reme_url_image, reme_mety_name, reme_reto_id)
	VALUES ('Sesame Ball', 'ini Sesame Ball', 1000, '', 'dessert', 3);
	

--resto addon
INSERT INTO public.resto_addon(
	redon_name, redon_price, redon_reme_id)
	VALUES ( 'Bakso', 3000, 1); 
	--7 10 13
	
INSERT INTO public.resto_addon(
	redon_name, redon_price, redon_reme_id)
	VALUES ( 'Sosis', 1000, 1); 
	
INSERT INTO public.resto_addon(
	redon_name, redon_price, redon_reme_id)
	VALUES ( 'Tempe Goreng', 1000, 2);
	
INSERT INTO public.resto_addon(
	redon_name, redon_price, redon_reme_id)
	VALUES ( 'Tahu Goreng', 1000, 4);

INSERT INTO public.resto_addon(
	redon_name, redon_price, redon_reme_id)
	VALUES ( 'Bakwan', 1000, 4);
	
