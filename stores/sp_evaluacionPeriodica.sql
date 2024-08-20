DELIMITER $$

CREATE PROCEDURE sp_create_evaluacion_periodica (
    IN p_id_trabajador INT,
    IN p_periodo YEAR,
    IN p_fecha DATE,
    IN p_conocimiento_puesto TINYINT,
    IN p_calidad_en_desarrollos TINYINT,
    IN p_manejo_programas_informaticos TINYINT,
    IN p_capacidad_aprendizaje TINYINT,
    IN p_cumplimiento_procesos_sig TINYINT,
    IN p_trabajo_en_equipo TINYINT,
    IN p_comunicacion_asertiva TINYINT,
    IN p_flexibilidad_adaptacion_cambio TINYINT,
    IN p_capacidad_resolucion_creatividad_proactividad TINYINT,
    IN p_organizacion_gestion_tiempo TINYINT,
    IN p_orientacion_cliente TINYINT,
    IN p_compromiso TINYINT,
    IN p_manejo_situaciones_criticas TINYINT,
    IN p_liderazgo TINYINT,
    IN p_gestion_personas TINYINT,
    IN p_empowerment TINYINT,
    IN p_orientacion_resultado TINYINT,
    IN p_coordinador INT
)
BEGIN
    INSERT INTO evaluacion_periodica (
        id_trabajador, periodo, fecha, conocimiento_puesto, calidad_en_desarrollos, 
        manejo_programas_informaticos, capacidad_aprendizaje, cumplimiento_procesos_sig, 
        trabajo_en_equipo, comunicacion_asertiva, flexibilidad_adaptacion_cambio, 
        capacidad_resolucion_creatividad_proactividad, organizacion_gestion_tiempo, 
        orientacion_cliente, compromiso, manejo_situaciones_criticas, liderazgo, 
        gestion_personas, empowerment, orientacion_resultado, coordinador, estado
    ) 
    VALUES (
        p_id_trabajador, p_periodo, p_fecha, p_conocimiento_puesto, p_calidad_en_desarrollos, 
        p_manejo_programas_informaticos, p_capacidad_aprendizaje, p_cumplimiento_procesos_sig, 
        p_trabajo_en_equipo, p_comunicacion_asertiva, p_flexibilidad_adaptacion_cambio, 
        p_capacidad_resolucion_creatividad_proactividad, p_organizacion_gestion_tiempo, 
        p_orientacion_cliente, p_compromiso, p_manejo_situaciones_criticas, p_liderazgo, 
        p_gestion_personas, p_empowerment, p_orientacion_resultado, p_coordinador, '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_evaluacion_periodica (
    IN p_id INT
)
BEGIN
    SELECT * FROM evaluacion_periodica WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_evaluacion_periodica (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_periodo YEAR,
    IN p_fecha DATE,
    IN p_conocimiento_puesto TINYINT,
    IN p_calidad_en_desarrollos TINYINT,
    IN p_manejo_programas_informaticos TINYINT,
    IN p_capacidad_aprendizaje TINYINT,
    IN p_cumplimiento_procesos_sig TINYINT,
    IN p_trabajo_en_equipo TINYINT,
    IN p_comunicacion_asertiva TINYINT,
    IN p_flexibilidad_adaptacion_cambio TINYINT,
    IN p_capacidad_resolucion_creatividad_proactividad TINYINT,
    IN p_organizacion_gestion_tiempo TINYINT,
    IN p_orientacion_cliente TINYINT,
    IN p_compromiso TINYINT,
    IN p_manejo_situaciones_criticas TINYINT,
    IN p_liderazgo TINYINT,
    IN p_gestion_personas TINYINT,
    IN p_empowerment TINYINT,
    IN p_orientacion_resultado TINYINT,
    IN p_coordinador INT
)
BEGIN
    UPDATE evaluacion_periodica 
    SET 
        id_trabajador = p_id_trabajador,
        periodo = p_periodo,
        fecha = p_fecha,
        conocimiento_puesto = p_conocimiento_puesto,
        calidad_en_desarrollos = p_calidad_en_desarrollos,
        manejo_programas_informaticos = p_manejo_programas_informaticos,
        capacidad_aprendizaje = p_capacidad_aprendizaje,
        cumplimiento_procesos_sig = p_cumplimiento_procesos_sig,
        trabajo_en_equipo = p_trabajo_en_equipo,
        comunicacion_asertiva = p_comunicacion_asertiva,
        flexibilidad_adaptacion_cambio = p_flexibilidad_adaptacion_cambio,
        capacidad_resolucion_creatividad_proactividad = p_capacidad_resolucion_creatividad_proactividad,
        organizacion_gestion_tiempo = p_organizacion_gestion_tiempo,
        orientacion_cliente = p_orientacion_cliente,
        compromiso = p_compromiso,
        manejo_situaciones_criticas = p_manejo_situaciones_criticas,
        liderazgo = p_liderazgo,
        gestion_personas = p_gestion_personas,
        empowerment = p_empowerment,
        orientacion_resultado = p_orientacion_resultado,
        coordinador = p_coordinador
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_evaluacion_periodica (
    IN p_id INT
)
BEGIN
    UPDATE evaluacion_periodica 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;


