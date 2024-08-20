DELIMITER $$

CREATE PROCEDURE sp_create_trabajo_remoto (
    IN p_id_trabajador INT,
    IN p_condiciones_trabajo_remoto ENUM('Si', 'No'),
    IN p_tipo_computadora ENUM('Laptop', 'Desktop'),
    IN p_tipo_trabajo VARCHAR(255),
    IN p_conexion_internet ENUM('WIFI', 'CABLE'),
    IN p_ambiente_adecuado ENUM('Si', 'No'),
    IN p_equipamiento VARCHAR(255)
)
BEGIN
    INSERT INTO trabajo_remoto (
        id_trabajador, condiciones_trabajo_remoto, tipo_computadora, 
        tipo_trabajo, conexion_internet, ambiente_adecuado, equipamiento, estado
    ) 
    VALUES (
        p_id_trabajador, p_condiciones_trabajo_remoto, p_tipo_computadora, 
        p_tipo_trabajo, p_conexion_internet, p_ambiente_adecuado, p_equipamiento, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_read_trabajo_remoto (
    IN p_id INT
)
BEGIN
    SELECT * FROM trabajo_remoto WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update_trabajo_remoto (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_condiciones_trabajo_remoto ENUM('Si', 'No'),
    IN p_tipo_computadora ENUM('Laptop', 'Desktop'),
    IN p_tipo_trabajo VARCHAR(255),
    IN p_conexion_internet ENUM('WIFI', 'CABLE'),
    IN p_ambiente_adecuado ENUM('Si', 'No'),
    IN p_equipamiento VARCHAR(255)
)
BEGIN
    UPDATE trabajo_remoto 
    SET 
        id_trabajador = p_id_trabajador,
        condiciones_trabajo_remoto = p_condiciones_trabajo_remoto,
        tipo_computadora = p_tipo_computadora,
        tipo_trabajo = p_tipo_trabajo,
        conexion_internet = p_conexion_internet,
        ambiente_adecuado = p_ambiente_adecuado,
        equipamiento = p_equipamiento
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_trabajo_remoto (
    IN p_id INT
)
BEGIN
    UPDATE trabajo_remoto 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
