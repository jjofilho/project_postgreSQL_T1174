#Questão 7 - a
INSERT INTO turma (id_turma, codigo_turma, nome_turma) VALUES
(1, 'DS-PY-001', 'Lógica de Programção'),
(2, 'DS-PY-002', 'Técnicas de Programação'),
(3, 'DS-PY-003', 'Banco de Dados'),
(4, 'DS-PY-004', 'Estatística'),
(5, 'DS-PY-005', 'Machine Learning I'),
(6, 'DS-PY-006', 'Machine Learning II'),
(7, 'DS-PY-007', 'Projeto Final Trilha DS');

#Questão 7 - b, c
INSERT INTO aluno (id_aluno, nome_aluno, aluno_alocado, id_turma) VALUES
(1, 'Bruno Trindade', True, 7),
(2, 'André Filipe', True, 1),
(3, 'Diogo Paulista', True, 4),
(4, 'Flanderson Ciclista', null, null),
(5, 'Giovana Student', null, null),
(6, 'João Neurodivergente', True, 3),
(7, 'Rafael Bit', True, 4),
(8, 'Luiza Simões', True, 2),
(9, 'Gleidson Cloud', null, null),
(10, 'BB Mendes', null, null),
(11, 'Iuri Aprovado', True, 2),
(12, 'Gabriel Alencar', True, 1),
(13, 'Gabriel Maio', True, 2),
(14, 'Gabriel Mack', True, 3),
(15, 'Zibia Advogada', null, null),
(16, 'Emmanuella English', null, null),
(17, 'Manuela Sodré', null, null),
(18, 'Victor Galves', True, 3),
(19, 'Jaqueline Advogada', True, 1),
(20, 'Antonino Barria', null, null),
(21, 'André Médico', True, 5),
(22, 'José Posdoc', True, 6),
(23, 'Matheus Bandeira', null, null),
(24, 'Fernanda Nkos', null, null),
(25, 'Joelson Silva', null, null);
