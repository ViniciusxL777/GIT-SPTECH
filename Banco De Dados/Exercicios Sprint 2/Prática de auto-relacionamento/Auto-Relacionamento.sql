CREATE DATABASE sprint2;

USE sprint2;

-- eXERCICIO 1
    
CREATE TABLE area (
	idArea INT PRIMARY KEY AUTO_INCREMENT,
	nomeArea VARCHAR(100),
	CONSTRAINT chkArea CHECK (nomeArea IN ('TI', 'Programador'))
);
	
INSERT INTO area VALUES 
	(1, 'TI'),
    (2, 'Programador');
    
CREATE TABLE funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    fkSupervisor INT,
    fkArea INT,
    CONSTRAINT fkSupervisorFuncionario FOREIGN KEY (fkSupervisor)
		REFERENCES funcionario (idFuncionario),
	CONSTRAINT fkAreaFuncionario FOREIGN KEY (fkArea)
		REFERENCES area (idArea)
	);
    
INSERT INTO funcionario VALUES 
	(default, 'Gabriel', null, 1),
	(default, 'João', null, 2),
	(default, 'Vitor', 1, 1),
	(default, 'Paulo', 2, 2),
	(default, 'Pedro', 1, 1),
	(default, 'Guilherme', 2, 2),
	(default, 'Lucas', 1, 1),
	(default, 'Felipe', 2, 2);

SELECT empregado.nome AS Nome,
	supervisor.nome AS Supervisor,
    area.nomeArea AS Area
FROM funcionario AS empregado JOIN area
	ON empregado.fkArea = idArea
	JOIN funcionario AS supervisor
	ON empregado.fkSupervisor = supervisor.idFuncionario;

SELECT empregado.nome AS Nome,
	supervisor.nome AS Supervisor,
    area.nomeArea AS Area
FROM funcionario AS empregado JOIN area
	ON empregado.fkArea = area.idArea
JOIN funcionario AS supervisor
	ON empregado.fkSupervisor = supervisor.idFuncionario
WHERE area.nomeArea LIKE 'Programador';

SELECT empregado.nome AS Nome,
	supervisor.nome AS Supervisor,
	area.nomeArea AS Area,
CASE 
	WHEN area.nomeArea = 'TI' THEN 'Area Muito Chata'
    ELSE 'Melhor Que TI'
END AS 'Area'
FROM funcionario AS empregado JOIN area
	ON empregado.fkArea = area.idArea
JOIN funcionario AS supervisor
	ON empregado.fkSupervisor = supervisor.idFuncionario;
    
SELECT e.nome as Funcionário,
	ifnull(e.fkSupervisor, "Supervisor") as Cargo,
    a.nomeArea as Area,
CASE
    WHEN e.fkSupervisor LIKE "%%" THEN "Empregado"
    ELSE "Supervisor" END AS Status
FROM funcionario AS e JOIN area AS a
	ON e.fkArea = a.idArea
ORDER BY a.nomeArea ASC;

SELECT e.nome AS Funcionario,
	a.nomeArea AS Area,
CASE
	WHEN e.fkSupervisor is null THEN 'Supervisor'
    ELSE 'Empregado' END AS Status
FROM funcionario AS e JOIN area AS a
	ON e.fkArea = a.idArea
ORDER BY Status DESC;

-- Exercicio 2

USE sprint2;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100),
    fkGerente INT,
    CONSTRAINT fkGerenteUsuario FOREIGN KEY (fkGerente)
		REFERENCES usuario (idUsuario)
);

INSERT INTO usuario VALUES
	(default, 'Vinicus', null),
	(default, 'Felipe', null),
	(default, 'Carlos', 1),
	(default, 'Lucas', 1),
	(default, 'Gabriel', 2),
	(default, 'Pedro', 2);
    
CREATE TABLE email (
	idEmail INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmail VARCHAR(100),
    fkUsuario INT,
    CONSTRAINT fkUsuarioEmail FOREIGN KEY (fkUsuario)
		REFERENCES usuario (idUsuario)
);

INSERT INTO email VALUES
	(default, 'email1@gmail.com', 1),
	(default, 'email2@gmail.com', 2),
	(default, 'email3@gmail.com', 3),
	(default, 'email4@gmail.com', 4),
	(default, 'email4@gmail.com', 5),
	(default, 'email5@gmail.com', 6),
	(default, 'email6@gmail.com', 1);

SELECT usuario1.nomeUsuario AS Nome,
	usuario2.nomeUsuario AS Gerente,
    email.nomeEmail AS Email
FROM usuario AS usuario1 JOIN email
	ON email.fkUsuario = usuario1.idUsuario
JOIN usuario AS usuario2
	ON usuario1.fkGerente = usuario2.idUsuario;
    
SELECT usuario1.nomeUsuario AS Nome,
	usuario2.nomeUsuario AS Gerente,
    email.nomeEmail AS Email
FROM usuario AS usuario1 JOIN email
	ON email.fkUsuario = usuario1.idUsuario
JOIN usuario AS usuario2
	ON usuario1.fkGerente = usuario2.idUsuario
WHERE usuario2.nomeUsuario LIKE '%Vinicus%';

SELECT usuario1.nomeUsuario AS Nome,
	usuario2.nomeUsuario AS Gerente,
    email.nomeEmail AS Email,
CASE
	WHEN usuario2.nomeUsuario LIKE 'Vinicus' THEN 'Otimo'
    ELSE 'Ferrados'
END AS Situacao
FROM usuario AS usuario1 JOIN email
	ON email.fkUsuario = usuario1.idUsuario
JOIN usuario AS usuario2
	ON usuario1.fkGerente = usuario2.idUsuario;
    