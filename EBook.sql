CREATE TABLE bookDetails (
  bookId int NOT NULL AUTO_INCREMENT,
  bookName varchar(45) DEFAULT NULL,
  author varchar(45) DEFAULT NULL,
  price double DEFAULT NULL,
  bookCategory varchar(45) DEFAULT NULL,
  status varchar(45) DEFAULT NULL,
  photo varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  PRIMARY KEY (bookId)
);

CREATE TABLE bookOrder (
  id int NOT NULL AUTO_INCREMENT,
  orderId varchar(45) DEFAULT NULL,
  userName varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  address varchar(500) DEFAULT NULL,
  phno varchar(45) DEFAULT NULL,
  bookName varchar(45) DEFAULT NULL,
  author varchar(45) DEFAULT NULL,
  price varchar(45) DEFAULT NULL,
  payment varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE cart (
  cid int NOT NULL AUTO_INCREMENT,
  bid int DEFAULT NULL,
  uid int DEFAULT NULL,
  bookName varchar(45) DEFAULT NULL,
  author varchar(45) DEFAULT NULL,
  price double DEFAULT NULL,
  totalPrice double DEFAULT NULL,
  PRIMARY KEY (cid)
);

CREATE TABLE user (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  phno varchar(45) DEFAULT NULL,
  password varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

