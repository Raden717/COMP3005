PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS market;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS item_specialties;
DROP TABLE IF EXISTS item_selling;
DROP TABLE IF EXISTS snapping;
DROP TABLE IF EXISTS snapping_info;

CREATE TABLE market(
  mid integer NOT NULL primary key, --market id
  server varchar(10) NOT NULL --server name associated with mid
);

INSERT INTO market VALUES(1, 'GLOBAL');
INSERT INTO market VALUES(2, 'SEA');
INSERT INTO market VALUES(3, 'CN');

CREATE TABLE categories(
  mid integer NOT NULL, --market id
  catname varchar(15), --cat name
  primary key (mid, catname),
  foreign key (mid) references market(mid) on delete cascade
);

INSERT INTO categories VALUES(1, 'Equipment');
INSERT INTO categories VALUES(1, 'Blueprint');
INSERT INTO categories VALUES(1, 'Material');
INSERT INTO categories VALUES(1, 'Headwear');

INSERT INTO categories VALUES(2, 'Equipment');
INSERT INTO categories VALUES(2, 'Blueprint');
INSERT INTO categories VALUES(2, 'Material');
INSERT INTO categories VALUES(2, 'Headwear');

INSERT INTO categories VALUES(3, 'Equipment');
INSERT INTO categories VALUES(3, 'Blueprint');
INSERT INTO categories VALUES(3, 'Material');
INSERT INTO categories VALUES(3, 'Headwear');

CREATE TABLE item(
  id integer NOT NULL primary key, --item id
  mid integer NOT NULL references categories(mid), --market id
  name varchar(15), -- name
  rarity varchar(10), --rarity of item
  catname varchar(15) NOT NULL references categories(catname)
);

INSERT INTO item VALUES (100, 1, 'IRON', 'COMMON', 'Material');
INSERT INTO item VALUES (101, 1, 'GOLD', 'UNCOMMON', 'Material');
INSERT INTO item VALUES (102, 1, 'CROCE STAFF', 'RARE', 'Equipment');
INSERT INTO item VALUES (103, 1, 'WIZARD STAFF', 'RARE', 'Equipment');
INSERT INTO item VALUES (104, 1, 'GOLDEN WINGS BLUEPRINT', 'UNCOMMON', 'Blueprint');
INSERT INTO item VALUES (105, 1, 'HOLY SWORD', 'RARE', 'Equipment');
INSERT INTO item VALUES (106, 1, 'HOLY BOW', 'RARE', 'Equipment');
INSERT INTO item VALUES (107, 1, 'HOLY SHIELD', 'RARE', 'Equipment');
INSERT INTO item VALUES (108, 1, 'WOODEN SWORD', 'COMMON', 'Equipment');
INSERT INTO item VALUES (109, 1, 'WOODEN SHIELD', 'COMMON', 'Equipment');

INSERT INTO item VALUES (200, 2, 'IRON', 'COMMON', 'Material');
INSERT INTO item VALUES (201, 2, 'DIAMOND', 'RARE', 'Material');
INSERT INTO item VALUES (202, 2, 'CROCE STAFF', 'RARE', 'Equipment');
INSERT INTO item VALUES (203, 2, 'IRON SWORD', 'UNCOMMON', 'Equipment');
INSERT INTO item VALUES (204, 2, 'HOLY BOW', 'RARE', 'Equipment');
INSERT INTO item VALUES (205, 2, 'GOLD', 'UNCOMMON', 'Material');
INSERT INTO item VALUES (206, 2, 'HOLY SHIELD', 'RARE', 'Equipment');
INSERT INTO item VALUES (207, 2, 'GOLDEN HELMET', 'UNCOMMON', 'Headwear');
INSERT INTO item VALUES (208, 2, 'MONOCLE', 'RARE', 'Headwear');
INSERT INTO item VALUES (209, 2, 'MONOCLE BLUEPRINT', 'RARE', 'Blueprint');

INSERT INTO item VALUES (300, 3, 'IRON', 'COMMON', 'Material');
INSERT INTO item VALUES (301, 3, 'BRONZE', 'COMMON', 'Material');
INSERT INTO item VALUES (302, 3, 'CROCE STAFF', 'RARE', 'Equipment');
INSERT INTO item VALUES (303, 3, 'SHIELD SHARDS', 'UNCOMMON', 'Material');
INSERT INTO item VALUES (304, 3, 'HOLY SHIELD', 'COMMON', 'Equipment');
INSERT INTO item VALUES (305, 3, 'BRONZE HELMET BLUEPRINT', 'UNCOMMON', 'Blueprint');
INSERT INTO item VALUES (306, 3, 'BRONZE HELMET', 'UNCOMMON', 'Headwear');
INSERT INTO item VALUES (307, 3, 'GLASSES BLUEPRINT', 'COMMON', 'Blueprint');
INSERT INTO item VALUES (308, 3, 'GLASSES', 'COMMON', 'Headwear');
INSERT INTO item VALUES (309, 3, 'HOLY BOW', 'RARE', 'Equipment');

CREATE TABLE item_selling(
  name varchar(30) NOT NULL,
  stock integer NOT NULL, --amount of items
  price integer NOT NULL, --cost of item
  sid integer NOT NULL primary key, --selling id
  id integer NOT NULL, -- item id
  foreign key (id) references item(id)
);

INSERT INTO item_selling VALUES ('IRON', 200, 5, 1100, 100);
INSERT INTO item_selling VALUES ('GOLD', 150, 10, 1101, 101);
INSERT INTO item_selling VALUES ('GOLDEN WINGS BLUEPRINT', 5, 50, 1104, 104);
INSERT INTO item_selling VALUES ('HOLY BOW', 1, 500, 1106, 106);
INSERT INTO item_selling VALUES ('HOLY SWORD', 1, 500, 1108, 108);
INSERT INTO item_selling VALUES ('HOLY SHIELD', 5, 500, 1107, 107);

INSERT INTO item_selling VALUES ('DIAMOND', 30, 50, 1201, 201);
INSERT INTO item_selling VALUES ('CROCE STAFF', 13, 350, 1202, 202);
INSERT INTO item_selling VALUES ('MONOCLE BLUEPRINT', 1, 250, 1209, 209);
INSERT INTO item_selling VALUES ('GOLD', 100, 5, 1205, 205);
INSERT INTO item_selling VALUES ('MONOCLE', 1, 500, 1208, 208);
INSERT INTO item_selling VALUES ('HOLY SHIELD', 15, 500, 1206, 206);

INSERT INTO item_selling VALUES ('BRONZE', 175, 8, 1301, 301);
INSERT INTO item_selling VALUES ('BRONZE HELMET', 15, 50, 1306, 306);
INSERT INTO item_selling VALUES ('GLASSES BLUEPRINT', 5, 100, 1307, 307);
INSERT INTO item_selling VALUES ('GLASSES', 1, 200, 1308, 308);
INSERT INTO item_selling VALUES ('HOLY BOW', 1, 500, 1309, 309);
INSERT INTO item_selling VALUES ('HOLY SHIELD', 10, 500, 1304, 304);

CREATE TABLE item_specialties(
  isid integer NOT NULL, --item specialty id
  id integer NOT NULL, -- item id
  specialty varchar(5) NOT NULL, --unique item true/false
  primary key (isid, id)
  foreign key (id) references item(id)
);

INSERT INTO item_specialties VALUES (1061, 106, 'TRUE');
INSERT INTO item_specialties VALUES (1081, 108, 'TRUE');
INSERT INTO item_specialties VALUES (2091, 209, 'TRUE');
INSERT INTO item_specialties VALUES (3091, 309, 'TRUE');
INSERT INTO item_specialties VALUES (3081, 308, 'TRUE');


CREATE TABLE snapping(
  snap varchar(5) NOT NULL,
  snapid integer NOT NULL primary key,
  sid integer NOT NULL,
  foreign key (sid) references item_selling(sid)
);

INSERT INTO snapping VALUES ('TRUE', 10001, 1106);
INSERT INTO snapping VALUES ('TRUE', 10002, 1108);
INSERT INTO snapping VALUES ('TRUE', 10003, 1201);
INSERT INTO snapping VALUES ('TRUE', 10004, 1308);
INSERT INTO snapping VALUES ('TRUE', 10005, 1309);

CREATE TABLE snapping_info(
  timeleft integer NOT NULL, --minutes item is on sale for
  snapid integer NOT NULL primary key,
  bidders integer NOT NULL,
  foreign key (snapid) references snapping(snapid)
);

INSERT INTO snapping_info VALUES (100, 10001, 0);
INSERT INTO snapping_info VALUES (65, 10002, 5);
INSERT INTO snapping_info VALUES (81, 10003, 51);
INSERT INTO snapping_info VALUES (41, 10004, 30);
INSERT INTO snapping_info VALUES (32, 10005, 11);

COMMIT;
