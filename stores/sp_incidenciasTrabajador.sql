DELIMITER $$

CREATE PROCEDURE sp_create_incidencias (
    IN p_id_trabajador INT,
    IN p_codigo VARCHAR(255),
    IN p_dias INT,
    IN p_horas VARCHAR(2),
    IN p_importe VARCHAR(2),
    IN p_mes VARCHAR(2),
    IN p_anio CHAR(1)
)
BEGIN
    INSERT INTO incidencias (
        id_trabajador, codigo, dias, horas, importe, mes, anio, estado
    ) 
    VALUES (
        p_id_trabajador, p_codigo, p_dias, p_horas, p_importe, p_mes, p_anio, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_read_incidencias (
    IN p_id INT
)
BEGIN
    SELECT * FROM incidencias WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_incidencias (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_codigo VARCHAR(255),
    IN p_dias INT,
    IN p_horas VARCHAR(2),
    IN p_importe VARCHAR(2),
    IN p_mes VARCHAR(2),
    IN p_anio CHAR(1)
)
BEGIN
    UPDATE incidencias 
    SET 
        id_trabajador = p_id_trabajador,
        codigo = p_codigo,
        dias = p_dias,
        horas = p_horas,
        importe = p_importe,
        mes = p_mes,
        anio = p_anio
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete_incidencias (
    IN p_id INT
)
BEGIN
    UPDATE incidencias 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
