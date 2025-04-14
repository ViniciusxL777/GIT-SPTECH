-- EXERCICIO 1 
 
CREATE DATABASE sprint1; 
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
    ('4', 'João', 'Basquete', '2'); 
 
DESCRIBE atleta; 
 
SHOW TABLES; 
     
SELECT * FROM atleta; 
 
SELECT nome, qtdMedalha FROM atleta; 
 
SELECT * FROM atleta WHERE modalidade = 'futebol'; 
 
SELECT * FROM atleta ORDER BY modalidade ASC; 
 
SELECT * FROM atleta ORDER BY qtdMedalha DESC; 
 
SELECT * FROM atleta WHERE nome LIKE '%s%'; 
  
SELECT * FROM atleta WHERE nome LIKE 'V_'; 
 
SELECT * FROM atleta WHERE nome LIKE '_o'; 
 
SELECT * FROM atleta WHERE nome LIKE 'r_'; 
 
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
  
 SELECT titulo, artista FROM musica; 
  
 SELECT * FROM musica WHERE genero = 'gospel'; 
  
 SELECT * FROM musica WHERE artista = 'Aline Barros'; 
  
 SELECT * FROM musica ORDER BY titulo ASC; 
  
 SELECT * FROM musica ORDER BY artista DESC; 
  
 SELECT * FROM musica WHERE titulo LIKE 'o%'; 
  
 SELECT * FROM musica WHERE artistas LIKE '%s'; 
  
 SELECT * FROM musica WHERE genero LIKE '_h%'; 
  
 SELECT * FROM musica WHERE titulo LIKE '%i_'; 
  
 DROP TABLE musica; 
  
  
 -- EXERCICIO 3 
  
 USE sprint1; 
  
 CREATE TABLE filme ( 
 idFilme INT PRIMARY KEY, 
    titulo VARCHAR(40), 
    genero VARCHAR(40), 
    diretor VARCHAR(40) 
    ); 
     
INSERT INTO filme VALUES 
 ('1', 'O Poderoso Chefão', 'Crime, Drama', 'Francis Ford Coppola'), 
    ('2', 'Parasita', 'Comédia, Drama, Thriller', 'Bong Joon-ho'), 
    ('3', 'Interestelar', 'Aventura, Drama, Ficção científica', 'Christopher Nolan'), 
    ('4', 'O Senhor dos Anéis: A Sociedade do Anel', 'Aventura, Drama, Fantasia', 'Peter 
Jackson'), 
    ('5', 'Pulp Fiction', 'Crime, Drama', 'Quentin Tarantino'), 
    ('6', 'A Origem', 'Ação, Aventura, Ficção científica', 'Christopher Nolan'), 
    ('7', 'A Vida é Bela', 'Comédia, Drama', 'Roberto Benigni'); 
     
DESCRIBE filme; 
 
SHOW TABLES; 
 
SELECT titulo, diretor FROM filme; 
 
SELECT * FROM filme WHERE diretor = 'Christopher Nolan'; 
 
SELECT * FROM filme ORDER BY titulo ASC; 
 
SELECT * FROM filme ORDER BY diretor DESC; 
 
SELECT * FROM filme WHERE titulo LIKE 'a%'; 
 
SELECT * FROM filme WHERE diretor LIKE '%n'; 
 
SELECT * FROM filme WHERE genero LIKE '_h%'; 
 
SELECT * FROM filme WHERE titulo LIKE '%o_'; 
 
DROP TABLE filme; 
 
 -- EXERCICIO 4 
 
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
 
SHOW TABLES; 
 
SELECT * FROM professor; 
 
SELECT especialidade FROM professor; 
 
SELECT * FROM professor WHERE especialidade = 'Matemática'; 
 
SELECT * FROM professor ORDER BY nome ASC; 
 
SELECT * FROM professor ORDER BY dtNascimento DESC; 
 
SELECT * FROM professor WHERE nome LIKE 'C%'; 
 
SELECT * FROM professor WHERE nome LIKE '%a'; 
 
SELECT * FROM professor WHERE nome LIKE '_d%'; 
 
SELECT * FROM professor WHERE nome LIKE '%i_'; 
 
DROP TABLE professor; 
 
 -- EXERCICIO 5 
 
USE sprint1; 
 
CREATE TABLE jogo ( 
 idJogo INT PRIMARY KEY, 
 nome VARCHAR(50), 
 comentario VARCHAR(400), 
 ranking INT 
 ); 
     
INSERT INTO jogo VALUES  
  ('1', 'The Legend of Zelda: Tears of the Kingdom', 'Continuação de "Breath of 
the Wild", o novo jogo da franquia Zelda traz mais exploração, enigmas e mecânicas 
inovadoras com um mundo aberto ainda mais vasto e interativo. A história continua a 
envolver Link em sua luta para salvar Hyrule', '10'), 
('2', 'God of War Ragnarök', 'A sequência de "God of War" (2018) segue a 
jornada de Kratos e Atreus, agora enfrentando os eventos que antecedem o Ragnarok. A 
jogabilidade é intensa, e os gráficos são impressionantes, fazendo dele um dos maiores 
sucessos do ano', '9'), 
('3', 'Elden Ring', 'Este RPG de ação da FromSoftware se destaca pela 
liberdade que oferece ao jogador, com um mundo aberto, combates desafiadores e uma 
narrativa envolvente. A colaboração com George R.R. Martin deixou muitos fãs 
empolgados', '9'), 
('4', 'Horizon Forbidden West', 'Continuação de "Horizon Zero Dawn", esse 
jogo melhora a fórmula com novos inimigos robóticos, visuais deslumbrantes e um enredo 
que aprofunda a história de Aloy. A exploração de novos territórios e biomas é uma das 
melhores partes do jogo', '8'), 
('5', 'Call of Duty: Modern Warfare II', 'O retorno ao estilo de "Modern Warfare" 
com gráficos de ponta e uma narrativa intensa mantém a franquia relevante. Embora o 
modo multiplayer seja o destaque, o modo campanha também é muito apreciado pelos fãs', 
'8'); 
DESCRIBE jogo; 
SHOW TABLES; 
SELECT * FROM jogo; 
SELECT nome FROM jogo; 
SELECT comentario FROM jogo WHERE idJogo = '1'; 
SELECT * FROM jogo ORDER BY nome ASC; 
SELECT * FROM jogo ORDER BY ranking DESC; 
SELECT * FROM jogo WHERE nome LIKE 'c%'; 
SELECT * FROM jogo WHERE nome LIKE '%g'; 
SELECT * FROM jogo WHERE nome LIKE '_o%'; 
SELECT * FROM jogo WHERE nome LIKE '%s_'; 
SELECT * FROM jogo WHERE nome != 'MINECRAFT'; 
DROP TABLE jogo;