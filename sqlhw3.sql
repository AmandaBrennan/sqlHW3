create database if not exists users;

use users;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users(
	user_name varchar(20) not null,
	email varchar(30) not null,
	password varchar(10) not null,
	post_title varchar(60),
	comments varchar(250),
	primary key(user_name)
);

create table posts(
	title varchar(60) not null,
	user_name varchar(20) not null,
	comments varchar(250),
	content_type enum('text', 'video', 'image') not null,
	date_posted datetime default current_timestamp,
	primary key(title),
	foreign key(user_name) references users(user_name)
);

create table comments(
	user_name varchar(20) not null,
	title varchar(60) not null,
	content_type enum('text', 'video', 'image') not null,
	date_commented datetime default current_timestamp,
	primary key(user_name, title),
	foreign key(user_name) references users(user_name),
	foreign key(title) references posts(title)
);