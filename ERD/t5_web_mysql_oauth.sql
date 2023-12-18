SELECT * FROM t5_user ORDER BY id DESC;

ALTER TABLE t5_user
    ADD COLUMN provider varchar(40);

ALTER TABLE t5_user
    ADD COLUMN providerId varchar(200);