create schema if not exists states_examples

create table if not exists states(
	state_name varchar(50) not null,
	state_abbrev char(2) not null,
	state_capital varchar(50),
	state_pop int default 0,
	state_area int default 0
);

drop table if exists states;

create table if not exists states(
	state_id int generated always as identity primary key,
	state_name varchar(50) not null unique,
	state_abbrev char(2) not null unique,
	state_capital varchar(50),
	state_pop int default 0,
	state_area int default 0
);

drop table if exists states;

create table if not exists states(
	state_id int generated always as identity,
	state_name varchar(50) not null unique,
	state_abbrev char(2) not null unique,
	state_capital varchar(50),
	state_pop int default 0,
	state_area int default 0,
	constraint pk_state_id primary key (state_id)
);

drop table if exists states;

create table if not exists states(
	state_id int generated always as identity,
	state_name varchar(50) not null unique,
	state_abbrev char(2) not null unique,
	state_capital varchar(50),
	state_pop int default 0,
	state_area int default 0,
	state_density numeric(10, 2) generated always as (state_pop::float / nullif (state_area, 0)) stored,
	constraint pk_state_id primary key (state_id)
);

insert into states(state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Oregon', 'OR', 'Salem', 4237256, 98379)
;

insert into states(state_name, state_abbrev, state_capital, state_pop, state_area) values
	('California', 'CA', 'Sacremento', 39538223, 163695)
;

insert into states(state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Washington', 'WA', 'Olympia', 7705281, 71298)
;

insert into states(state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Connecticut', 'CT', 'Hartford', 3605944, 5543)
;

insert into states(state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Rhode Island', 'RI', 'Providence', 1097379, 1545)
	
;

insert into states(state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Maine', 'ME', 'Augusta', 1362359, 35380)
;

select *
from states
order by state_name desc;

select *
from states
order by state_density desc;

create table if not exists cities(
	city_id int primary key,
	city_name varchar(50) not null,
	state_abbrev varchar(2) not null
);

insert into cities(city_id, city_name, state_abbrev) values
	(1, 'Salem', 'OR'),
	(2, 'Sacremento', 'CA'),
	(3, 'Olympia', 'WA'),
	(4, 'Hartford', 'CT'),
	(5, 'Providence', 'RI'),
	(6, 'Portland', 'OR'),
	(7, 'Los Angeles', 'CA'),
	(8, 'Seattle', 'WA'),
	(9, 'Bridgeport', 'CT'),
	(10, 'Portland', 'ME'),
	(11, 'Augusta', 'ME'),
	(12, 'Salem', 'CT')
;

select
	c.city_name,
	s.state_name,
	c.state_abbrev,
	s.state_capital
from 
	cities c 
join 
	states s on c.state_abbrev = s.state_abbrev
order by 
	c.city_name;

drop table if exists states;

create table if not exists states(
	state_id int generated always as identity,
	state_name varchar(50) not null unique,
	state_abbrev char(2) not null unique,
	state_capital int,
	state_pop int default 0,
	state_area int default 0,
	state_density numeric(10, 2) generated always as (state_pop::float / nullif (state_area, 0)) stored,
	constraint pk_state_id primary key (state_id),
	constraint fk_state_capital foreign key (state_capital) references cities(city_id)
);
	
insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Oregon', 'OR', 1, 4237256, 98379);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('California', 'CA', 2, 39538223, 163695);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Washington', 'WA', 3, 7705281, 71298);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Connecticut', 'CT', 4, 3605944, 5543);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Rhode Island', 'RI', 5, 1097379, 1545);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Maine', 'ME', 11, 1362359, 35380);


drop table if exists states;

drop table if exists cities;

create table if not exists cities(
	city_id int primary key,
	city_name varchar(50) not null,
	state_id int
);

create table if not exists states(
	state_id int generated always as identity,
	state_name varchar(50) not null unique,
	state_abbrev char(2) not null unique,
	state_capital int,
	state_pop int default 0,
	state_area int default 0,
	state_density numeric(10, 2) generated always as (state_pop::float / nullif (state_area, 0)) stored,
	constraint pk_state_id primary key (state_id),
	constraint fk_state_capital foreign key (state_capital) references cities(city_id)
);

alter table if exists cities
add constraint 
	fk_cities_state_id
foreign key (state_id)
references
	states (state_id)
deferrable initially deferred;

insert into cities(city_id, city_name) values
	(1, 'Salem'),
	(2, 'Sacremento'),
	(3, 'Olympia'),
	(4, 'Hartford'),
	(5, 'Providence'),
	(6, 'Portland'),
	(7, 'Los Angeles'),
	(8, 'Seattle'),
	(9, 'Bridgeport'),
	(10, 'Portland'),
	(11, 'Augusta'),
	(12, 'Salem')
;

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Oregon', 'OR', 1, 4237256, 98379);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('California', 'CA', 2, 39538223, 163695);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Washington', 'WA', 3, 7705281, 71298);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Connecticut', 'CT', 4, 3605944, 5543);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Rhode Island', 'RI', 5, 1097379, 1545);

insert into states (state_name, state_abbrev, state_capital, state_pop, state_area) values
	('Maine', 'ME', 11, 1362359, 35380);

