create database laptop_store;

use laptop_store;

# tao bang role
create table role
(
    roleId   int auto_increment not null,
    roleName varchar(255)       not null,
    constraint pk_role primary key (roleId)
);

# tao bang user
create table user
(
    userId   int auto_increment not null,
    username varchar(255)       not null,
    password varchar(255)       not null,
    roleId   int                not null,
    constraint pk_user primary key (userId)
);
alter table user
    add constraint fk_user_role foreign key (roleId) references role (roleId);

# tao bang category
create table category
(
    categoryId   int auto_increment not null,
    categoryName varchar(255)       not null,
    constraint pk_category primary key (categoryId)
);

# tao bang brand
create table brand
(
    brandId   int auto_increment not null,
    brandName varchar(255)       not null,
    constraint pk_category primary key (brandId)
);

# tao bang product
create table product
(
    productId   int auto_increment not null,
    productName varchar(255)       not null,
    brandId     int                not null,
    categoryId  int                not null,
    detail      text,
    quantity    int                not null,
    price       double             not null,
    constraint pk_product primary key (productId)
);
alter table product
    add constraint fk_product_brand foreign key (brandId) references brand (brandId);
alter table product
    add constraint fk_product_category foreign key (categoryId) references category (categoryId);
alter table product
    add image text;

# tao bang image
create table image
(
    imageId   int auto_increment not null,
    productId int                not null,
    link      text               not null,
    constraint pk_image primary key (imageId)
);
alter table image
    add constraint fk_image_product foreign key (productId) references product (productId);

# ----------------------------------------------------------
# tao role
insert into role(roleName)
values ('admin');
insert into role(roleName)
values ('customer');

# tao user
insert into user(username, password, roleId)
values ('admin', 'admin', 1);
insert into user(username, password, roleId)
values ('khanh', 'khanh', 2);
insert into user(username, password, roleId)
values ('huynh', 'huynh', 2);
insert into user(username, password, roleId)
values ('quang', 'quang', 2);
insert into user(username, password, roleId)
values ('khanhnguyen', 'khanhnguyen', 2);
insert into user(username, password, roleId)
values ('dat', 'dat', 2);

# tao category
insert into category(categoryName)
values ('Laptop Gaming');
insert into category(categoryName)
values ('Laptop Văn Phòng');
insert into category(categoryName)
values ('Laptop Ultrabook');
insert into category(categoryName)
values ('Laptop Đồ Họa');
insert into category(categoryName)
values ('Laptop Sinh Viên - Giá Rẻ');

# tao brand
insert into brand(brandName)
values ('ASUS');
insert into brand(brandName)
values ('ACER');
insert into brand(brandName)
values ('DELL');
insert into brand(brandName)
values ('MSI');
insert into brand(brandName)
values ('LENOVO');
insert into brand(brandName)
values ('GIGABYTE');
insert into brand(brandName)
values ('HP');

# tao product
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Dell Vostro 5630', 3, 2, 'Core i5-1340P, 16GB, 512GB, Iris Xe Graphic, 16inch FHD+', 50, 17500000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Lenovo ThinkBook 14 G4', 5, 3, 'Core i7-1255U, 8GB, 512GB, Intel Iris Xe,14inch FHD', 50, 22000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Acer Nitro 16 2023', 2, 1, 'Core i5-13500H, 16GB, 512GB, RTX 4050 6GB, 16inch FHD+ IPS 165Hz', 50, 26000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Gigabyte G5 GE-51VN213SH', 6, 4, 'Core i5-12500H, 16GB, 512GB, RTX 3050 4GB, 15.6inch FHD', 50, 20000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Acer Aspire 3 A315-58-589K', 2, 5, 'Core i5-1135G7, 8GB, 256GB, Intel Iris Xe, 15.6inch FHD', 50, 11500000);

# 16:33 02/08
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Asus ROG Strix SCAR 17', 1, 1, 'R9-7945HX, RAM 32GB, 1TB SSD, RTX 4080, 17.3 inch WQHD', 20, 79600000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Acer Swift 3 SF314-512-56QN', 2, 3, 'Core i5-1240P,RAM 16GB, 512GB, Intel Iris Xe, 14 inch QHD IPS', 30,
        18500000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('HP Pavilion 15-eg2084TU', 7, 3, 'Intel Core i5-1240P,RAM 8GB, 256GB, Intel Iris Xe, 15.6 inch FHD', 10,
        15500000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('HP Envy 16-h0033TX 6K7F9PA', 7, 1,
        'Core i9-12900H,RAM 16GB, 512GB, GeForce RTX 3060 6GB, 16 inch WQXGA IPS 120Hz', 10, 59000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Gigabyte G5 KF-E3VN333SH', 6, 1, 'Core i5-12500H,RAM 8GB, 512GB, RTX 4060 8GB, 15.6 inch FHD 144Hz', 25,
        25200000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Lenovo Ideapad 5 Pro 16ARH7', 5, 2, 'Ryzen 5 6600HS,RAM 16GB, 512GB, RTX 3050 4GB, 16 inch 2.5K', 32,
        22500000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('MSI Modern 14 C11M-011VN', 4, 5, 'Core i3-1115G4,RAM 8GB, 512GB, Intel UHD, 14 inch FHD', 5, 9900000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Dell Inspiron 14 5430 20DY3', 3, 4, '(Intel Core i7-1355U,RAM 16GB, 512GB, Intel Iris Xe, 14.0 inch FHD+', 10,
        26000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Dell XPS 9320 13 Plus', 3, 4, 'Core i5-1340P,RAM 16GB, 512GB, Intel Iris Xe, 13.4 inch 3.5K OLED, Cảm ứng', 5,
        52000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('ASUS TUF Gaming A15 FA507XI', 1, 1, 'Ryzen™ 9 7940HS,RAM 8GB, 512G, RTX™ 4070 8GB, 15.6-inch FHD 144Hz', 20,
        38500000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('Acer Predator Helios Neo PHN16', 2, 1, 'Intel Core i7-13700HX,RAM 16GB, 512GB, RTX 4060 8GB, 16 inch WQXGA', 5,
        40000000);
insert into product(productName, brandId, categoryId, detail, quantity, price)
values ('MSI Stealth 16 Mercedes AMG A13VG', 4, 1, 'Intel Core i9-13900H, 32GB, 2TB, RTX 4070 8GB, 16 inch UHD+', 1,
        81000000);