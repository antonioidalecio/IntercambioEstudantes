DROP DATABASE IF EXISTS intercambioestudantes;

CREATE DATABASE IF NOT EXISTS intercambioestudantes;

USE intercambioestudantes;

CREATE TABLE IF NOT EXISTS Endereco (
	IdEndereco		INT(10)			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	Logradouro		VARCHAR(50)		NOT NULL,
	Complemento		VARCHAR(40)		NOT NULL,
	Bairro			VARCHAR(50)		NOT NULL,
	CEP				VARCHAR(9)		NOT NULL,
	Numero			INT(10)			NOT NULL,
	Pais			VARCHAR(50)		NOT NULL,
	Estado			VARCHAR(50)		NOT NULL,
	Cidade			VARCHAR(50)		NOT NULL
);

CREATE TABLE IF NOT EXISTS Estudante (
    ImagemPath			    VARCHAR(250),
	Nome	 				VARCHAR(100)	NOT NULL,
	DataNascimento        	VARCHAR(10) 	NOT NULL,
	Sexo					CHAR(1)			NOT NULL,
	CPF                     VARCHAR(15)		NOT NULL	PRIMARY KEY,
	IdEndereco				INT(10)			NOT NULL,
	Telefone				VARCHAR(15)		NOT NULL,
	Email					VARCHAR(40),
	Bolsista				BOOLEAN			NOT NULL,
	
	FOREIGN KEY(IdEndereco) REFERENCES Endereco(IdEndereco) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE IF NOT EXISTS Instituicao (
	IdInstituicao		INT(10)			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	NomeInstituicao		VARCHAR(50)		NOT NULL,
	Telefone			VARCHAR(15)		NOT NULL,
	IdEndereco			INT(10)			NOT NULL,

	FOREIGN KEY(IdEndereco) REFERENCES Endereco(IdEndereco) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Curso (
	
	IdCurso				INT(10)			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	IdInstituicao		INT(10) 		NOT NULL,
	Idioma				VARCHAR(50) 	NOT NULL,
	Nivel				VARCHAR(20)		NOT NULL,
	DataInicio			VARCHAR(10)		NOT NULL,
	DataTermino			VARCHAR(10)		NOT NULL,
	DiasSemana			VARCHAR(100)	NOT NULL,
	Valor				REAL			NOT NULL,	
	Descricao			VARCHAR(250),	

	FOREIGN KEY(IdInstituicao) REFERENCES Instituicao(IdInstituicao) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Intercambio (
	
	IdIntercambio		INT(10)		NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	IdCurso				INT(10)		NOT NULL,
	CpfEstudante		VARCHAR(15)	NOT NULL,

	FOREIGN KEY (IdCurso) 			REFERENCES Curso(IdCurso) 				ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CpfEstudante) 		REFERENCES Estudante(CPF) 				ON DELETE CASCADE ON UPDATE CASCADE
);