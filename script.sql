CREATE TABLE tb_wine_reviews(
cod_wine_reviews SERIAL PRIMARY KEY,
country VARCHAR(200),
description VARCHAR(200),
points INT,
price NUMERIC(5,2)
);