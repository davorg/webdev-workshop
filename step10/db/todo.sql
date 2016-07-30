DROP TABLE IF EXISTS item;
CREATE TABLE item (
  id integer not null auto_increment primary key,
  title varchar(200) not null,
  description text,
  due datetime,
  done boolean not null default false
) Engine=InnoDB;

