show databases;
show tables from ecommerce;
use ecommerce;


-- Criação de índices
-- Índices importantes para pedidos: Pedidos são dados mais acessados em e-commerce
-- Índice para busca de pedidos por cliente
CREATE INDEX idx_orders_client
ON orders(idOrderClient);

-- Índice para relacionamento pedido-produto
CREATE INDEX idx_productorder_order
ON productorder(idOrder);

CREATE INDEX idx_productorder_product
ON productorder(idProduct);

-- Índice para otimizar agrupamento de vendedores por cidade
CREATE INDEX idx_seller_location
ON seller(Location);

-- Índice para melhorar JOIN entre seller e productseller
CREATE INDEX idx_productseller_seller
ON productseller(idSeller);

-- Índice na chave de busca do seller
CREATE INDEX idx_seller_id
ON seller(idSeller);


-- Criação da Procedure
USE ecommerce;

DELIMITER $$

CREATE PROCEDURE manage_product(
    IN p_action INT,
    IN p_id INT,
    IN p_name VARCHAR(10),
    IN p_category VARCHAR(20),
    IN p_price FLOAT
)

BEGIN

IF p_action = 1 THEN

    SELECT * FROM product;

ELSEIF p_action = 2 THEN

    INSERT INTO product(idProduct, Pname, Category, Price)
    VALUES (p_id, p_name, p_category, p_price);

ELSEIF p_action = 3 THEN

    UPDATE product
    SET Pname = p_name,
        Category = p_category,
        Price = p_price
    WHERE idProduct = p_id;

ELSEIF p_action = 4 THEN

    DELETE FROM product
    WHERE idProduct = p_id;

END IF;

END $$

DELIMITER ;

-- Chamando a Procedure
-- SELECT
CALL manage_product(1, NULL, NULL, NULL, NULL);

-- INSERT
CALL manage_product(2, 10, 'Mouse', 'Electronico', 120);

-- UPDATE
CALL manage_product(3, 10, 'MouseRGB', 'Electronico', 150);

-- DELETE
CALL manage_product(4, 10, NULL, NULL, NULL);



