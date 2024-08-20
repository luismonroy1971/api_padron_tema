DELIMITER $$

CREATE PROCEDURE sp_create_direccion (
    IN p_id_trabajador INT,
    IN p_tipo_via_direccion1 VARCHAR(2),
    IN p_nombre_via_direccion1 VARCHAR(255),
    IN p_numero_via_direccion1 VARCHAR(10),
    IN p_departamento_no_direccion1 VARCHAR(10),
    IN p_interior_direccion1 VARCHAR(10),
    IN p_manzana_direccion1 VARCHAR(10),
    IN p_lote_direccion1 VARCHAR(10),
    IN p_km_direccion1 VARCHAR(10),
    IN p_block_direccion1 VARCHAR(10),
    IN p_etapa_direccion1 VARCHAR(10),
    IN p_tipo_zona_direccion1 VARCHAR(2),
    IN p_nombre_zona_direccion1 VARCHAR(255),
    IN p_referencia_direccion1 VARCHAR(255),
    IN p_departamento_direccion1 VARCHAR(2),
    IN p_provincia_direccion1 VARCHAR(2),
    IN p_distrito_direccion1 VARCHAR(2),
    IN p_tipo_via_direccion2 VARCHAR(2),
    IN p_nombre_via_direccion2 VARCHAR(255),
    IN p_numero_via_direccion2 VARCHAR(10),
    IN p_departamento_no_direccion2 VARCHAR(10),
    IN p_interior_direccion2 VARCHAR(10),
    IN p_manzana_direccion2 VARCHAR(10),
    IN p_lote_direccion2 VARCHAR(10),
    IN p_km_direccion2 VARCHAR(10),
    IN p_block_direccion2 VARCHAR(10),
    IN p_etapa_direccion2 VARCHAR(10),
    IN p_tipo_zona_direccion2 VARCHAR(2),
    IN p_nombre_zona_direccion2 VARCHAR(255),
    IN p_referencia_direccion2 VARCHAR(255),
    IN p_departamento_direccion2 VARCHAR(2),
    IN p_provincia_direccion2 VARCHAR(2),
    IN p_distrito_direccion2 VARCHAR(2)
)
BEGIN
    INSERT INTO direccion (
        id_trabajador, tipo_via_direccion1, nombre_via_direccion1, numero_via_direccion1,
        departamento_no_direccion1, interior_direccion1, manzana_direccion1, lote_direccion1,
        km_direccion1, block_direccion1, etapa_direccion1, tipo_zona_direccion1, nombre_zona_direccion1,
        referencia_direccion1, departamento_direccion1, provincia_direccion1, distrito_direccion1,
        tipo_via_direccion2, nombre_via_direccion2, numero_via_direccion2,
        departamento_no_direccion2, interior_direccion2, manzana_direccion2, lote_direccion2,
        km_direccion2, block_direccion2, etapa_direccion2, tipo_zona_direccion2, nombre_zona_direccion2,
        referencia_direccion2, departamento_direccion2, provincia_direccion2, distrito_direccion2,
        estado
    ) 
    VALUES (
        p_id_trabajador, p_tipo_via_direccion1, p_nombre_via_direccion1, p_numero_via_direccion1,
        p_departamento_no_direccion1, p_interior_direccion1, p_manzana_direccion1, p_lote_direccion1,
        p_km_direccion1, p_block_direccion1, p_etapa_direccion1, p_tipo_zona_direccion1, p_nombre_zona_direccion1,
        p_referencia_direccion1, p_departamento_direccion1, p_provincia_direccion1, p_distrito_direccion1,
        p_tipo_via_direccion2, p_nombre_via_direccion2, p_numero_via_direccion2,
        p_departamento_no_direccion2, p_interior_direccion2, p_manzana_direccion2, p_lote_direccion2,
        p_km_direccion2, p_block_direccion2, p_etapa_direccion2, p_tipo_zona_direccion2, p_nombre_zona_direccion2,
        p_referencia_direccion2, p_departamento_direccion2, p_provincia_direccion2, p_distrito_direccion2,
        '1'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_read_direccion (
    IN p_id INT
)
BEGIN
    SELECT * FROM direccion WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_direccion (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_tipo_via_direccion1 VARCHAR(2),
    IN p_nombre_via_direccion1 VARCHAR(255),
    IN p_numero_via_direccion1 VARCHAR(10),
    IN p_departamento_no_direccion1 VARCHAR(10),
    IN p_interior_direccion1 VARCHAR(10),
    IN p_manzana_direccion1 VARCHAR(10),
    IN p_lote_direccion1 VARCHAR(10),
    IN p_km_direccion1 VARCHAR(10),
    IN p_block_direccion1 VARCHAR(10),
    IN p_etapa_direccion1 VARCHAR(10),
    IN p_tipo_zona_direccion1 VARCHAR(2),
    IN p_nombre_zona_direccion1 VARCHAR(255),
    IN p_referencia_direccion1 VARCHAR(255),
    IN p_departamento_direccion1 VARCHAR(2),
    IN p_provincia_direccion1 VARCHAR(2),
    IN p_distrito_direccion1 VARCHAR(2),
    IN p_tipo_via_direccion2 VARCHAR(2),
    IN p_nombre_via_direccion2 VARCHAR(255),
    IN p_numero_via_direccion2 VARCHAR(10),
    IN p_departamento_no_direccion2 VARCHAR(10),
    IN p_interior_direccion2 VARCHAR(10),
    IN p_manzana_direccion2 VARCHAR(10),
    IN p_lote_direccion2 VARCHAR(10),
    IN p_km_direccion2 VARCHAR(10),
    IN p_block_direccion2 VARCHAR(10),
    IN p_etapa_direccion2 VARCHAR(10),
    IN p_tipo_zona_direccion2 VARCHAR(2),
    IN p_nombre_zona_direccion2 VARCHAR(255),
    IN p_referencia_direccion2 VARCHAR(255),
    IN p_departamento_direccion2 VARCHAR(2),
    IN p_provincia_direccion2 VARCHAR(2),
    IN p_distrito_direccion2 VARCHAR(2)
)
BEGIN
    UPDATE direccion 
    SET 
        id_trabajador = p_id_trabajador,
        tipo_via_direccion1 = p_tipo_via_direccion1,
        nombre_via_direccion1 = p_nombre_via_direccion1,
        numero_via_direccion1 = p_numero_via_direccion1,
        departamento_no_direccion1 = p_departamento_no_direccion1,
        interior_direccion1 = p_interior_direccion1,
        manzana_direccion1 = p_manzana_direccion1,
        lote_direccion1 = p_lote_direccion1,
        km_direccion1 = p_km_direccion1,
        block_direccion1 = p_block_direccion1,
        etapa_direccion1 = p_etapa_direccion1,
        tipo_zona_direccion1 = p_tipo_zona_direccion1,
        nombre_zona_direccion1 = p_nombre_zona_direccion1,
        referencia_direccion1 = p_referencia_direccion1,
        departamento_direccion1 = p_departamento_direccion1,
        provincia_direccion1 = p_provincia_direccion1,
        distrito_direccion1 = p_distrito_direccion1,
        tipo_via_direccion2 = p_tipo_via_direccion2,
        nombre_via_direccion2 = p_nombre_via_direccion2,
        numero_via_direccion2 = p_numero_via_direccion2,
        departamento_no_direccion2 = p_departamento_no_direccion2,
        interior_direccion2 = p_interior_direccion2,
        manzana_direccion2 = p_manzana_direccion2,
        lote_direccion2 = p_lote_direccion2,
        km_direccion2 = p_km_direccion2,
        block_direccion2 = p_block_direccion2,
        etapa_direccion2 = p_etapa_direccion2,
        tipo_zona_direccion2 = p_tipo_zona_direccion2,
        nombre_zona_direccion2 = p_nombre_zona_direccion2,
        referencia_direccion2 = p_referencia_direccion2,
        departamento_direccion2 = p_departamento_direccion2,
        provincia_direccion2 = p_provincia_direccion2,
        distrito_direccion2 = p_distrito_direccion2
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete_direccion (
    IN p_id INT
)
BEGIN
    UPDATE direccion 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
