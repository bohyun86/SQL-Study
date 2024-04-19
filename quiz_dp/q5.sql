-- 뮨재5,

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    log_message VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$
CREATE TRIGGER AfterOrderInsert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, log_message)
	VALUES (NEW.order_id, CONCAT(NEW.customer_name, ' 고객님이 ', NEW.order_amount, ' 주문을 했습니다.'));
END$$
DELIMITER ;

INSERT INTO orders (customer_name, order_date, order_amount)
VALUES ('Peter', '2023-10-01', 20000);


SELECT * FROM order_logs;

