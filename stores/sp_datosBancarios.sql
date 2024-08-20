DELIMITER $$

CREATE PROCEDURE sp_create_datos_bancarios (
    IN p_id_trabajador INT,
    IN p_banco VARCHAR(20),
    IN p_numero_cuenta_abono VARCHAR(20),
    IN p_codigo_interbancario CHAR(20)
)
BEGIN
    INSERT INTO datos_bancarios (
        id_trabajador, banco, numero_cuenta_abono, codigo_interbancario, estado
    ) 
    VALUES (
        p_id_trabajador, p_banco, p_numero_cuenta_abono, p_codigo_interbancario, '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_datos_bancarios (
    IN p_id INT
)
BEGIN
    SELECT * FROM datos_bancarios WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_datos_bancarios (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_banco VARCHAR(20),
    IN p_numero_cuenta_abono VARCHAR(20),
    IN p_codigo_interbancario CHAR(20)
)
BEGIN
    UPDATE datos_bancarios 
    SET 
        id_trabajador = p_id_trabajador,
        banco = p_banco,
        numero_cuenta_abono = p_numero_cuenta_abono,
        codigo_interbancario = p_codigo_interbancario
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_datos_bancarios (
    IN p_id INT
)
BEGIN
    UPDATE datos_bancarios 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;

