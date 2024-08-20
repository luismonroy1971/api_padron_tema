DELIMITER $$

CREATE PROCEDURE sp_create_datos_laborales_previos (
    IN p_id_trabajador INT,
    IN p_fecha_inicio_ultima_experiencia DATE,
    IN p_fecha_fin_ultima_experiencia DATE,
    IN p_organizacion_ultima_experiencia VARCHAR(255),
    IN p_motivo_baja_ultima_experiencia VARCHAR(255),
    IN p_remuneracion_ultima_experiencia DECIMAL(10, 2),
    IN p_fecha_inicio_penultima_experiencia DATE,
    IN p_fecha_fin_penultima_experiencia DATE,
    IN p_organizacion_penultima_experiencia VARCHAR(255),
    IN p_motivo_baja_penultima_experiencia VARCHAR(255),
    IN p_remuneracion_penultima_experiencia DECIMAL(10, 2)
)
BEGIN
    INSERT INTO datos_laborales_previos (
        id_trabajador, fecha_inicio_ultima_experiencia, fecha_fin_ultima_experiencia, 
        organizacion_ultima_experiencia, motivo_baja_ultima_experiencia, 
        remuneracion_ultima_experiencia, fecha_inicio_penultima_experiencia, 
        fecha_fin_penultima_experiencia, organizacion_penultima_experiencia, 
        motivo_baja_penultima_experiencia, remuneracion_penultima_experiencia, estado
    ) 
    VALUES (
        p_id_trabajador, p_fecha_inicio_ultima_experiencia, p_fecha_fin_ultima_experiencia, 
        p_organizacion_ultima_experiencia, p_motivo_baja_ultima_experiencia, 
        p_remuneracion_ultima_experiencia, p_fecha_inicio_penultima_experiencia, 
        p_fecha_fin_penultima_experiencia, p_organizacion_penultima_experiencia, 
        p_motivo_baja_penultima_experiencia, p_remuneracion_penultima_experiencia, '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_datos_laborales_previos (
    IN p_id INT
)
BEGIN
    SELECT * FROM datos_laborales_previos WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_datos_laborales_previos (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_fecha_inicio_ultima_experiencia DATE,
    IN p_fecha_fin_ultima_experiencia DATE,
    IN p_organizacion_ultima_experiencia VARCHAR(255),
    IN p_motivo_baja_ultima_experiencia VARCHAR(255),
    IN p_remuneracion_ultima_experiencia DECIMAL(10, 2),
    IN p_fecha_inicio_penultima_experiencia DATE,
    IN p_fecha_fin_penultima_experiencia DATE,
    IN p_organizacion_penultima_experiencia VARCHAR(255),
    IN p_motivo_baja_penultima_experiencia VARCHAR(255),
    IN p_remuneracion_penultima_experiencia DECIMAL(10, 2)
)
BEGIN
    UPDATE datos_laborales_previos 
    SET 
        id_trabajador = p_id_trabajador,
        fecha_inicio_ultima_experiencia = p_fecha_inicio_ultima_experiencia,
        fecha_fin_ultima_experiencia = p_fecha_fin_ultima_experiencia,
        organizacion_ultima_experiencia = p_organizacion_ultima_experiencia,
        motivo_baja_ultima_experiencia = p_motivo_baja_ultima_experiencia,
        remuneracion_ultima_experiencia = p_remuneracion_ultima_experiencia,
        fecha_inicio_penultima_experiencia = p_fecha_inicio_penultima_experiencia,
        fecha_fin_penultima_experiencia = p_fecha_fin_penultima_experiencia,
        organizacion_penultima_experiencia = p_organizacion_penultima_experiencia,
        motivo_baja_penultima_experiencia = p_motivo_baja_penultima_experiencia,
        remuneracion_penultima_experiencia = p_remuneracion_penultima_experiencia
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_datos_laborales_previos (
    IN p_id INT
)
BEGIN
    UPDATE datos_laborales_previos 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
