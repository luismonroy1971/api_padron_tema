DELIMITER $$

CREATE PROCEDURE sp_create_sistema_pensionario (
    IN p_id_trabajador INT,
    IN p_sistema_pensionario VARCHAR(2),
    IN p_tipo_comision_afp VARCHAR(255),
    IN p_cuspp CHAR(12)
)
BEGIN
    INSERT INTO sistema_pensionario (
        id_trabajador, sistema_pensionario, tipo_comision_afp, cuspp, estado
    ) 
    VALUES (
        p_id_trabajador, p_sistema_pensionario, p_tipo_comision_afp, p_cuspp, '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_sistema_pensionario (
    IN p_id INT
)
BEGIN
    SELECT * FROM sistema_pensionario WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_sistema_pensionario (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_sistema_pensionario VARCHAR(2),
    IN p_tipo_comision_afp VARCHAR(255),
    IN p_cuspp CHAR(12)
)
BEGIN
    UPDATE sistema_pensionario 
    SET 
        id_trabajador = p_id_trabajador,
        sistema_pensionario = p_sistema_pensionario,
        tipo_comision_afp = p_tipo_comision_afp,
        cuspp = p_cuspp
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_sistema_pensionario (
    IN p_id INT
)
BEGIN
    UPDATE sistema_pensionario 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
