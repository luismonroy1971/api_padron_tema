DELIMITER $$

CREATE PROCEDURE sp_create_complementarios (
    IN p_id_trabajador INT,
    IN p_regimen_laboral VARCHAR(2),
    IN p_ocupacion VARCHAR(6),
    IN p_discapacidad CHAR(1),
    IN p_sctr_pension ENUM('1', '2'),
    IN p_tipo_contrato VARCHAR(2),
    IN p_sujeto_regimen_atipico CHAR(1),
    IN p_jornada_maxima CHAR(1),
    IN p_horario_nocturno CHAR(1),
    IN p_sindicato CHAR(1),
    IN p_periodo_remuneracion VARCHAR(2),
    IN p_sueldo DECIMAL(10, 2),
    IN p_situacion VARCHAR(2),
    IN p_exonerado_renta_5ta CHAR(1),
    IN p_situacion_especial CHAR(1),
    IN p_tipo_pago VARCHAR(2),
    IN p_categoria_ocupacional VARCHAR(2),
    IN p_convenio_doble_tributacion CHAR(1),
    IN p_sub_centro_costo VARCHAR(255),
    IN p_centro_costo VARCHAR(255),
    IN p_sub_sub_centro_costo VARCHAR(255),
    IN p_area VARCHAR(255),
    IN p_cargo_boleta VARCHAR(255)
)
BEGIN
    INSERT INTO complementarios (
        id_trabajador, regimen_laboral, ocupacion, discapacidad, sctr_pension, 
        tipo_contrato, sujeto_regimen_atipico, jornada_maxima, horario_nocturno, sindicato, 
        periodo_remuneracion, sueldo, situacion, exonerado_renta_5ta, situacion_especial, 
        tipo_pago, categoria_ocupacional, convenio_doble_tributacion, sub_centro_costo, 
        centro_costo, sub_sub_centro_costo, area, cargo_boleta, estado
    ) 
    VALUES (
        p_id_trabajador, p_regimen_laboral, p_ocupacion, p_discapacidad, p_sctr_pension, 
        p_tipo_contrato, p_sujeto_regimen_atipico, p_jornada_maxima, p_horario_nocturno, p_sindicato, 
        p_periodo_remuneracion, p_sueldo, p_situacion, p_exonerado_renta_5ta, p_situacion_especial, 
        p_tipo_pago, p_categoria_ocupacional, p_convenio_doble_tributacion, p_sub_centro_costo, 
        p_centro_costo, p_sub_sub_centro_costo, p_area, p_cargo_boleta, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_read_complementarios (
    IN p_id INT
)
BEGIN
    SELECT * FROM complementarios WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_complementarios (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_regimen_laboral VARCHAR(2),
    IN p_ocupacion VARCHAR(6),
    IN p_discapacidad CHAR(1),
    IN p_sctr_pension ENUM('1', '2'),
    IN p_tipo_contrato VARCHAR(2),
    IN p_sujeto_regimen_atipico CHAR(1),
    IN p_jornada_maxima CHAR(1),
    IN p_horario_nocturno CHAR(1),
    IN p_sindicato CHAR(1),
    IN p_periodo_remuneracion VARCHAR(2),
    IN p_sueldo DECIMAL(10, 2),
    IN p_situacion VARCHAR(2),
    IN p_exonerado_renta_5ta CHAR(1),
    IN p_situacion_especial CHAR(1),
    IN p_tipo_pago VARCHAR(2),
    IN p_categoria_ocupacional VARCHAR(2),
    IN p_convenio_doble_tributacion CHAR(1),
    IN p_sub_centro_costo VARCHAR(255),
    IN p_centro_costo VARCHAR(255),
    IN p_sub_sub_centro_costo VARCHAR(255),
    IN p_area VARCHAR(255),
    IN p_cargo_boleta VARCHAR(255)
)
BEGIN
    UPDATE complementarios 
    SET 
        id_trabajador = p_id_trabajador,
        regimen_laboral = p_regimen_laboral,
        ocupacion = p_ocupacion,
        discapacidad = p_discapacidad,
        sctr_pension = p_sctr_pension,
        tipo_contrato = p_tipo_contrato,
        sujeto_regimen_atipico = p_sujeto_regimen_atipico,
        jornada_maxima = p_jornada_maxima,
        horario_nocturno = p_horario_nocturno,
        sindicato = p_sindicato,
        periodo_remuneracion = p_periodo_remuneracion,
        sueldo = p_sueldo,
        situacion = p_situacion,
        exonerado_renta_5ta = p_exonerado_renta_5ta,
        situacion_especial = p_situacion_especial,
        tipo_pago = p_tipo_pago,
        categoria_ocupacional = p_categoria_ocupacional,
        convenio_doble_tributacion = p_convenio_doble_tributacion,
        sub_centro_costo = p_sub_centro_costo,
        centro_costo = p_centro_costo,
        sub_sub_centro_costo = p_sub_sub_centro_costo,
        area = p_area,
        cargo_boleta = p_cargo_boleta
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_complementarios (
    IN p_id INT
)
BEGIN
    UPDATE complementarios 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
