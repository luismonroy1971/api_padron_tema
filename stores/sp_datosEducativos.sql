DELIMITER $$

CREATE PROCEDURE sp_create_datos_educativos (
    IN p_id_trabajador INT,
    IN p_anio_egreso_educacion_superior YEAR,
    IN p_nivel_alcanzado_educativo VARCHAR(2),
    IN p_centro_estudios_educacion_superior VARCHAR(9),
    IN p_nombre_profesion VARCHAR(2),
    IN p_nombre_post_grado_1 VARCHAR(255),
    IN p_institucion_educativa_post_grado_1 VARCHAR(255),
    IN p_fecha_inicio_estudio_post_grado_1 DATE,
    IN p_fecha_final_estudio_post_grado_1 DATE,
    IN p_nombre_post_grado_2 VARCHAR(255),
    IN p_institucion_educativa_post_grado_2 VARCHAR(255),
    IN p_fecha_inicio_estudio_post_grado_2 DATE,
    IN p_fecha_final_estudio_post_grado_2 DATE
)
BEGIN
    INSERT INTO datos_educativos (
        id_trabajador, anio_egreso_educacion_superior, nivel_alcanzado_educativo, 
        centro_estudios_educacion_superior, nombre_profesion, nombre_post_grado_1, 
        institucion_educativa_post_grado_1, fecha_inicio_estudio_post_grado_1, 
        fecha_final_estudio_post_grado_1, nombre_post_grado_2, 
        institucion_educativa_post_grado_2, fecha_inicio_estudio_post_grado_2, 
        fecha_final_estudio_post_grado_2, estado
    ) 
    VALUES (
        p_id_trabajador, p_anio_egreso_educacion_superior, p_nivel_alcanzado_educativo, 
        p_centro_estudios_educacion_superior, p_nombre_profesion, p_nombre_post_grado_1, 
        p_institucion_educativa_post_grado_1, p_fecha_inicio_estudio_post_grado_1, 
        p_fecha_final_estudio_post_grado_1, p_nombre_post_grado_2, 
        p_institucion_educativa_post_grado_2, p_fecha_inicio_estudio_post_grado_2, 
        p_fecha_final_estudio_post_grado_2, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_read_datos_educativos (
    IN p_id INT
)
BEGIN
    SELECT * FROM datos_educativos WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update_datos_educativos (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_anio_egreso_educacion_superior YEAR,
    IN p_nivel_alcanzado_educativo VARCHAR(2),
    IN p_centro_estudios_educacion_superior VARCHAR(9),
    IN p_nombre_profesion VARCHAR(2),
    IN p_nombre_post_grado_1 VARCHAR(255),
    IN p_institucion_educativa_post_grado_1 VARCHAR(255),
    IN p_fecha_inicio_estudio_post_grado_1 DATE,
    IN p_fecha_final_estudio_post_grado_1 DATE,
    IN p_nombre_post_grado_2 VARCHAR(255),
    IN p_institucion_educativa_post_grado_2 VARCHAR(255),
    IN p_fecha_inicio_estudio_post_grado_2 DATE,
    IN p_fecha_final_estudio_post_grado_2 DATE
)
BEGIN
    UPDATE datos_educativos 
    SET 
        id_trabajador = p_id_trabajador,
        anio_egreso_educacion_superior = p_anio_egreso_educacion_superior,
        nivel_alcanzado_educativo = p_nivel_alcanzado_educativo,
        centro_estudios_educacion_superior = p_centro_estudios_educacion_superior,
        nombre_profesion = p_nombre_profesion,
        nombre_post_grado_1 = p_nombre_post_grado_1,
        institucion_educativa_post_grado_1 = p_institucion_educativa_post_grado_1,
        fecha_inicio_estudio_post_grado_1 = p_fecha_inicio_estudio_post_grado_1,
        fecha_final_estudio_post_grado_1 = p_fecha_final_estudio_post_grado_1,
        nombre_post_grado_2 = p_nombre_post_grado_2,
        institucion_educativa_post_grado_2 = p_institucion_educativa_post_grado_2,
        fecha_inicio_estudio_post_grado_2 = p_fecha_inicio_estudio_post_grado_2,
        fecha_final_estudio_post_grado_2 = p_fecha_final_estudio_post_grado_2
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete_datos_educativos (
    IN p_id INT
)
BEGIN
    UPDATE datos_educativos 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
