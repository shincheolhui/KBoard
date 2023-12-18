SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS t5_attachment;
DROP TABLE IF EXISTS t5_user_authorities;
DROP TABLE IF EXISTS t5_authority;
DROP TABLE IF EXISTS t5_comment;
DROP TABLE IF EXISTS t5_post;
DROP TABLE IF EXISTS t5_user;




/* Create Tables */

CREATE TABLE t5_attachment
(
	id int NOT NULL AUTO_INCREMENT,
	post_id int NOT NULL,
	sourcename varchar(100) NOT NULL,
	filename varchar(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE t5_authority
(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(40) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (name)
);


CREATE TABLE t5_comment
(
	id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	post_id int NOT NULL,
	content text NOT NULL,
	regdate datetime DEFAULT now(),
	PRIMARY KEY (id)
);


CREATE TABLE t5_post
(
	id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	subject varchar(200) NOT NULL,
	content longtext,
	viewcnt int DEFAULT 0,
	regdate datetime DEFAULT now(),
	PRIMARY KEY (id)
);


CREATE TABLE t5_user
(
	id int NOT NULL AUTO_INCREMENT,
	username varchar(100) NOT NULL,
	password varchar(100) NOT NULL,
	name varchar(80) NOT NULL,
	email varchar(80),
	regdate datetime DEFAULT now(),
	PRIMARY KEY (id),
	UNIQUE (username)
);


CREATE TABLE t5_user_authorities
(
	user_id int NOT NULL,
	authority_id int NOT NULL,
	PRIMARY KEY (user_id, authority_id)
);



/* Create Foreign Keys */

ALTER TABLE t5_user_authorities
	ADD FOREIGN KEY (authority_id)
	REFERENCES t5_authority (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE t5_attachment
	ADD FOREIGN KEY (post_id)
	REFERENCES t5_post (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE t5_comment
	ADD FOREIGN KEY (post_id)
	REFERENCES t5_post (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE t5_comment
	ADD FOREIGN KEY (user_id)
	REFERENCES t5_user (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE t5_post
	ADD FOREIGN KEY (user_id)
	REFERENCES t5_user (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE t5_user_authorities
	ADD FOREIGN KEY (user_id)
	REFERENCES t5_user (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;



