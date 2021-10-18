-- test success

--pass
create table menu_type(
	mety_name varchar(55), --appetizer, main course, dessert
	constraint mety_name_pk primary key (mety_name)
);

--pass
create table resto_category(
	reca_name varchar(15), --japanese, chinese, indonesian, western
	reca_desc varchar(55),
	constraint reca_name_pk primary key (reca_name)
);

--pass
-- note: id 1-3 adalah admin
create table users(
	user_id serial,
	user_name varchar(20),
	user_email varchar(55),
	user_password varchar(100),
	user_handphone varchar(15),
	user_roles varchar(15), --admin, user, seller
	constraint user_id_pk primary key (user_id)
);

-- pass
-- yang membuat address hanya user dan seller
-- user bisa multi address
create table address(
	addr_id serial,
	addr_name varchar(255),
	addr_detail varchar(55),
	addr_latitude varchar(200), --kordinat
	addr_longitude varchar(200), --kordinat
	addr_user_id int,
	constraint addr_id_pk primary key (addr_id),
	constraint addr_user_id_fk foreign key (addr_user_id) references users(user_id) on update cascade on delete cascade
);

--pass
-- untuk seller
create table resto_shop(
	reto_id serial,
	reto_name varchar(155),
	reto_open_hours varchar(30), -- 08:30-19:00
	reto_rating integer, --rating ini semua jumlah review, dan dirata-ratakan di fe
	reto_approval boolean, --menunggu aprove dari admin
	reto_user_id integer,
	reto_resto_type varchar(15),
	constraint reto_id_pk primary key (reto_id),
	constraint reto_user_id_fk foreign key (reto_user_id) references users(user_id) on update cascade on delete cascade,
	constraint reto_resto_type_fk foreign key (reto_resto_type) references resto_category(reca_name) on update cascade on delete cascade
);

-- pass
-- review untuk user saja
create table resto_reviews(
	rere_id serial,
	rere_comments varchar(255),
	rere_rating integer, --skalanya 1-5
	rere_user_id integer,
	rere_reto_id integer,
	constraint rere_id_pk primary key (rere_id), 
	constraint rere_user_id_fk foreign key (rere_user_id) references users(user_id) on update cascade on delete cascade,
	constraint rere_reto_id_fk foreign key (rere_reto_id) references resto_shop(reto_id) on update cascade on delete cascade
);


-- pass
-- hanya dari seller yang sudah di approved
create table resto_menu(
	reme_id serial,
	reme_name varchar(55),
	reme_desc varchar(255),
	reme_price numeric(15,2),
	reme_url_image varchar(200), --banyak gambar
	reme_mety_name varchar(55),
	reme_reto_id integer,
	constraint reme_id_pk primary key (reme_id),
	constraint reme_mety_name_fk foreign key (reme_mety_name) references menu_type(mety_name) on update cascade on delete cascade,
	constraint reme_reto_id_fk foreign key (reme_reto_id) references resto_shop(reto_id) on update cascade on delete cascade
);

-- pass
-- seller only
create table resto_addon(
	redon_id serial,
	redon_name varchar(55),
	redon_price numeric(15,2),
	redon_reme_id integer,
	constraint redon_id_pk primary key (redon_id),
	constraint redon_reme_id_fk foreign key (redon_reme_id) references resto_menu(reme_id) on update cascade on delete cascade
);

-- user only
create table carts(
	cart_id serial,
	cart_createdon date,
	cart_status varchar(15), --opened, closed
	cart_reto_id integer,
	cart_user_id integer,
	constraint cart_id_pk primary key (cart_id),
	constraint cart_reto_id_fk foreign key (cart_reto_id) references resto_shop(reto_id) on update cascade on delete cascade,
	constraint cart_user_id_fk foreign key (cart_user_id) references users(user_id) on update cascade on delete cascade
);

create sequence seq_ord_number
increment 1
minvalue 1
maxvalue 9223372036854775807
start 1;

create or replace function function_ord_name() returns varchar as $$
select concat('ORD',to_char(now(),'YYYYMMDD'),'#',lpad(''||nextval('seq_ord_number'),3,'0'))
$$ language sql;

create table order_menu(
	order_name varchar(15) default function_ord_name(),
	order_created date,
	order_subtotal numeric(15,2),
	order_qty integer,
	order_tax numeric(15,2),
	order_delivery numeric(15,2),
	order_discount numeric(15,2),
	order_promo numeric(15,2),
	order_total_price numeric(15,2),
	order_status varchar(15),
	order_payment_type varchar(15), -- ovo
	order_payment_trx varchar(15),
	order_user_id integer,
	constraint order_name_pk primary key (order_name),
	constraint order_user_id_fk foreign key (order_user_id) references users(user_id) on update cascade on delete cascade
);



--payment

create sequence seq_bank_number
increment 1
minvalue 1
maxvalue 9223372036854775807
start 1;

create or replace function function_bank_id() returns varchar as $$
select lpad(''||nextval('seq_bank_number'),3,'0')
$$ language sql;

-- pass
create table bank(
	bank_id varchar(3) default function_bank_id(),
	bank_name varchar(25),
	constraint bank_id_pk primary key (bank_id)
);

-- pass
create table bank_account(
	baac_acc_bank varchar(25), --inputan dari user
	baac_owner varchar(85), -- atas nama
	baac_saldo numeric(15,2), 
	baac_pin_number varchar(6),
	baac_start_date date, --
	baac_end_date date, -- tanggal kadaluarsa
	baac_type varchar(20), --debit | credit card
	baac_user_id integer,
	baac_bank_id varchar(3),
	constraint baac_acc_bank_pk primary key (baac_acc_bank),
	constraint baac_user_id_fk foreign key (baac_user_id) references users(user_id) on update cascade on delete cascade,
	constraint baac_bank_id_fk foreign key (baac_bank_id) references bank(bank_id) on update cascade on delete cascade
);

create sequence seq_acc_number
increment 1
minvalue 1
maxvalue 9223372036854775807
start 1;

create or replace function function_acc_number() returns varchar as $$
select concat('ACP-ID-',lpad(''||nextval('seq_acc_number'),4,'0'))
$$ language sql;

--pass
create table account_payment(
	acc_number varchar(15) default function_acc_number(),
	acc_saldo numeric(15,2),
	acc_pin_number varchar(6),
	acc_total_point integer,
	acc_user_id integer,
	constraint acc_number_pk primary key (acc_number),
	constraint acc_user_id_fk foreign key (acc_user_id) references users(user_id) on update cascade on delete cascade
);

create sequence seq_trx_number
increment 1
minvalue 1
maxvalue 9223372036854775807
start 1;

create or replace function function_trx_number() returns varchar as $$
select concat('P',to_char(now(),'YYYYMMDD'),'#',lpad(''||nextval('seq_trx_number'),5,'0'))
$$ language sql;

--pass
create table payment_transaction(
	payt_id serial,
	payt_trx_number varchar(15) default function_trx_number(),
	payt_order_number varchar(150), -- nilai order_name
	payt_baac_acc_bank varchar(25),
	payt_trx_number_ref varchar(25), -- optional
	payt_date timestamp default now(),
	payt_debit integer,
	payt_credit integer,
	payt_desc varchar(255),
	payt_type varchar(20), --order|topup|refund
	payt_promo_point integer,
	payt_acc_number varchar(15),
	constraint payt_id_pk primary key (payt_id),
	constraint payt_order_number_fk foreign key (payt_order_number) references order_menu(order_name) on update cascade on delete cascade,
	constraint payt_baac_acc_bank_fk foreign key (payt_baac_acc_bank) references bank_account(baac_acc_bank) on update cascade on delete cascade,
	constraint payt_acc_number_fk foreign key (payt_acc_number) references account_payment(acc_number) on update cascade on delete cascade
);

