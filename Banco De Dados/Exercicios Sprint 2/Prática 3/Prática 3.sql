-- Exercicio 1

CREATE DATABASE sprint2; 
USE sprint2;

CREATE TABLE atleta (
idAtleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
modalidade VARCHAR(100),
qtdMedalha INT
);

INSERT INTO atleta VALUES 
	(default, 'Vinicius', 'Futebol', 7777),
    (default, 'Felipe', 'Futebol', 10),
    (default, 'Caio', 'Basquete', 9),
    (default, 'Kauã', 'Futebol', 8),
    (default, 'Andrew', 'Volei', 7);
    
CREATE TABLE pais (
idPais INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
capital VARCHAR(100)
);

INSERT INTO pais VALUES
	(default, 'Brasil', 'Brasilia'),
    (default, 'Canada', 'Ottawa'),
	(default, 'Russia', 'Moscovo'),
	(default, 'Inglaterra', 'Londres');
    
ALTER TABLE atleta ADD COLUMN fkPais INT,
	ADD CONSTRAINT fkAtletaPais
		FOREIGN KEY (fkPais)
			REFERENCES pais (idPais);
            
UPDATE atleta SET fkPais = 1 WHERE idAtleta = 1;
UPDATE atleta SET fkPais = 2 WHERE idAtleta = 2;
UPDATE atleta SET fkPais = 3 WHERE idAtleta = 3;
UPDATE atleta SET fkPais = 4 WHERE idAtleta = 4;
UPDATE atleta SET fkPais = 1 WHERE idAtleta = 5;

SELECT * FROM atleta;
SELECT * FROM pais;

SELECT atleta.nome AS Atleta,
	pais.nome AS Pais
FROM atleta JOIN pais
	ON idPais = fkPais;
    
SELECT atleta.nome AS Atleta,
	pais.nome AS Pais,
    pais.capital AS Capital
FROM atleta JOIN pais
	ON idPais = fkPais
WHERE capital = 'Brasilia';
    
    
-- Exercicio 2 

USE sprint2;

CREATE TABLE musica (
idMusica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO musica VALUES
	(default, 'Ninguém Explica Deus', 'Preto no Branco', 'Whorship/Gospel'),
	(default, 'Raridade', 'Anderson Freire', 'Gospel'),
	(default, 'Autor da Vida', 'Aline Barros', 'Gospel/Adoração');
    
CREATE TABLE album (
idAlbum INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
tipo VARCHAR(40),
CONSTRAINT ckTipo 
	CHECK (tipo IN ('digital', 'fisico')),
dtLancamento date
);

INSERT INTO album VALUES
	(default, 'Album 1', 'digital', '2000-10-01'),
    (default, 'Album 2', 'fisico', '2002-11-02');
    
SELECT * FROM musica;
SELECT * FROM album;
    
ALTER TABLE musica ADD COLUMN fkAlbum INT,
	ADD CONSTRAINT fkMusicaAlbum
		FOREIGN KEY (fkAlbum)
			REFERENCES album (idAlbum);

UPDATE musica SET fkAlbum = 1 WHERE idMusica = 1;
UPDATE musica SET fkAlbum = 2 WHERE idMusica = 2;
UPDATE musica SET fkAlbum = 1 WHERE idMusica = 3;

SELECT * FROM musica JOIN album
	ON idAlbum = fkAlbum;

SELECT musica.titulo AS Musica,
	album.nome AS Nome
FROM musica JOIN album
	ON idAlbum = fkAlbum;
    

-- Exercicio 3

USE sprint2;

CREATE TABLE pessoa (
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

INSERT INTO pessoa VALUES
	 (default, 'João Silva', '12345678901'),
    (default, 'Maria Oliveira', '23456789012'),
    (default, 'Carlos Souza', '34567890123'),
    (default, 'Ana Lima', '45678901234'),
    (default, 'Pedro Santos', '56789012345');

CREATE TABLE reserva (
idReserva INT PRIMARY KEY AUTO_INCREMENT,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME,
fkPessoa INT,
	CONSTRAINT fkReservaPessoa  FOREIGN KEY (fkPessoa) 
		REFERENCES pessoa (idPessoa)
);

INSERT INTO reserva VALUES
	(default, '2025-03-15 10:00:00', '2025-03-16 10:00:00', '2025-03-20 10:00:00', 1),
    (default, '2025-03-16 15:00:00', '2025-03-17 15:00:00', '2025-03-21 15:00:00', 2),
    (default, '2025-03-17 09:00:00', '2025-03-18 09:00:00', '2025-03-22 09:00:00', 3),
    (default, '2025-03-18 14:30:00', '2025-03-19 14:30:00', '2025-03-23 14:30:00', 4),
    (default, '2025-03-19 11:00:00', '2025-03-20 11:00:00', '2025-03-24 11:00:00', 5);

SELECT * FROM pessoa;
SELECT * FROM reserva;

SELECT pessoa.nome AS Nome,
	reserva.dtReserva AS DataReserva,
	reserva.dtRetirada AS DataRetirada,
	reserva.dtDevolucao AS DataDevolucao
FROM pessoa JOIN reserva
	ON fkPessoa = idPessoa;
    
SELECT pessoa.nome,
	pessoa.cpf,
    reserva.dtReserva,
CASE
    WHEN dtReserva LIKE '%____-10-__ __:__:__%' THEN 'Reserva programada para outubro'
    WHEN dtReserva LIKE '%____-11-__ __:__:__ 'THEN 'Reserva programada para novembro'
    WHEN dtReserva LIKE '%____-12-__ __:__:__%' THEN 'Reserva programada para dezembro'
    ELSE 'Sua reserva expirou'
END AS StatusReserva
FROM pessoa JOIN reserva
	ON fkPessoa = idPessoa;

INSERT INTO reserva VALUES
	(default, '2025-05-23 16:00:00', '2025-05-24 11:00:00', '2025-05-25 11:00:00', null);


SELECT idReserva, dtReserva, dtRetirada, dtDevolucao,
	IFNULL(fkPessoa, 'Sem Pessoa') AS NomePessoa
FROM pessoa JOIN reserva 
	ON fkPessoa = idPessoa;

-- Exercicio 4

USE sprint2;

CREATE TABLE pessoa1 (
idPessoa1 INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(45),
dtNascimento DATE
);

INSERT INTO pessoa1 VALUES
	(default, 'João Silva', '1990-05-15'),
    (default, 'Maria Oliveira', '1985-10-20'),
    (default, 'Carlos Pereira', '1978-07-07'),
    (default, 'Ana Santos', '1995-12-02'),
    (default, 'Paulo Lima', '2000-03-25'),
	(default, 'José', '2000-03-25');

CREATE TABLE pessoa2 (
idPessoa2 INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(45),
dtNascimento DATE,
fkPessoa1 INT UNIQUE,
	CONSTRAINT fkPessoa2Pessoa1 FOREIGN KEY (fkPessoa1)
		REFERENCES pessoa1 (idPessoa1)
);

INSERT INTO pessoa2 VALUES 
	(default, 'Gabriel Costa', '1992-11-18', 1),
    (default, 'Fernanda Souza', '1988-09-05', 2),
    (default, 'Luiz Almeida', '1999-02-14', 3),
    (default, 'Camila Rocha', '1993-06-22', 4),
    (default, 'Ricardo Borges', '2001-01-30', 5),
	(default, 'Casé', '2000-03-25', null);
    
SELECT * FROM pessoa1;
SELECT * FROM pessoa2;

SELECT pessoa1.nome AS Nome,
	pessoa2.nome AS Nome
FROM pessoa1 JOIN pessoa2
	ON fkPessoa1 = idPessoa1;

SELECT pessoa1.nome AS Nome1,
       pessoa2.nome AS Nome2,
CASE
    WHEN fkPessoa1 IS NOT NULL THEN 'Casal'
    ELSE 'Solteiro'
END AS StatusRelacionamento
FROM Pessoa1 JOIN Pessoa2 
	ON idPessoa1 = fkPessoa1;
        

SELECT *, IFNULL(fkPessoa1, 'Sem Pessoa') AS Relacionamento 
FROM pessoa2;

-- Exercicio 5

USE sprint2;

CREATE TABLE candidato (
idCandidato INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
);

INSERT INTO candidato VALUES
	(default, 'João Silva'),
	(default, 'Maria Oliveira'),
	(default, 'Carlos Souza'),
	(default, 'Ana Costa'),
	(default, 'Pedro Rocha');
    
CREATE TABLE carteira (
idCarteira INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(45),
	CONSTRAINT chkCategoria CHECK (categoria IN ('A', 'B', 'A B', 'ACC', 'B ACC')),
validade DATE,
fkCandidato INT UNIQUE,
	CONSTRAINT fkCandidatoCategoria FOREIGN KEY (fkCandidato)
		REFERENCES candidato (idCandidato)
);

INSERT INTO carteira VALUES
	(default, 'A', '2024-12-31', 1),
	(default, 'B', '2024-11-30', 2),
	(default, 'A B', '2024-10-31', 3),
	(default, 'ACC', '2024-09-30', 4),
	(default, 'B ACC', '2024-08-31', 5);
    
SELECT * FROM candidato;
SELECT * FROM carteira;

SELECT candidato.nome AS Candidato,
	carteira.categoria AS Categoria
FROM candidato JOIN carteira
	ON fkCandidato = idCandidato;
    
SELECT candidato.nome AS Candidato,	
	carteira.categoria AS Categoria,
CASE 
	WHEN categoria = 'A' THEN 'MOTOCICLETA'
	WHEN categoria = 'B' THEN 'AUTOMÓVEL'
	WHEN categoria = 'A B' THEN 'MOTOCICLETA E AUTOMÓVEL'
	ELSE 'Outras categorias'
END AS Veiculos
FROM candidato JOIN carteira 
	ON fkCandidato = idCandidato;
    
SELECT candidato.nome AS Nome,
	IFNULL(carteira.categoria, 'Sem carteira') AS Categoria
FROM candidato JOIN carteira
	ON fkCandidato = idCandidato;
	
-- EXERCICIO 6
    
USE sprint2;

CREATE TABLE endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(100),
numero VARCHAR(10),
cep VARCHAR(10)
);

CREATE TABLE farmacia (
idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
fkEndereco INT UNIQUE,
	CONSTRAINT fkFarmaciaEndereco FOREIGN KEY (fkEndereco)
		REFERENCES endereco (idEndereco)
);

CREATE TABLE farmaceutico (
idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
fkFarmacia INT,
	CONSTRAINT fkFarmaceuticoFarmacia FOREIGN KEY (fkFarmacia)
		REFERENCES farmacia (idFarmacia)
);

INSERT INTO endereco VALUES
(default, 'Avenida Central', '100', '12345-678'),
(default, 'Rua das Flores', '50', '98765-432');

INSERT INTO farmacia VALUES
(default, 'Farmacia São João', 1),
(default, 'Farmacia Vida', 2);

INSERT INTO farmaceutico VALUES
(default, 'Maria Silva', 1),
(default, 'João Oliveira', 1),
(default, 'Ana Costa', 2),
(default, 'Carlos Santos', 2);

SELECT * FROM endereco;
SELECT * FROM farmacia;
SELECT * FROM farmaceutico;

SELECT farmaceutico.nome AS Farmacia,
	farmacia.nome AS Farmacia
FROM farmaceutico JOIN farmacia
	ON fkFarmacia = idFarmacia 
ORDER BY farmacia.idFarmacia ASC;

SELECT endereco.rua AS Endereco,
	farmacia.nome AS Farmacia,
CASE 
	WHEN Farmacia.idFarmacia = 1 THEN 'Numero UM'
		ELSE 'Está Ficando Para Trás'
END AS StatusFarmacia
FROM farmacia JOIN endereco
	ON fkEndereco = idEndereco;
    
INSERT INTO farmaceutico VALUES
	(default, null, 1);
    
SELECT IFNULL(nome, 'Loucos Que N Colocam Nome No Cadastro') AS SemNomes FROM farmaceutico;