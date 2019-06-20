set character_set_client=utf8;
set character_set_results=utf8;
set character_set_connection=utf8;
set character_set_server=utf8;
set character_set_database=utf8;
drop table if exists `subwayuse`;
create table subway(udate char(8), route char(10), stid char(4) primary key, \
stname char(20), ptnum int(6), pdnum int(6), regd char(8));
load data local infile "CARD_SUBWAY_MONTH_201903.csv" into table subway fields terminated by ',' \
enclosed by '"' lines terminated by '\n' ignore 1 rows;
