-- Active: 1709340086356@@127.0.0.1@3306@phpmyadmin
CREATE TABLE categories(  
    category_id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    category_name varchar(255) not NULL,
    category_small_description VARCHAR(128),
    category_status varchar(3) not null default 'ACT' COMMENT 'Status',
    create_time DATETIME COMMENT 'Create Time' DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME COMMENT 'Create Time' DEFAULT CURRENT_TIMESTAMP 
) COMMENT 'Tabla para las categorias';