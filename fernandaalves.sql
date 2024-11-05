--CREATE DATABASE--

CREATE DATABASE hospital;

--CREATE TABLES--

CREATE TABLE pacientes (
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
);

CREATE TABLE medicos (
    id_medico SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
)

--INSERTS em pacientes--

INSERT INTO pacientes (nome, cpf) VALUES
('Nathalia Santos', '12345678901'),
('Daniel Braga', '12345678902'),
('Felipe Silva', '12345678903'),
('Jéssica Barros', '12345678904'),
('Chico Lourenço', '12345678905');

--INSERTS em medicos--

INSERT INTO medicos (nome, especialidade) VALUES
('Dr. Fernando', 'Cardiologista'),
('Dra. Helena', 'Ginecologista'),
('Dra. Regina', 'Pediatra'),
('Dra. Angélica', 'Dermatologista')
('Drs. Wilma', 'Gastroenterologista')

--CREATE TABLE consultas--

CREATE TABLE consultas (
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_consulta DATE NOT NULL,
    CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);