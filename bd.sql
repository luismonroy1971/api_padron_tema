-- Tabla principal: TRABAJADOR

-- La información se registra en el Formulario 1.0
CREATE TABLE trabajador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento VARCHAR(2),
    numero_documento VARCHAR(20),
    pais_emision_documento VARCHAR(4),
    fecha_nacimiento DATE,
    apellido_paterno VARCHAR(255),
    apellido_materno VARCHAR(255),
    primer_nombre VARCHAR(255),
    segundo_nombre VARCHAR(255),
    tercer_nombre VARCHAR(255),
    sexo CHAR(1),
    grupo_sanguineo VARCHAR(2),
    estado_civil VARCHAR(2),
    nacionalidad VARCHAR(3),
    numero_celular VARCHAR(15),
    numero_celular_emergencia VARCHAR(15),
    correo_electronico VARCHAR(255),
    hijos_menores_edad CHAR(1),
    numero_hijos_menores INT,
    estado_trabajador VARCHAR(50),
    estado CHAR(1) DEFAULT '1'
);

-- La información se registra en el Formulario 1.0
CREATE TABLE direccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    tipo_via_direccion1 VARCHAR(2),  -- Relacionado con tabla4
    nombre_via_direccion1 VARCHAR(255),
    numero_via_direccion1 VARCHAR(10),
    departamento_no_direccion1 VARCHAR(10),
    interior_direccion1 VARCHAR(10),
    manzana_direccion1 VARCHAR(10),
    lote_direccion1 VARCHAR(10),
    km_direccion1 VARCHAR(10),
    block_direccion1 VARCHAR(10),
    etapa_direccion1 VARCHAR(10),
    tipo_zona_direccion1 VARCHAR(2),  -- Relacionado con tabla5
    nombre_zona_direccion1 VARCHAR(255),
    referencia_direccion1 VARCHAR(255),
    departamento_direccion1 VARCHAR(2),  -- Relacionado con tabla6
    provincia_direccion1 VARCHAR(2),  -- Relacionado con tabla6
    distrito_direccion1 VARCHAR(2),  -- Relacionado con tabla6
    tipo_via_direccion2 VARCHAR(2),  -- Relacionado con tabla4
    nombre_via_direccion2 VARCHAR(255),
    numero_via_direccion2 VARCHAR(10),
    departamento_no_direccion2 VARCHAR(10),
    interior_direccion2 VARCHAR(10),
    manzana_direccion2 VARCHAR(10),
    lote_direccion2 VARCHAR(10),
    km_direccion2 VARCHAR(10),
    block_direccion2 VARCHAR(10),
    etapa_direccion2 VARCHAR(10),
    tipo_zona_direccion2 VARCHAR(2),  -- Relacionado con tabla5
    nombre_zona_direccion2 VARCHAR(255),
    referencia_direccion2 VARCHAR(255),
    departamento_direccion2 VARCHAR(2),  -- Relacionado con tabla6
    provincia_direccion2 VARCHAR(2),  -- Relacionado con tabla6
    distrito_direccion2 VARCHAR(2),  -- Relacionado con tabla6
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

-- La información se registra en el Formulario 1.0
CREATE TABLE datos_educativos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    anio_egreso_educacion_superior YEAR,  -- Año en formato de 4 dígitos
    nivel_alcanzado_educativo VARCHAR(2),  -- Relacionado con tabla10
    centro_estudios_educacion_superior VARCHAR(9),  -- Relacionado con tabla19
    nombre_profesion VARCHAR(2),  -- Relacionado con tabla19 (columna H, filtrado por centro de estudios)
    nombre_post_grado_1 VARCHAR(255),
    institucion_educativa_post_grado_1 VARCHAR(255),
    fecha_inicio_estudio_post_grado_1 DATE,
    fecha_final_estudio_post_grado_1 DATE,
    nombre_post_grado_2 VARCHAR(255),
    institucion_educativa_post_grado_2 VARCHAR(255),
    fecha_inicio_estudio_post_grado_2 DATE,
    fecha_final_estudio_post_grado_2 DATE,
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE datos_bancarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    banco VARCHAR(2),  -- Código de Banco, relacionado con tabla20
    numero_cuenta_abono VARCHAR(20),  -- Solo números, incluyendo 0 a la izquierda
    codigo_interbancario CHAR(20),  -- 20 dígitos siempre
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

-- La información se registra en el Formulario 1.0
CREATE TABLE sistema_pensionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    sistema_pensionario VARCHAR(2),  -- Relacionado con tabla12
    tipo_comision_afp CHAR(1), --'1 Flujo - 2 Mixta'
    cuspp CHAR(12),  -- Código único de identificación del Sistema Privado de Pensiones
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

-- La información se registra en el Formulario 1.0
CREATE TABLE datos_laborales_previos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    fecha_inicio_ultima_experiencia DATE,
    fecha_fin_ultima_experiencia DATE,
    organizacion_ultima_experiencia VARCHAR(255),
    motivo_baja_ultima_experiencia VARCHAR(255),
    remuneracion_ultima_experiencia DECIMAL(10, 2),
    fecha_inicio_penultima_experiencia DATE,
    fecha_fin_penultima_experiencia DATE,
    organizacion_penultima_experiencia VARCHAR(255),
    motivo_baja_penultima_experiencia VARCHAR(255),
    remuneracion_penultima_experiencia DECIMAL(10, 2),
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE derecho_habientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    tipo_documento_identificacion VARCHAR(2),  -- Relacionado con tabla 2
    numero_documento_identificacion VARCHAR(20),
    pais_emision_documento VARCHAR(4),  -- Relacionado con tabla 2
    fecha_nacimiento DATE,
    apellido_paterno VARCHAR(255),
    apellido_materno VARCHAR(255),
    nombres VARCHAR(255),
    sexo CHAR(1),
    vinculo_familiar VARCHAR(2),  -- Relacionado con tabla 27
    tipo_documento_acredita_vinculo VARCHAR(2),  -- Relacionado con tabla 28
    numero_documento_acredita_vinculo VARCHAR(20),
    mes_concepcion CHAR(7),  -- Formato MM/AAAA
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE hobbies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    hobbie VARCHAR(2),  -- Relacionado con tabla 26
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE trabajo_remoto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    condiciones_trabajo_remoto ENUM('Si', 'No'),
    tipo_computadora ENUM('Laptop', 'Desktop'),
    tipo_trabajo VARCHAR(255),
    conexion_internet ENUM('WIFI', 'CABLE'),
    ambiente_adecuado ENUM('Si', 'No'),
    equipamiento VARCHAR(255),  -- Mesa / Escritorio para el trabajo / Silla ergonómica
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);


CREATE TABLE complementarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    regimen_laboral VARCHAR(2),  -- Relacionado con tabla 9
    ocupacion VARCHAR(6),  -- Relacionado con tabla 11
    discapacidad CHAR(1),  -- (0,1)
    sctr_pension ENUM('1', '2'),  -- 1: ONP / 2: Privada
    tipo_contrato VARCHAR(2),  -- Relacionado con tabla 13
    sujeto_regimen_atipico CHAR(1),  -- (0,1)
    jornada_maxima CHAR(1),  -- (0,1)
    horario_nocturno CHAR(1),  -- (0,1)
    sindicato CHAR(1),  -- (0,1)
    periodo_remuneracion VARCHAR(2),  -- Relacionado con tabla 14
    sueldo DECIMAL(10, 2),  -- Número con 2 decimales
    situacion VARCHAR(2),  -- Relacionado con tabla 13
    exonerado_renta_5ta CHAR(1),  -- (0,1)
    situacion_especial CHAR(1),  -- (0,1)
    tipo_pago VARCHAR(2),  -- Relacionado con tabla 16
    categoria_ocupacional VARCHAR(2),  -- Relacionado con tabla 17
    convenio_doble_tributacion CHAR(1),  -- (0,1)
    sub_centro_costo VARCHAR(255),  -- Relacionado con tabla 18, columna A
    centro_costo VARCHAR(255),  -- Relacionado con tabla 18, columna B
    sub_sub_centro_costo VARCHAR(255),  -- Relacionado con tabla 18, columna C
    area VARCHAR(255),  -- Relacionado con tabla 18, columna D
    cargo_boleta VARCHAR(255),  -- Listado del MOP
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE incidencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    codigo VARCHAR(255),
    dias INT,
    horas VARCHAR(2),  -- Relacionado con tabla 22
    importe VARCHAR(2),  -- Relacionado con tabla 23
    mes VARCHAR(2),  -- Relacionado con tabla 24
    anio CHAR(1),  -- Relacionado con tabla 25
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE contrato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    motivo_fin_baja VARCHAR(2),  -- Relacionado con tabla 22
    tipo_trabajador VARCHAR(2),  -- Relacionado con tabla 23
    regimen_salud VARCHAR(2),  -- Relacionado con tabla 24
    eps_servicios_propios CHAR(1),  -- Relacionado con tabla 25
    sctr_salud ENUM('1', '2'),  -- 1: Essalud / 2: EPS
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE
);

CREATE TABLE evaluacion_periodica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    periodo YEAR,  -- Año en 4 cifras
    fecha DATE,  -- Fecha de evaluación
    conocimiento_puesto TINYINT,  -- Números del 1 al 10
    calidad_en_desarrollos TINYINT,  -- Números del 1 al 10
    manejo_programas_informaticos TINYINT,  -- Números del 1 al 10
    capacidad_aprendizaje TINYINT,  -- Números del 1 al 10
    cumplimiento_procesos_sig TINYINT,  -- Números del 1 al 10
    trabajo_en_equipo TINYINT,  -- Números del 1 al 10
    comunicacion_asertiva TINYINT,  -- Números del 1 al 10
    flexibilidad_adaptacion_cambio TINYINT,  -- Números del 1 al 10
    capacidad_resolucion_creatividad_proactividad TINYINT,  -- Números del 1 al 10
    organizacion_gestion_tiempo TINYINT,  -- Números del 1 al 10
    orientacion_cliente TINYINT,  -- Números del 1 al 10
    compromiso TINYINT,  -- Números del 1 al 10
    manejo_situaciones_criticas TINYINT,  -- Números del 1 al 10
    liderazgo TINYINT,  -- Números del 1 al 10
    gestion_personas TINYINT,  -- Números del 1 al 10
    empowerment TINYINT,  -- Números del 1 al 10
    orientacion_resultado TINYINT,  -- Números del 1 al 10
    coordinador INT,  -- Id del usuario (asumo que es un usuario existente)
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id) ON DELETE CASCADE,
    FOREIGN KEY (coordinador) REFERENCES usuarios(id) ON DELETE CASCADE
);


CREATE TABLE evaluacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,  -- Id del usuario (asumo que es un usuario existente)
    fecha_evaluacion DATE,  -- Fecha de evaluación
    detalles_calificacion TEXT,  -- Detalles que sustentan la calificación
    puntuacion_global TINYINT,  -- Puntuación global de la evaluación (por ejemplo, de 1 a 10)
    clasificacion ENUM('buena', 'mala') DEFAULT 'mala',  -- Clasificación de la evaluación
    estado CHAR(1) DEFAULT '1',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE
);


