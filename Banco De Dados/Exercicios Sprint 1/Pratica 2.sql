CREATE DATABASE sprint1; -- EXERCICIO 1 
USE sprint1; 
CREATE TABLE atleta ( 
idAtleta INT PRIMARY KEY, 
nome VARCHAR(40), 
modalidade VARCHAR(40), 
qtdMedalha INT 
); 
INSERT INTO atleta VALUES  
('1', 'Vinicius', 'Futebol', '1050'), 
('2', 'Felipe', 'Futebol', '7'), 
('3', 'Peter', 'Basquete', '5'), 
('4', 'João', 'Basquete', '2'), 
('5', 'Caio', 'Volei', '13'); 
DESCRIBE atleta; 
SHOW TABLES; 
SELECT * FROM atleta; 
DROP TABLE atleta; 
UPDATE atleta SET qtdMedalha = '1111' WHERE idAtleta = '1'; 
UPDATE atleta SET qtdMedalha = '10' WHERE idAtleta = '2'; 
UPDATE atleta SET qtdMedalha = '9' WHERE idAtleta = '3'; 
UPDATE atleta SET nome = 'Murilo' WHERE idAtleta = '4'; 
ALTER TABLE atleta ADD COLUMN dtNasc DATE; 
UPDATE atleta SET dtNasc = '2007-03-13' WHERE idAtleta = '1'; 
UPDATE atleta SET dtNasc = '2007-03-13' WHERE idAtleta = '2'; 
UPDATE atleta SET dtNasc = '2005-08-13' WHERE idAtleta = '3'; 
UPDATE atleta SET dtNasc = '2010-07-10' WHERE idAtleta = '4'; 
UPDATE atleta SET dtNasc = '2000-05-11' WHERE idAtleta = '5'; 
DELETE FROM atleta WHERE idAtleta = '5'; 
SELECT * FROM atleta WHERE modalidade != 'natação'; 
SELECT * FROM atleta WHERE qtdMedalha >= '3'; 
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(120); 
DESCRIBE atleta; 
 
TRUNCATE TABLE atleta; 
 
DROP TABLE atleta; 
 
 -- EXERCICIO 2 
 
USE sprint1; 
 
CREATE TABLE musica ( 
 idMusica INT PRIMARY KEY, 
    titulo VARCHAR(40), 
    artista VARCHAR(40), 
    genero VARCHAR(40) 
    ); 
     
INSERT INTO musica VALUES 
 ('1', 'Ninguém Explica Deus', 'Preto no Branco', 'Whorship/Gospel'), 
 ('2', 'Raridade', 'Anderson Freire', 'Gospel'), 
 ('3', 'Autor da Vida', 'Aline Barros', 'Gospel/Adoração'), 
 ('4', 'Ousado Amor', 'Isaias Saad', 'Whorship'), 
 ('5', 'Sonda-me, Usa-me', 'Aline Barros', 'Whorship/Gospel'), 
 ('6', 'Ninguém Explica Deus', 'Preto no Branco', 'Gospel'), 
 ('7', 'Algo Novo', 'Kemuel e Lukas Agustinho', 'Whorship'); 
         
DESCRIBE musica; 
     
SHOW TABLES; 
     
SELECT * FROM musica; 
     
ALTER TABLE musica ADD COLUMN curtidas INT; 
     
UPDATE musica SET curtidas = '10000' WHERE idMusica = '1'; 
UPDATE musica SET curtidas = '9000' WHERE idMusica = '2'; 
UPDATE musica SET curtidas = '8000' WHERE idMusica = '3'; 
UPDATE musica SET curtidas = '7000' WHERE idMusica = '4'; 
UPDATE musica SET curtidas = '6000' WHERE idMusica = '5'; 
UPDATE musica SET curtidas = '5000' WHERE idMusica = '6'; 
UPDATE musica SET curtidas = '4000' WHERE idMusica = '7'; 
     
ALTER TABLE musica MODIFY COLUMN artista VARCHAR(80); 
 
UPDATE musica SET curtidas = '11000' WHERE idMusica = '1'; 
UPDATE musica SET curtidas = '13000' WHERE idMusica = '2'; 
UPDATE musica SET curtidas = '18000' WHERE idMusica = '3'; 
UPDATE musica SET titulo = 'ABC' WHERE idMusica = '5'; 
 
DELETE FROM musica WHERE idMusica = '4'; 
 
SELECT * FROM musica WHERE genero != 'funk'; 
SELECT * from MUSICA WHERE curtidas >= '20'; 
 
DESCRIBE musica; 
 
TRUNCATE TABLE  musica; 
 
DROP TABLE musica; 
 -- EXERCICIO 3 
 
USE sprint1; 
 
CREATE TABLE filme ( 
 idFilme INT PRIMARY KEY, 
    titulo VARCHAR(50), 
    genero VARCHAR(40), 
    diretor VARCHAR(40) 
    ); 
     
INSERT INTO filme VALUES 
  ('1', 'O Poderoso Chefão', 'Crime, Drama', 'Francis Ford Coppola'), 
  ('2', 'Parasita', 'Comédia, Drama, Thriller', 'Bong Joon-ho'), 
  ('3', 'Interestelar', 'Aventura, Drama, Ficção científica', 'Christopher Nolan'), 
  ('4', 'O Senhor dos Anéis: A Sociedade do Anel', 'Aventura, Drama, Fantasia', 
'Peter Jackson'), 
  ('5', 'Pulp Fiction', 'Crime, Drama', 'Quentin Tarantino'), 
  ('6', 'A Origem', 'Ação, Aventura, Ficção científica', 'Christopher Nolan'), 
  ('7', 'A Vida é Bela', 'Comédia, Drama', 'Roberto Benigni'); 
 
DESCRIBE filme; 
SELECT * FROM filme; 
 
ALTER TABLE filme ADD COLUMN protagonista VARCHAR(50); 
 
UPDATE filme SET protagonista = 'João' WHERE idFilme = '1'; 
UPDATE filme SET protagonista = 'Pedro' WHERE idFilme = '2'; 
UPDATE filme SET protagonista = 'Mateus' WHERE idFilme = '3'; 
UPDATE filme SET protagonista = 'Carlos' WHERE idFilme = '4'; 
UPDATE filme SET protagonista = 'Leandro' WHERE idFilme = '5'; 
UPDATE filme SET protagonista = 'Felipe' WHERE idFilme = '6'; 
UPDATE filme SET protagonista = 'Lucas' WHERE idFilme = '7'; 
 
ALTER TABLE filme MODIFY COLUMN diretor VARCHAR(120); 
 
UPDATE filme SET diretor = 'Murilo' WHERE idFilme = '5'; 
UPDATE filme SET diretor = 'Piter' WHERE idFilme = '2'; 
UPDATE filme SET diretor = 'Zanini' WHERE idFilme = '7'; 
UPDATE filme SET titulo = 'João e o pé de feijão' WHERE idFilme = '6'; 
 
SELECT * FROM filme WHERE genero != 'drama'; 
SELECT * FROM filme WHERE genero = 'suspense'; 
SELECT protagonista, diretor FROM filme; 
 
TRUNCATE TABLE filme; 
     
DROP TABLE filme; -- EXERCICIO 4 
 
USE sprint1; 
 
CREATE TABLE professor ( 
 idProfessor INT PRIMARY KEY, 
 nome VARCHAR(50), 
 especialidade VARCHAR(40), 
 dtNascimento DATE 
 ); 
     
INSERT INTO professor VALUES 
 ('1', 'Cintia', 'Matemática', '1970-10-5'), 
    ('2', 'Camila', 'Português', '1991-09-7'), 
    ('3', 'Eduardo', 'Química', '1986-01-4'), 
    ('4', 'Ronaldo', 'Física', '1986-06-30'), 
    ('5', 'Erica', 'Ingles', '1975-07-16'), 
    ('6', 'Jonas', 'Geográfia', '1993-05-18'); 
 
DESCRIBE professor; 
 
SELECT * FROM professor; 
 
ALTER TABLE professor ADD COLUMN funcao VARCHAR(50), add constraint 
check_funcao CHECK (funcao IN ('monitor', 'assistente', 'titular')); 
     
UPDATE professor SET funcao = 'titular' WHERE idProfessor = '1'; 
UPDATE professor SET funcao = 'monitor' WHERE idProfessor = '2'; 
UPDATE professor SET funcao = 'assistente' WHERE idProfessor = '3'; 
UPDATE professor SET funcao = 'monitor' WHERE idProfessor = '4'; 
UPDATE professor SET funcao = 'assistente' WHERE idProfessor = '5'; 
UPDATE professor SET funcao = 'titular' WHERE idProfessor = '6'; 
 
INSERT INTO professor VALUES  
 ('7', 'Lucas', 'Matemática', '1983-11-11', 'titular'); 
     
DELETE FROM professor WHERE idProfessor = '5'; 
 
SELECT nome FROM professor WHERE funcao = 'titular'; 
SELECT especialidade, dtNascimento FROM professor WHERE funcao = 'monitor'; 
 
UPDATE professor SET dtNascimento = '1890-05-11' WHERE idProfessor = '3'; 
 
TRUNCATE TABLE professor; 
 
DROP TABLE professor; 
 
 -- EXERCICIO 5 
 
USE sprint1; 
 
CREATE TABLE curso( 
 idCurso INT PRIMARY KEY, 
    nome VARCHAR(50), 
    sigla CHAR(3), 
    coordenador VARCHAR(50) 
    ); 
     
INSERT INTO curso VALUES 
 ('1','Mátematica', 'MTC', 'Cintica'), 
 ('2', 'Português', 'PTG', 'Camila'), 
 ('3', 'Quimica', 'QMC', 'Sonia'); 
     
DESCRIBE curso; 
select * from curso; 
 
SELECT coordenador FROM curso; 
SELECT * FROM curso WHERE sigla = 'MTC'; 
SELECT * FROM curso ORDER BY nome ASC; 
SELECT * FROM curso ORDER BY coordenador DESC; 
SELECT * FROM curso WHERE nome LIKE 'm%'; 
SELECT * FROM curso WHERE nome LIKE '%a'; 
SELECT * FROM curso WHERE nome LIKE '_o%'; 
SELECT * FROM curso WHERE nome LIKE '%c_'; 
 
TRUNCATE TABLE curso; 
 
DROP TABLE curso; 
 
 -- EXERCICIO 6 
 
USE sprint1; 
 
CREATE TABLE revista ( 
 idRevista INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(40), 
    categoria VARCHAR(30) 
    ); 
     
INSERT INTO revista (nome) VALUES  
 ('Veja'), ('Isto é'), ('Epoca'), ('Quatro rodas'); 
     
SELECT * FROM revista; 
 
UPDATE revista SET categoria = 'Moda' WHERE idReveista = '1'; 
UPDATE revista SET categoria = 'Noticia' WHERE idRevista = '2'; 
UPDATE revista SET categoria = 'Tempo' WHERE idRevista = '3'; 
UPDATE revisra SET categoria = 'Mecânica' WHERE idRevista = '4'; 
 
SELECT * FROM revista; 
 
INSERT INTO revista VALUES 
 ('ABC', 'Alfabeto'), 
    ('123', 'Numérico'), 
    ('TRIGO', 'Fazenda'); 
     
SELECT * FROM revista; 
DESCRIBE revista; 
 
ALTER TABLE revista MODIFY COLUMN categoria VARCHAR(40); 
 
DESCRIBE revista; 
 
ALTER TABLE revista ADD COLUMN periodicidade VARCHAR(15); 
 
SELECT * FROM revista; 
 
ALTER TABLE revista DROP COLUMN periodicidade; 
     
TRUNCATE TABLE revista; 
 
DROP TABLE revista; 
 
 -- EXERCICIO 7 
 
USE sprint1; 
 
CREATE TABLE carro ( 
 idCarro INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(40), 
placa CHAR(7) 
) AUTO_INCREMENT = 1000; 
INSERT INTO carro (nome, placa) VALUES  
('Gol', '1293900'), 
('Fusca', '1384600'), 
('Onix', '1948650'), 
('HB20', '1292834'); 
DESCRIBE carro; 
SELECT * FROM carro; 
INSERT INTO carro (nome, placa) VALUES  
('Toyota', '1234545'), 
('Corola', '8765432'), 
('Uno', '5672134'); 
SELECT * FROM carro; 
DESCRIBE carro; 
ALTER TABLE carro MODIFY COLUMN nome VARCHAR(28); 
DESCRIBE carro; 
ALTER TABLE carro ADD COLUMN ano char(4); 
UPDATE carro SET ano = '1998' WHERE idCarro = '1000'; 
UPDATE carro SET ano = '1900' WHERE idCarro = '1001'; 
UPDATE carro SET ano = '2000' WHERE idCarro = '1002'; 
UPDATE carro SET ano = '1800' WHERE idCarro = '1003'; 
UPDATE carro SET ano = '1850' WHERE idCarro = '1005'; 
UPDATE carro SET ano = '2010' WHERE idCarro = '1006'; 
UPDATE carro SET ano = '2022' WHERE idCarro = '1007'; 
UPDATE carro SET placa = '193646' WHERE idCarro = '1008'; 
UPDATE carro SET placa = '283746' WHERE idCarro = '1009'; 
UPDATE carro SET placa = '825147' WHERE idCarro = '1010'; 
SELECT *FROM carro; 
TRUNCATE TABLE carro; 
DROP TABLE carro;