--CREATE DATABASE--

CREATE DATABASE hospital;
\c hospital;

--CREATE TABLE pacientes--

CREATE TABLE pacientes (
id_paciente SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) UNIQUE NOT NULL
);

--CREATE TABLE medicos--

CREATE TABLE medicos (
id_medico SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(100) NOT NULL
);

--INSERTS em pacientes--

INSERT INTO pacientes (nome, cpf) VALUES
('Nathalia Santos', '46853158909'),
('Daniel Braga', '91827362082'),
('Felipe Silva', '48593621083'),
('Jéssica Barros', '48261839621'),
('Chico Lourenço', '47440012865');

--INSERTS em medicos--

INSERT INTO medicos (nome, especialidade) VALUES
('Dr. Fernando', 'Cardiologista'),
('Dra. Helena', 'Ginecologista'),
('Dra. Regina', 'Pediatra'),
('Dra. Angélica', 'Dermatologista'),
('Dra. Wilma', 'Gastroenterologista');

--CREATE TABLE consultas--

CREATE TABLE consultas (
id_consulta SERIAL PRIMARY KEY,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
data_consulta DATE NOT NULL,
CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

--INSERTS em consultas--

INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES
(5, 1, '2023-09-10'),
(4, 5, '2024-10-15'),
(2, 3, '2025-01-21'),
(1, 4, '2025-01-30');

--SELECTS--

--Liste os pacientes que já tiveram consultas realizadas, mostrando o nome do paciente, o nome do médico, a data da consulta e a especialidade do médico--

SELECT p.nome, m.nome, c.data_consulta, m.especialidade
FROM consultas c
INNER JOIN pacientes p ON p.id_paciente = c.id_paciente
INNER JOIN medicos m ON m.id_medico = c.id_medico
WHERE c.data_consulta <= CURRENT_DATE;

--Crie uma consulta para mostrar todos os pacientes que não realizaram nenhuma consulta (passadas ou futuro)--

SELECT p.nome, p.cpf
FROM pacientes p
LEFT JOIN consultas c ON p.id_paciente = c.id_paciente
WHERE c.id_paciente IS NULL;

--Crie uma consulta que mostre apenas os médicos que ainda não realizaram nenhuma consulta--

SELECT m.nome, m.especialidade
FROM medicos m
LEFT JOIN consultas c ON m.id_medico = c.id_medico
WHERE c.id_medico IS NULL;