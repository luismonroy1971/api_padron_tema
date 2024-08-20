DELIMITER $$

CREATE PROCEDURE sp_create_trabajador (
    IN p_tipo_documento VARCHAR(2),
    IN p_numero_documento VARCHAR(20),
    IN p_pais_emision_documento VARCHAR(4),
    IN p_fecha_nacimiento DATE,
    IN p_apellido_paterno VARCHAR(255),
    IN p_apellido_materno VARCHAR(255),
    IN p_primer_nombre VARCHAR(255),
    IN p_segundo_nombre VARCHAR(255),
    IN p_tercer_nombre VARCHAR(255),
    IN p_sexo CHAR(1),
    IN p_grupo_sanguineo VARCHAR(2),
    IN p_estado_civil VARCHAR(2),
    IN p_nacionalidad VARCHAR(3),
    IN p_numero_celular VARCHAR(15),
    IN p_numero_celular_emergencia VARCHAR(15),
    IN p_correo_electronico VARCHAR(255),
    IN p_hijos_menores_edad CHAR(1),
    IN p_numero_hijos_menores INT,
    IN p_estado_trabajador VARCHAR(50)
)
BEGIN
    INSERT INTO trabajador (
        tipo_documento, numero_documento, pais_emision_documento, fecha_nacimiento, 
        apellido_paterno, apellido_materno, primer_nombre, segundo_nombre, 
        tercer_nombre, sexo, grupo_sanguineo, estado_civil, nacionalidad, 
        numero_celular, numero_celular_emergencia, correo_electronico, 
        hijos_menores_edad, numero_hijos_menores, estado_trabajador, estado
    ) 
    VALUES (
        p_tipo_documento, p_numero_documento, p_pais_emision_documento, p_fecha_nacimiento, 
        p_apellido_paterno, p_apellido_materno, p_primer_nombre, p_segundo_nombre, 
        p_tercer_nombre, p_sexo, p_grupo_sanguineo, p_estado_civil, p_nacionalidad, 
        p_numero_celular, p_numero_celular_emergencia, p_correo_electronico, 
        p_hijos_menores_edad, p_numero_hijos_menores, p_estado_trabajador, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_read_trabajador (
    IN p_id INT
)
BEGIN
    SELECT * FROM trabajador WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update_trabajador (
    IN p_id INT,
    IN p_tipo_documento VARCHAR(2),
    IN p_numero_documento VARCHAR(20),
    IN p_pais_emision_documento VARCHAR(4),
    IN p_fecha_nacimiento DATE,
    IN p_apellido_paterno VARCHAR(255),
    IN p_apellido_materno VARCHAR(255),
    IN p_primer_nombre VARCHAR(255),
    IN p_segundo_nombre VARCHAR(255),
    IN p_tercer_nombre VARCHAR(255),
    IN p_sexo CHAR(1),
    IN p_grupo_sanguineo VARCHAR(2),
    IN p_estado_civil VARCHAR(2),
    IN p_nacionalidad VARCHAR(3),
    IN p_numero_celular VARCHAR(15),
    IN p_numero_celular_emergencia VARCHAR(15),
    IN p_correo_electronico VARCHAR(255),
    IN p_hijos_menores_edad CHAR(1),
    IN p_numero_hijos_menores INT,
    IN p_estado_trabajador VARCHAR(50)
)
BEGIN
    UPDATE trabajador 
    SET 
        tipo_documento = p_tipo_documento,
        numero_documento = p_numero_documento,
        pais_emision_documento = p_pais_emision_documento,
        fecha_nacimiento = p_fecha_nacimiento,
        apellido_paterno = p_apellido_paterno,
        apellido_materno = p_apellido_materno,
        primer_nombre = p_primer_nombre,
        segundo_nombre = p_segundo_nombre,
        tercer_nombre = p_tercer_nombre,
        sexo = p_sexo,
        grupo_sanguineo = p_grupo_sanguineo,
        estado_civil = p_estado_civil,
        nacionalidad = p_nacionalidad,
        numero_celular = p_numero_celular,
        numero_celular_emergencia = p_numero_celular_emergencia,
        correo_electronico = p_correo_electronico,
        hijos_menores_edad = p_hijos_menores_edad,
        numero_hijos_menores = p_numero_hijos_menores,
        estado_trabajador = p_estado_trabajador
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete_trabajador (
    IN p_id INT
)
BEGIN
    UPDATE trabajador 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
