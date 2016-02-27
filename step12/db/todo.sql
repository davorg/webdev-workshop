CREATE TABLE item (
  id integer not null auto_increment primary key,
  title varchar(200) not null,
  description text,
  due datetime,
  done boolean not null default false
) Engine=InnoDB;

CREATE TABLE tag (
  id integer not null auto_increment primary key,
  name char(30),
  UNIQUE KEY (name)
) Engine=InnoDB;

CREATE TABLE item_tag (
  item_id integer not null,
  tag_id integer not null,
  PRIMARY KEY (item_id,tag_id),
  FOREIGN KEY (item_id) REFERENCES item(id),
  FOREIGN KEY (tag_id)  REFERENCES tag(id)
) Engine=InnoDB;
