CREATE DATABASE gameOfSelects;
USE gameOfSelects;

CREATE TABLE personagem (
idPersonagem INT PRIMARY KEY auto_increment,
nomePersonagem VARCHAR(50),
tipoPersonagem VARCHAR(40),
poderPersonagem VARCHAR(45)
);


CREATE TABLE kratos (
idKratos INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
poderKratos VARCHAR(45)
);


CREATE TABLE arma (
idArma INT PRIMARY KEY auto_increment,
nomeArma VARCHAR(50),
tipoArma VARCHAR(40),
fkPersonagemArma INT,
fkKratosArma INT,
constraint fkPersonagem foreign key (fkPersonagemArma) references personagem (idPersonagem),
constraint fkKratos foreign key (fkKratosArma) references kratos (idKratos)
);


CREATE TABLE localBatalha (
idLocal INT PRIMARY KEY auto_increment,
nomeLocal VARCHAR(70),
nomeJogo VARCHAR(60)
);


CREATE TABLE batalha (
idBatalha INT auto_increment,
fkPersonagem INT, 
fkKratos INT,
fkLocal INT,
constraint fk1 foreign key (fkPersonagem) references personagem (idPersonagem),
constraint fk2 foreign key (fkKratos) references kratos (idKratos),
constraint fk3 foreign key (fkLocal) references localBatalha (idLocal),
constraint pk primary key (idBatalha, fkPersonagem, fkKratos, fkLocal)
);

INSERT INTO personagem VALUES
	(null, 'Ares', 'Deus', 45),
    (null, 'Athena', 'Deus', 40),
    (null, 'Theseus', 'Semi-Deus', 30),
    (null, 'Perseus', 'Semi-Deus', 35),
    (null, 'Icarus', 'Monstro', 30),
    (null, 'Poseidon', 'Deus', 75),
    (null, 'Hades', 'Deus', 80),
    (null, 'Helios', 'Deus', 60),
    (null, 'Hermes', 'Deus', 50),
    (null, 'Hércules', 'Semi-Deus', 65),
    (null, 'Hera', 'Deus', 50),
    (null, 'Cronos', 'Titã', 75),
    (null, 'Perses', 'Titan', 70),
    (null, 'Gaia', 'Titã', 85),
    (null, 'Zeus', 'Deus', 95);
    
    select * from personagem;
    
INSERT INTO kratos VALUES
	(null, 'Kratos', 95);
    
INSERT INTO arma VALUES
	(null, 'Lâmina do caos', 'Lâmina', null, 1),
    (null, 'Lâmina de atena', 'Lâmina', 2, null),
    (null, 'Lâmina do olimpo', 'Lâmina', 15, null),
	(null, 'Punhos de nemeio', 'Manopla', 10, null),
	(null, 'Lâmina do hades', 'Lâmina', 7, null),
	(null, 'Lâmina do exílio', 'Lâmina', null, null),
	(null, 'Botas do hermes', 'Bota', 9, null),
    (null, 'Cabeça de Helios', 'Parte do corpo', 8, null),
    (null, 'Manopla de Zeus', 'Manopla', null, 1);
    
INSERT INTO localBatalha VALUES
	(null, 'Coração de Gaia', 'God of War III'),
    (null, 'Costas da Gaia', 'God of War III'),
    (null, 'Submundo', 'God of War III'),
    (null, 'Monte Olimpo', 'God of War III'),
    (null, 'Atenas', 'God of War I'),
    (null, 'Submundo', 'God of War II');

select * from localBatalha;

INSERT INTO batalha VALUES
	(null, 1, 1, 5),
    (null, 2, 1, 5),
	(null, 3, 1, 4),
	(null, 4, 1, 5),
	(null, 5, 1, 6),
	(null, 6, 1, 2),
	(null, 7, 1, 3),
	(null, 8, 1, 4),
	(null, 9, 1, 4),
	(null, 10, 1, 4),
	(null, 11, 1, 4),
	(null, 12, 1, 4),
	(null, 13, 1, 4),
	(null, 14, 1, 4),
	(null, 15, 1, 1);

SELECT * FROM batalha;
-- Fácil
-- 1- Mostre o id e nome do personagem Ícaro.
SELECT idPersonagem, nomePersonagem FROM personagem WHERE nomePersonagem = 'ícarus';

-- Quais personagens tem o nome que começa com A
SELECT nomePersonagem FROM personagem WHERE nomePersonagem like 'A%';

-- 2 Quais personagens são deuses?
SELECT nomePersonagem FROM personagem WHERE tipoPersonagem = 'Deus';

-- 3 Mostre todos os nomes dos locais de batalha.
SELECT nomeLocal FROM localBatalha;

-- 4 Ordene o nome dos personagens em ordem decrescente.
SELECT nomePersonagem FROM personagem ORDER BY nomePersonagem;

-- 5 Ordene os Poderes em ordem crescente.
SELECT poderPersonagem FROM personagem ORDER BY poderPersonagem ASC;

-- 6 Selecione o nome dos personagens que começam com H e terminam com s.
SELECT nomePersonagem FROM personagem WHERE nomePersonagem LIKE 'H%s';

-- 7 Selecione os nomes dos personagens que tem poder igual a 75.
SELECT nomePersonagem FROM personagem WHERE poderPersonagem = 75;

-- 8 Ordene a tabela de armas por nome.
SELECT nomeArma FROM arma ORDER BY nomeArma;

-- 9  Atualize o poder de Zeus para 105. E em seguida mostre seu poder
UPDATE personagem SET poderPersonagem = 105 WHERE idPersonagem = 15 ;
SELECT poderPersonagem FROM personagem 	WHERE idPersonagem = 15;

-- 10 Mostre o nome das armas que são lâminas.
SELECT nomeArma FROM arma WHERE tipoArma = 'lâmina';

-- Mostre em quais jogos tem batalhas no submundo.
SELECT nomeJogo FROM  localBatalha WHERE nomeLocal = 'submundo';

-- - Mostre personagens que tem L no nome.
SELECT nomePersonagem FROM personagem WHERE nomePersonagem LIKE '%l%';

-- Mostre os nomes dos semi-deuses.
SELECT nomePersonagem FROM personagem WHERE tipoPersonagem = 'semi-deus';

--  Atualize o poder de Kratos para 150. E em seguida mostre seu poder 
UPDATE kratos SET poderKratos = 150 WHERE idKratos = 1;
SELECT poderKratos FROM kratos;

-- Médio
-- 1 Mostre o nome do personagem dono da arma Punhos de Nemeio.
SELECT nomePersonagem FROM personagem 
JOIN arma
ON fkPersonagemArma = idPersonagem
WHERE nomeArma = 'punhos de nemeio';

-- 2 Média de ponto de poderes.
SELECT AVG(poderPersonagem) FROM personagem;

-- 3 Mostre o maior poder dos heróis.
SELECT MAX(poderPersonagem) FROM personagem;

-- 4 Mostre o menor poder dos heróis.
SELECT MIN(poderPersonagem) FROM personagem;

-- 5 Mostre quantos personagens começam com a letra H na tabela personagem.
SELECT COUNT(nomePersonagem) FROM personagem 
WHERE nomePersonagem LIKE 'H%';

-- 6 Mostre quantas batalhas lutou o personagem Kratos. 
SELECT COUNT(idBatalha) FROM batalha WHERE fkKratos = 1;

-- 7 Mostre qual a arma do personagem Poseidon
SELECT nomeArma FROM arma 
JOIN personagem
ON fkPersonagemArma = idPersonagem 
WHERE fkPersonagemArma = 15;

-- 8 Mostre em qual batalha(id) lutou helios.
SELECT idBatalha FROM batalha
JOIN personagem
ON fkPersonagem = idPersonagem 
WHERE nomePersonagem = 'helios';

-- 9  Mostre o local onde krato e zeus lutaram.
SELECT nomeLocal
FROM batalha JOIN localBatalha 
	ON idLocal = fkLocal JOIN kratos
    ON idKratos = fkKratos JOIN personagem
    ON idPersonagem = fkPersonagem
    WHERE nomePersonagem = 'Zeus';
	
-- 10 Mostre as armas de Kratos.
SELECT nomeArma FROM arma 
JOIN kratos
ON fkKratosArma = idKratos;


-- Difícil 
-- 1  Mostre onde foi o id da batalha, nome do local, nome do Kratos e de Poseidon.
SELECT idBatalha, nomeLocal, nome, nomePersonagem
FROM batalha JOIN localBatalha 
	ON idLocal = fkLocal JOIN kratos
    ON idKratos = fkKratos JOIN personagem
    ON idPersonagem = fkPersonagem
    WHERE nomePersonagem = 'Poseidon';

-- 2  Mostre nome dos personagens e suas respectivas armas, incluindo quem não possui
SELECT nomePersonagem, nomeArma
FROM personagem LEFT JOIN arma
	ON idPersonagem = fkPersonagemArma;
    
-- 3 Mostre nome das armas e seus respectivos personagens, incluindo quem não possui
SELECT nomePersonagem, nomeArma
FROM personagem RIGHT JOIN arma
	ON idPersonagem = fkPersonagemArma;
    
-- 4 Mostre o nome do local da batalha entre o kratos e Cronos e a soma dos poderes de ambos, agrupados pelos nomes
SELECT nomeLocal, nome, nomePersonagem, SUM(personagem.poderPersonagem + kratos.poderKratos) as SomaDePoderes
FROM batalha
JOIN localBatalha ON idLocal = fkLocal
JOIN kratos ON idKratos = fkKratos
JOIN personagem ON idPersonagem = fkPersonagem
WHERE nomePersonagem = 'Cronos'
GROUP BY nomeLocal, nome, nomePersonagem;

-- 5 Mostre o nome do local da batalha entre o kratos e todos os personagens, cujo o poder seja seja menor do que a média de poder
SELECT nomeLocal, nome, nomePersonagem, poderPersonagem
FROM batalha JOIN localBatalha 
	ON idLocal = fkLocal JOIN kratos
    ON idKratos = fkKratos JOIN personagem
    ON idPersonagem = fkPersonagem
    WHERE poderPersonagem < (SELECT AVG(poderPersonagem) from personagem);
    
-- challenge
/*  Chegou a grande batalha final, se vc chegou até aqui é por que é um bom lutador, está preparado para maior batalha de todas??
Mostre id da batalha, o nome do local de batalha, nome do personagem, nome do Kratos, a diferença e a média entre o poder do kratos e seu oponente, onde o tipo de arma que só pode usar é Lâmina,
agrupado pelos nomes e ordenados pelo poder ~do personagem com o limit de 2 batalhas
 */
SELECT batalha.idBatalha, localBatalha.nomeLocal, personagem.nomePersonagem, kratos.nome AS nomeKratos, arma.nomeArma,
       personagem.poderPersonagem - kratos.poderKratos AS diferencaPoder, (SELECT AVG(personagem.poderPersonagem + kratos.poderKratos)  FROM personagem) AS poderMedioPersonagens,
       (SELECT COUNT(*) FROM batalha) AS totalBatalhasEpicas
FROM batalha
JOIN personagem ON batalha.fkPersonagem = personagem.idPersonagem
JOIN kratos ON batalha.fkKratos = kratos.idKratos
JOIN arma ON arma.fkPersonagemArma = personagem.idPersonagem 
JOIN localBatalha ON batalha.fkLocal = localBatalha.idLocal WHERE arma.tipoArma = 'Lâmina'
GROUP BY batalha.idBatalha, localBatalha.nomeLocal, personagem.nomePersonagem, kratos.nome, arma.nomeArma, personagem.poderPersonagem, kratos.poderKratos
ORDER BY personagem.poderPersonagem DESC
LIMIT 2;


-- 2 Mostre nome do personagem, o nome do local de batalha, o total de batalhas em que cada personagem participou e o poder total, que é a soma do poder do personagem e do poder de Kratos.
SELECT personagem.nomePersonagem, localBatalha.nomeLocal, COUNT(*) AS totalBatalhas, SUM(personagem.poderPersonagem + kratos.poderKratos) AS poderTotal
FROM batalha
JOIN personagem  ON batalha.fkPersonagem = personagem.idPersonagem
JOIN kratos  ON batalha.fkKratos = kratos.idKratos
JOIN localBatalha ON batalha.fkLocal = localBatalha.idLocal
WHERE batalha.fkKratos = (SELECT idKratos FROM kratos WHERE nome = 'Kratos')
GROUP BY personagem.nomePersonagem, localBatalha.nomeLocal;






    
    
    