-- Exercicio 1

USE sprint2;

CREATE TABLE projeto (
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao VARCHAR(250)
);

INSERT INTO projeto VALUES 
	(default, 'Projeto 1', 'Descricao 1'),
    (default, 'Projeto 2', 'Descricao 2');

CREATE TABLE aluno (
	ra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone CHAR(12),
    fkRepresentante INT,
    fkProjeto INT,
    CONSTRAINT fkRepresentanteAluno FOREIGN KEY (fkRepresentante)
		REFERENCES aluno (ra),
	CONSTRAINT fkProjetoAluno FOREIGN KEY (fkProjeto)
		REFERENCES projeto (idProjeto)
	);
    
INSERT INTO aluno VALUES
	(default, 'Aluno 1', '11-900000001', null, 1),
    (default, 'Aluno 2', '11-900000002', 1, 1),
    (default, 'Aluno 3', '11-900000003', null, 2),
    (default, 'Aluno 4', '11-900000004', 2, 2);
    
SELECT * FROM projeto;
SELECT * FROM aluno;

SELECT aluno.nome AS Aluno,
	projeto.nome AS Projeto
FROM aluno JOIN projeto
	ON aluno.fkProjeto = projeto.idProjeto;
    
SELECT a.nome AS Aluno,
	r.nome AS Representante,
    p.nome AS Projeto
FROM aluno AS a LEFT JOIN aluno AS r
	ON a.fkRepresentante = r.ra
JOIN projeto AS p
	ON a.fkProjeto = p.idProjeto;
    
SELECT a.nome AS Aluno,
	a.telefone AS telefone,
	p.nome AS projeto
FROM aluno AS a JOIN Projeto AS p
	ON a.fkProjeto = p.idProjeto
WHERE p.nome = 'Projeto 1';

-- Exercicio 2
CREATE DATABASE Campanha;

USE Campanha;

CREATE TABLE organizador (
	idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR (100),
	fkOrientador INT,
    CONSTRAINT fkOrientadorOrganizador FOREIGN KEY (fkOrientador)
		REFERENCES organizador (idOrganizador)
) AUTO_INCREMENT = 30;
    
CREATE TABLE endereco (
	fkEndereco INT UNIQUE,
	CONSTRAINT pkComposta PRIMARY KEY (fkEndereco),
	rua VARCHAR(100),
	bairro VARCHAR(100),
	CONSTRAINT fkEnderecoUsuario FOREIGN KEY (fkEndereco)
		REFERENCES organizador (idOrganizador)
);
    
CREATE TABLE campanha (
	idCampanha INT PRIMARY KEY AUTO_INCREMENT,
	categoria VARCHAR(100),
	dtFinal DATE,
	fkOrganizador INT,
	CONSTRAINT fkOrganizadorCampanha FOREIGN KEY (fkOrganizador)
		REFERENCES organizador (idOrganizador)
) AUTO_INCREMENT = 500;
    
CREATE TABLE instituicao (
	fkCampanha INT,
	CONSTRAINT pkComposta2 FOREIGN KEY (fkCampanha)
		REFERENCES campanha (idCampanha),
	nome VARCHAR(100)
);

INSERT INTO organizador (nome, email, fkOrientador) VALUES
    ('João Silva', 'joao.silva@email.com', null),
    ('Maria Oliveira', 'maria.oliveira@email.com', null),
    ('Carlos Souza', 'carlos.souza@email.com', 30),
    ('Ana Pereira', 'ana.pereira@email.com', 31),
    ('Pedro Costa', 'pedro.costa@email.com', 30),
    ('Fernanda Lima', 'fernanda.lima@email.com', 31),
    ('Ricardo Alves', 'ricardo.alves@email.com', 30);

INSERT INTO endereco (fkEndereco, rua, bairro) VALUES
    (30, 'Rua das Flores, 123', 'Centro'),
    (31, 'Avenida Brasil, 456', 'Jardim América'),
    (32, 'Rua dos Pinheiros, 789', 'Vila Madalena'),
    (33, 'Alameda Santos, 1011', 'Cerqueira César'),
    (34, 'Rua Augusta, 1213', 'Consolação'),
    (35, 'Rua Oscar Freire, 567', 'Jardins'),
    (36, 'Avenida Paulista, 1001', 'Bela Vista');

INSERT INTO campanha (categoria, dtFinal, fkOrganizador) VALUES
    ('Alimentos', '2023-12-31', 30),
    ('Roupas', '2023-11-30', 31),
    ('Brinquedos', '2023-10-15', 32),
    ('Livros', '2024-01-20', 33),
    ('Material Escolar', '2023-09-30', 34),
    ('Higiene Pessoal', '2023-12-15', 35),
    ('Medicamentos', '2024-02-28', 36);

INSERT INTO instituicao (fkCampanha, nome) VALUES
    (500, 'Banco de Alimentos'),
    (501, 'Casa de Acolhimento'),
    (502, 'Lar Infantil'),
    (503, 'Biblioteca Comunitária'),
    (504, 'Escola Municipal'),
    (505, 'Abrigo para Moradores de Rua'),
    (506, 'Posto de Saúde Comunitário');
    
SELECT * FROM organizador;
SELECT * FROM endereco;
SELECT * FROM campanha;
SELECT * FROM instituicao;

SELECT o.nome AS Organizador,
	e.rua AS Rua_Organizador,
    e.bairro AS Bairro_Organizador,
    c.categoria AS Campanha
FROM organizador AS o JOIN endereco AS e
	ON e.fkEndereco = o.idOrganizador
JOIN campanha AS c
	ON c.fkOrganizador = o.idOrganizador;
    
SELECT o.nome AS Organizador,
	e.rua AS Rua_Organizador,
	e.bairro AS Bairro_Organizador,
	c.categoria AS Campanha
FROM organizador AS o JOIN endereco AS e
	ON o.idOrganizador = e.fkEndereco
JOIN campanha AS c
	ON c.fkOrganizador = o.idOrganizador
WHERE o.nome = 'João Silva';

SELECT org.nome AS Nome,
	ori.nome AS Nome_Orientador,
CASE
	WHEN org.fkOrientador is null THEN 'Orientadores'
	ELSE 'Novatos' END AS Status
FROM organizador AS org JOIN organizador AS ori
	ON org.fkOrientador = ori.idOrganizador;
    
SELECT org.nome AS Nome,
	org.email AS Email,
    ori.nome AS Orientador,
CASE 
	WHEN org.fkOrientador is null THEN 'Orientador'
    ELSE 'Novato' END AS Status
FROM organizador AS org LEFT JOIN organizador AS ori
	ON org.fkOrientador = ori.idOrganizador;
    
SELECT org.nome AS Nome,
	org.email AS Email,
    ori.nome AS Orientador,
CASE 
	WHEN org.fkOrientador is null THEN 'Orientador'
    ELSE 'Novato' END AS Status
FROM organizador AS org JOIN organizador AS ori
	ON org.fkOrientador = ori.idOrganizador
WHERE ori.nome = 'João Silva';
    
SELECT org.nome AS Nome,
	org.email AS Email,
    ori.nome AS Orientador,
    c.categoria AS Categoria,
    c.dtFinal AS DtFinal
FROM organizador AS org JOIN organizador AS ori
	ON org.fkOrientador = ori.idOrganizador
JOIN campanha as c
	ON c.fkOrganizador = org.idOrganizador;
    
SELECT org.nome AS Nome,
	org.email AS Email,
    ori.nome AS Orientador,
    c.categoria AS Categoria,
    c.dtFinal AS DtFinal
FROM organizador AS org JOIN organizador AS ori
	ON org.fkOrientador = ori.idOrganizador
JOIN campanha as c
	ON c.fkOrganizador = org.idOrganizador
WHERE org.nome = 'Carlos Souza';
    