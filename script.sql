-- 2 Cursor não vinculado
-- Calcular o preço médio dos vinhos de cada país utilizando um cursor não vinculado.

DO $$
DECLARE
	--1. declaração do cursor 
    v_country VARCHAR(200);
    v_avg_price NUMERIC;
BEGIN
	--2. abertura do cursor 
    -- Variável temporária para calcular a média de preços
    CREATE TEMP TABLE temp_avg_prices AS
    SELECT
        country,
        AVG(price) AS avg_price
    FROM
        tb_wine_reviews
    GROUP BY
        country;

    -- Loop através dos países e exibir a média de preços
    FOR v_country IN (SELECT DISTINCT country FROM temp_avg_prices)
    LOOP
	--3. recuperação dos dados de interesse
        SELECT avg_price INTO v_avg_price FROM temp_avg_prices WHERE country = v_country;
        RAISE NOTICE 'País: %, Média de Preço: %', v_country, v_avg_price;
    END LOOP;
	--4.fechanento de cursor

    -- Limpar a tabela temporária
    DROP TABLE temp_avg_prices;
END;
$$



-- CREATE TABLE tb_wine_reviews(
-- cod_wine_reviews SERIAL PRIMARY KEY,
-- country VARCHAR(200),
-- description VARCHAR(1000),
-- points INT,
-- price NUMERIC(5,2)
-- );

-- ALTER TABLE tb_wine_reviews ALTER COLUMN price TYPE NUMERIC;