CREATE TABLE IF NOT EXISTS turma
(
	id_turma INT NOT NULL,
	codigo_turma VARCHAR (50) NOT NULL,
	nome_turma VARCHAR (50) NOT NULL,
	CONSTRAINT turma_pk PRIMARY KEY (id_turma)
);

CREATE TABLE IF NOT EXISTS aluno
(
	id_aluno INT NOT NULL, 
	nome_aluno VARCHAR (50) NOT NULL,
	aluno_alocado BOOLEAN NULL,
	id_turma INT NULL,
	CONSTRAINT aluno_pk PRIMARY KEY (id_aluno),
	CONSTRAINT turma_fk FOREIGN KEY (id_turma) REFERENCES projeto.turma (id_turma)
);