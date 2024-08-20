DELIMITER $$

CREATE PROCEDURE sp_create_derecho_habientes (
    IN p_id_trabajador INT,
    IN p_tipo_documento_identificacion VARCHAR(2),
    IN p_numero_documento_identificacion VARCHAR(20),
    IN p_pais_emision_documento VARCHAR(4),
    IN p_fecha_nacimiento DATE,
    IN p_apellido_paterno VARCHAR(255),
    IN p_apellido_materno VARCHAR(255),
    IN p_nombres VARCHAR(255),
    IN p_sexo CHAR(1),
    IN p_vinculo_familiar VARCHAR(2),
    IN p_tipo_documento_acredita_vinculo VARCHAR(2),
    IN p_numero_documento_acredita_vinculo VARCHAR(20),
    IN p_mes_concepcion CHAR(7)
)
BEGIN
    INSERT INTO derecho_habientes (
        id_trabajador, tipo_documento_identificacion, numero_documento_identificacion,
        pais_emision_documento, fecha_nacimiento, apellido_paterno, apellido_materno,
        nombres, sexo, vinculo_familiar, tipo_documento_acredita_vinculo, 
        numero_documento_acredita_vinculo, mes_concepcion, estado
    ) 
    VALUES (
        p_id_trabajador, p_tipo_documento_identificacion, p_numero_documento_identificacion,
        p_pais_emision_documento, p_fecha_nacimiento, p_apellido_paterno, p_apellido_materno,
        p_nombres, p_sexo, p_vinculo_familiar, p_tipo_documento_acredita_vinculo, 
        p_numero_documento_acredita_vinculo, p_mes_concepcion, '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_derecho_habientes (
    IN p_id INT
)
BEGIN
    SELECT * FROM derecho_habientes WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update_derecho_habientes (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_tipo_documento_identificacion VARCHAR(2),
    IN p_numero_documento_identificacion VARCHAR(20),
    IN p_pais_emision_documento VARCHAR(4),
    IN p_fecha_nacimiento DATE,
    IN p_apellido_paterno VARCHAR(255),
    IN p_apellido_materno VARCHAR(255),
    IN p_nombres VARCHAR(255),
    IN p_sexo CHAR(1),
    IN p_vinculo_familiar VARCHAR(2),
    IN p_tipo_documento_acredita_vinculo VARCHAR(2),
    IN p_numero_documento_acredita_vinculo VARCHAR(20),
    IN p_mes_concepcion CHAR(7)
)
BEGIN
    UPDATE derecho_habientes 
    SET 
        id_trabajador = p_id_trabajador,
        tipo_documento_identificacion = p_tipo_documento_identificacion,
        numero_documento_identificacion = p_numero_documento_identificacion,
        pais_emision_documento = p_pais_emision_documento,
        fecha_nacimiento = p_fecha_nacimiento,
        apellido_paterno = p_apellido_paterno,
        apellido_materno = p_apellido_materno,
        nombres = p_nombres,
        sexo = p_sexo,
        vinculo_familiar = p_vinculo_familiar,
        tipo_documento_acredita_vinculo = p_tipo_documento_acredita_vinculo,
        numero_documento_acredita_vinculo = p_numero_documento_acredita_vinculo,
        mes_concepcion = p_mes_concepcion
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_derecho_habientes (
    IN p_id INT
)
BEGIN
    UPDATE derecho_habientes 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;

