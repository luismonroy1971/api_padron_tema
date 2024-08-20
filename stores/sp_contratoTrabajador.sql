DELIMITER $$

CREATE PROCEDURE sp_create_contrato (
    IN p_id_trabajador INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_motivo_fin_baja VARCHAR(2),
    IN p_tipo_trabajador VARCHAR(2),
    IN p_regimen_salud VARCHAR(2),
    IN p_eps_servicios_propios CHAR(1),
    IN p_sctr_salud ENUM('1', '2')
)
BEGIN
    INSERT INTO contrato (
        id_trabajador, fecha_inicio, fecha_fin, motivo_fin_baja, 
        tipo_trabajador, regimen_salud, eps_servicios_propios, sctr_salud, estado
    ) 
    VALUES (
        p_id_trabajador, p_fecha_inicio, p_fecha_fin, p_motivo_fin_baja, 
        p_tipo_trabajador, p_regimen_salud, p_eps_servicios_propios, p_sctr_salud, '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_contrato (
    IN p_id INT
)
BEGIN
    SELECT * FROM contrato WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_contrato (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_motivo_fin_baja VARCHAR(2),
    IN p_tipo_trabajador VARCHAR(2),
    IN p_regimen_salud VARCHAR(2),
    IN p_eps_servicios_propios CHAR(1),
    IN p_sctr_salud ENUM('1', '2')
)
BEGIN
    UPDATE contrato 
    SET 
        id_trabajador = p_id_trabajador,
        fecha_inicio = p_fecha_inicio,
        fecha_fin = p_fecha_fin,
        motivo_fin_baja = p_motivo_fin_baja,
        tipo_trabajador = p_tipo_trabajador,
        regimen_salud = p_regimen_salud,
        eps_servicios_propios = p_eps_servicios_propios,
        sctr_salud = p_sctr_salud
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_delete_contrato (
    IN p_id INT
)
BEGIN
    UPDATE contrato 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
