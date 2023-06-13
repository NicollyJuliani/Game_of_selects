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
    
INSERT INTO kratos VALUES
	(null, 95);
    
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


