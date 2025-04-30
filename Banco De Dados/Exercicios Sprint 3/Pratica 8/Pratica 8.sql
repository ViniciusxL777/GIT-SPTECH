CREATE DATABASE Venda;
USE Venda;

CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100),
cep CHAR(7),
rua VARCHAR(100),
bairro VARCHAR(100),
fkCliente2 INT,
CONSTRAINT fkClienteCliente FOREIGN KEY (fkCliente2)
	REFERENCES cliente (idCliente)
);

CREATE TABLE venda (
idVenda INT AUTO_INCREMENT,
pkCliente INT,
PRIMARY KEY (idVenda, pkCliente),
CONSTRAINT pkClienteVenda FOREIGN KEY (pkCliente)
	REFERENCES cliente (idCliente),
dtVenda DATE,
totalVenda INT,
fkCliente INT
);

CREATE TABLE produto (
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
preco INT
);

CREATE TABLE lote (
idLote INT AUTO_INCREMENT,
pkVenda INT,
pkProduto INT,
PRIMARY KEY (idLote, pkVenda, pkProduto),
CONSTRAINT fkVendaLote FOREIGN KEY (pkVenda)
	REFERENCES venda (idVenda),
CONSTRAINT fkProdutoLote FOREIGN KEY produto (pkProduto)
	REFERENCES produto (idProduto),
qtdProduto INT,
desconto INT
);

INSERT INTO cliente (nome, email, cep, rua, bairro, fkCliente2) VALUES
('João Silva', 'joao@exemplo.com', '1234567', 'Rua A', 'Centro', NULL),
('Maria Oliveira', 'maria@exemplo.com', '7654321', 'Rua B', 'Bairro B', 1),
('Carlos Costa', 'carlos@exemplo.com', '5671234', 'Rua C', 'Bairro C', 2);

INSERT INTO venda (dtVenda, totalVenda, pkCliente) VALUES
('2025-04-27', 500, 1),
('2025-04-28', 300, 2),
('2025-04-28', 450, 3);

INSERT INTO produto (nome, preco) VALUES
('Produto A', 50),
('Produto B', 75),
('Produto C', 100);

INSERT INTO lote (pkVenda, pkProduto, qtdProduto, desconto) VALUES
(1, 1, 2, 5),
(1, 2, 1, 10),
(2, 3, 3, 0),
(3, 1, 1, 15),
(3, 2, 2, 5);

SELECT * FROM cliente;
SELECT * FROM venda;
SELECT * FROM produto;
SELECT * FROM lote;

SELECT * FROM cliente AS c JOIN venda AS v
	ON c.idCliente = v.pkCliente;
    
SELECT * FROM cliente AS c JOIN  venda AS v
	ON c.idCliente = v.pkCliente
WHERE c.nome = 'Carlos Costa';

SELECT c.nome AS indicados, c2.nome as indicadores
FROM cliente AS c JOIN cliente AS c2
	ON c.fkCliente2 = c2.idCliente;
    
SELECT * FROM cliente AS c JOIN cliente AS c2
	ON c.fkCliente2 = c2.idCliente
WHERE c2.nome = 'João Silva';

SELECT v.idVenda,
	v.dtVenda,
	p.nome,
    l.qtdProduto
FROM venda AS v JOIN lote AS l
	ON l.pkVenda = v.idVenda
JOIN produto AS p
	ON l.pkProduto = p.idProduto
WHERE v.idVenda = 1;

INSERT INTO cliente (nome, email, cep, rua, bairro, fkCliente2) VALUES
('Luiza Ferreira', 'luiza@exemplo.com', '3456789', 'Rua E', 'Vila Esperança', NULL);

SELECT * FROM cliente AS c LEFT JOIN venda AS v
	ON c.idCliente = v.pkCliente;
