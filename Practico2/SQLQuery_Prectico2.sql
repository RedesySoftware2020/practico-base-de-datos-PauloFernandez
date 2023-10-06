CREATE TABLE USUARIOS (
    Cedula VARCHAR(8) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255),
    Email VARCHAR(255) NOT NULL,
    Email_de_Usuario VARCHAR(255) NOT NULL,
    Tipo_de_usuario INT
);

CREATE TABLE PROFESOR (
	IdProfesor INT PRIMARY KEY IDENTITY(1,1),
    Cedula VARCHAR(8),
    FOREIGN KEY (Cedula) REFERENCES USUARIOS(Cedula)
);

CREATE TABLE ALUMNOS (
	IdAlumnos INT PRIMARY KEY IDENTITY(1,1),
    Cedula VARCHAR(8) ,
    FOREIGN KEY (Cedula) REFERENCES USUARIOS(Cedula)
);

CREATE TABLE BEDELIAS (
    IdBedelia INT PRIMARY KEY IDENTITY(1,1),
	Cedula VARCHAR(8),
    Cargo VARCHAR(50) not null,
    GradoDelCargo VARCHAR(50) not null,
    FOREIGN KEY (Cedula) REFERENCES USUARIOS(Cedula)
);

CREATE TABLE MATERIAS (
    IdMateria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
);

CREATE TABLE GRUPOS (
    idGrupo INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    ano_electivo varchar(10) NOT NULL,
    fecha_Creacion datetime NOT NULL
);

CREATE TABLE FORO (
    IdForo INT PRIMARY KEY IDENTITY(1,1),
    Informacion text not null,
    Data_Blog VARBINARY(MAX),
);

CREATE TABLE TAREAS (
    IdTareas INT PRIMARY KEY IDENTITY(1,1),
    Descripcion text NOT NULL,
    Fecha_de_Vencimiento VARCHAR(255) NOT NULL,
    Archivo VARBINARY(MAX),
    Fecha_de_Creacion DATETIME NOT NULL
);

CREATE TABLE DATOS_FORO (
    IdDatos INT PRIMARY KEY IDENTITY(1,1),
    ForoId INT,
    Cedula VARCHAR(8),
    mensaje VARCHAR(MAX) NOT NULL,
    archivo VARBINARY(MAX),
    FOREIGN KEY (Cedula) REFERENCES USUARIOS(Cedula),
    FOREIGN KEY (ForoId) REFERENCES FORO(IdForo)
);

CREATE TABLE HISTORIAL_REGISTRO (
    IdHistorial INT PRIMARY KEY IDENTITY(1,1),
	Cedula VARCHAR(8),
    Mensaje VARCHAR(255),
    FOREIGN KEY (Cedula) REFERENCES USUARIOS(Cedula),
);

CREATE TABLE MATERIAL_PUBLICO (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
	Cedula VARCHAR(8),
    titulo VARCHAR(255),
    Mensaje VARCHAR(MAX),
    FOREIGN KEY (Cedula) REFERENCES USUARIOS(Cedula)
);

CREATE TABLE CARRERA (
    IdCarrera INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    categoria VARCHAR(10) NOT NULL,
    planificacion VARCHAR(8) NOT NULL
);

CREATE TABLE GRADO (
    IdGrado INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    carrera_id INT,
    FOREIGN KEY (carrera_id) REFERENCES CARRERA(IdCarrera)
);

CREATE TABLE DICTA (
    Id_Materia INT,
    Id_Profesor INT,
    PRIMARY KEY (Id_Materia, Id_Profesor),
    FOREIGN KEY (Id_Materia) REFERENCES MATERIAS(IdMateria),
    FOREIGN KEY (Id_Profesor) REFERENCES PROFESOR(IdProfesor)
);

CREATE TABLE PERTENECEN (
    Id_Alumno int,
    id_Grupo int,
    PRIMARY KEY (Id_Alumno, id_Grupo),
    FOREIGN KEY (Id_Alumno) REFERENCES ALUMNOS(IdAlumnos),
    FOREIGN KEY (id_Grupo) REFERENCES GRUPOS(idGrupo)
);

CREATE TABLE TIENEN (
    Id_Materia INT,
    id_Grupo INT,
    id_Profesor INT,
    PRIMARY KEY (Id_Materia, id_Grupo, id_Profesor),
    FOREIGN KEY (Id_Materia) REFERENCES MATERIAS(IdMateria),
    FOREIGN KEY (id_Grupo) REFERENCES GRUPOS(idGrupo),
    FOREIGN KEY (id_Profesor) REFERENCES PROFESOR(idProfesor)
);

CREATE TABLE CREA (
    Id_Materia INT,
    Id_Tareas INT,
    id_Grupo INT,
    id_Profesor INT,
    PRIMARY KEY (Id_Materia, Id_Tareas, id_Grupo, id_Profesor),
    FOREIGN KEY (Id_Materia) REFERENCES MATERIAS(IdMateria),
    FOREIGN KEY (Id_Tareas) REFERENCES TAREAS(IdTareas),
    FOREIGN KEY (id_Grupo) REFERENCES GRUPOS(idGrupo),
    FOREIGN KEY (id_Profesor) REFERENCES PROFESOR(idProfesor)
);

CREATE TABLE ENTREGA (
    Id_Alumno int,
    Id_Tareas INT,
    Archivo VARBINARY(MAX),
    Calificacion INT,
    Fecha_entrega INT NOT NULL,
    PRIMARY KEY (Id_Alumno, Id_Tareas),
    FOREIGN KEY (Id_Alumno) REFERENCES ALUMNOS(IdAlumnos),
    FOREIGN KEY (Id_Tareas) REFERENCES TAREAS(IdTareas)
);

CREATE TABLE ESTAN (
    Id_Foro INT,
    Id_Materia INT,
    id_Grupo INT,
    id_Profesor INT,
    PRIMARY KEY (Id_Foro, Id_Materia, id_Grupo, id_Profesor),
    FOREIGN KEY (Id_Foro) REFERENCES FORO(IdForo),
    FOREIGN KEY (Id_Materia) REFERENCES MATERIAS(IdMateria),
    FOREIGN KEY (id_Grupo) REFERENCES GRUPOS(idGrupo),
    FOREIGN KEY (id_Profesor) REFERENCES PROFESOR(idProfesor)
);

CREATE TABLE RE_HACER_TAREA (
    IdTareasNueva INT IDENTITY(1,1),
    IdTareas INT,
    Calificacion INT,
    Fecha_entrega date NOT NULL,
    Archivo VARBINARY(MAX),
    PRIMARY KEY (IdTareasNueva, IdTareas),
    FOREIGN KEY (IdTareas) REFERENCES TAREAS(IdTareas)
);

CREATE TABLE CARRERA_MATERIA (
    Id_Materia INT,
    Id_Carrera INT,
    Id_Grado INT,
    PRIMARY KEY (Id_Materia, Id_Carrera, Id_Grado),
    FOREIGN KEY (Id_Materia) REFERENCES MATERIAS(IdMateria),
    FOREIGN KEY (Id_Carrera) REFERENCES CARRERA(IdCarrera),
    FOREIGN KEY (Id_Grado) REFERENCES GRADO(IdGrado)
);