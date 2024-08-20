DELIMITER $$

CREATE PROCEDURE sp_create_evaluacion (
    IN p_id_usuario INT,
    IN p_fecha_evaluacion DATE,
    IN p_detalles_calificacion TEXT,
    IN p_puntuacion_global TINYINT
)
BEGIN
    DECLARE p_clasificacion ENUM('buena', 'mala');

    IF p_puntuacion_global >= 7 THEN
        SET p_clasificacion = 'buena';
    ELSE
        SET p_clasificacion = 'mala';
    END IF;

    INSERT INTO evaluacion (
        id_usuario, fecha_evaluacion, detalles_calificacion, 
        puntuacion_global, clasificacion, estado
    ) 
    VALUES (
        p_id_usuario, p_fecha_evaluacion, p_detalles_calificacion, 
        p_puntuacion_global, p_clasificacion, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update_evaluacion (
    IN p_id INT,
    IN p_id_usuario INT,
    IN p_fecha_evaluacion DATE,
    IN p_detalles_calificacion TEXT,
    IN p_puntuacion_global TINYINT
)
BEGIN
    DECLARE p_clasificacion ENUM('buena', 'mala');

    IF p_puntuacion_global >= 7 THEN
        SET p_clasificacion = 'buena';
    ELSE
        SET p_clasificacion = 'mala';
    END IF;

    UPDATE evaluacion 
    SET 
        id_usuario = p_id_usuario,
        fecha_evaluacion = p_fecha_evaluacion,
        detalles_calificacion = p_detalles_calificacion,
        puntuacion_global = p_puntuacion_global,
        clasificacion = p_clasificacion
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_evaluacion (
    IN p_id INT
)
BEGIN
    SELECT * FROM evaluacion WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete_evaluacion (
    IN p_id INT
)
BEGIN
    UPDATE evaluacion 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
