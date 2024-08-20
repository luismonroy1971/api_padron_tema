DELIMITER $$

CREATE PROCEDURE sp_create_hobbies (
    IN p_id_trabajador INT,
    IN p_hobbie VARCHAR(2)
)
BEGIN
    INSERT INTO hobbies (
        id_trabajador, hobbie, estado
    ) 
    VALUES (
        p_id_trabajador, p_hobbie, '1'
    );
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_read_hobbies (
    IN p_id INT
)
BEGIN
    SELECT * FROM hobbies WHERE id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update_hobbies (
    IN p_id INT,
    IN p_id_trabajador INT,
    IN p_hobbie VARCHAR(2)
)
BEGIN
    UPDATE hobbies 
    SET 
        id_trabajador = p_id_trabajador,
        hobbie = p_hobbie
    WHERE 
        id = p_id AND estado = '1';
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete_hobbies (
    IN p_id INT
)
BEGIN
    UPDATE hobbies 
    SET estado = '0' 
    WHERE id = p_id;
END $$

DELIMITER ;
