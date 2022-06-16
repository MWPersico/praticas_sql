-- Criando e utilizando o banco de dados 'eletromarc'
CREATE DATABASE eletromarc;

USE eletromarc;

-- Criação da tabela Cliente
CREATE TABLE Cliente(
	idCliente smallint NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    telefone varchar(15) NOT NULL,
    CPF varchar(11) NOT NULL,
    senha varchar(20) NOT NULL,
    PRIMARY KEY (idCliente)
);

-- Criação da tabela 'Parceria'
CREATE TABLE Parceria(
	idParceria smallint NOT NULL AUTO_INCREMENT,
    CNPJ varchar(15) NOT NULL,
    endereco varchar(300) NOT NULL,
    telefone varchar(15) NOT NULL,
    email varchar(100),
    PRIMARY KEY (idParceria)
);
-- Esqueci o NOT NULL alí em cima ^^
ALTER TABLE Parceria 
MODIFY email varchar(100) NOT NULL;

SHOW CREATE TABLE Parceria;

-- Criação da tabela 'Usuario'
CREATE TABLE Usuario(
	idUsuario smallint NOT NULL AUTO_INCREMENT,
    Cliente_idCliente smallint NOT NULL,
    Parceria_idParceria smallint NOT NULL,
    login varchar(50) NOT NULL,
    senha varchar(20) NOT NULL,
    tipo varchar(20) NOT NULL,
    PRIMARY KEY (idUsuario)
);

-- Criação da tabela 'Orçamento'
CREATE TABLE Orcamento(
	idOrcamento smallint NOT NULL AUTO_INCREMENT,
    Cliente_idCliente smallint NOT NULL,
    dia date NOT NULL,
    hora time NOT NULL,
    tipo varchar(100) NOT NULL,
    descricao varchar(1000) NOT NULL,
    endereco varchar(300) NOT NULL,
    valor_estimado float,
    PRIMARY KEY (idOrcamento)
);

-- Criação da tabela 'Feedback'
CREATE TABLE Feedback(
	idFeedback smallint NOT NULL AUTO_INCREMENT,
    Usuario_idUsuario smallint NOT NULL,
    avaliacao float NOT NULL,
    foto_URL varchar(500),
    recomendacao varchar(300) NOT NULL,
    PRIMARY KEY (idFeedback)
);

-- Criação da tabela 'Suporte'
CREATE TABLE Suporte(
	idSuporte smallint NOT NULL AUTO_INCREMENT,
    Usuario_idUsuario smallint NOT NULL,
    problema varchar(500) NOT NULL,
    sugestao varchar(500),
    PRIMARY KEY (idSuporte)
);

-- Declarando as chaves estrangeiras:
ALTER TABLE Orcamento
 ADD FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente);

ALTER TABLE Feedback
 ADD FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario);

ALTER TABLE Suporte
 ADD FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario);

ALTER TABLE Usuario
 ADD FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
 ADD FOREIGN KEY (Parceria_idParceria) REFERENCES Parceria(idParceria);
 
-- Inserindo alguns dados no banco de dados:
INSERT INTO Cliente (nome, email, telefone, CPF, senha) VALUES
 ('Marcos', 'willian.marcos7@hotmail.com', '123456789', '1234567891X', 'senha'),
 ('Jeferson', 'jeffim.fanti@email.con', '987654321', '9876543219X', 'password');

-- Exibindo os dados da tabela:
SELECT * FROM Cliente;