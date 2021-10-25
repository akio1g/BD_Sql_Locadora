use Locadora

alter table Estrela
add nome_real varchar(50)

alter table Filme
alter column titulo varchar(80)

INSERT INTO Filme(id, titulo, ano)
VALUES (1001, 'Whiplash', 2015),
	   (1002, 'Birdman', 2015),
       (1003, 'Interestelar', 2014),
	   (1004, 'A Culpa é das estrelas', 2014),
	   (1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014),
	   (1006, 'Sing', 2016)

INSERT INTO Estrela(id, nome, nome_real)
VALUES (9901, 'Michael Keaton', 'Michael John Douglas'),
	   (9902, 'Emma Stone', 'Emily Jean Stone'),
   	   (9903, 'Miles Teller', NULL),
	   (9904, 'Steve Carell', 'Steven John Carell'),
	   (9905, 'Jennifer Garner', 'Jennifer Anne Garner')

INSERT INTO Filme_Estrela(filmeid, estrelaid)
VALUES (1002, 9901),
	   (1002, 9902),
	   (1001, 9903),
       (1005, 9904),
	   (1005, 9905)


INSERT INTO DVD(num, data_fabricacao, filmeId)
VALUES (10001, '2020-12-02', 1001),
		(10002, '2019-10-18', 1002),
		(10003, '2020-04-03', 1003),
		(10004, '2020-12-02', 1001),
		(10005, '2019-10-18', 1004),
		(10006, '2020-04-03', 1002),
		(10007, '2020-12-02', 1005),
		(10008, '2019-10-18', 1002),
		(10009, '2020-04-03', 1003)

INSERT INTO Cliente(num_cadastro, nome, logradouro, num, cep)
VALUES (5501, 'Matilde Luz', 'Rua Síria', 150, '03086040'),
	(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110'),
	(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, NULL),
    (5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, NULL),
	(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')

INSERT INTO Locacao(dvdNum, clienteNum_Cadastro, data_locacao, data_devolucao, valor)
VALUES(10001, 5502,'2021-02-18', '2021-02-21', 3.50),
	  (10009, 5502, '2021-02-18', '2021-02-21', 3.50),
	  (10002, 5503, '2021-02-18', '2021-02-19', 3.50),
	  (10002, 5505, '2021-02-20', '2021-02-23', 3.00),
	  (10004, 5505, '2021-02-20', '2021-02-23', 3.00),
	  (10005, 5505, '2021-02-20', '2021-02-23', 3.00),
	  (10001, 5501, '2021-02-24', '2021-02-26', 3.50),
	  (10008, 5501, '2021-02-24', '2021-02-26', 3.50)

UPDATE Cliente	
	SET cep = '08411150'
	WHERE num_cadastro = '5503'

UPDATE Cliente
	SET cep = '02918190'
	WHERE num_cadastro = '5504'

UPDATE Locacao	
	SET valor = 3.25
	WHERE clienteNum_Cadastro = 5502 And data_locacao = '2021-02-18'

UPDATE Locacao	
	SET valor = 3.10
	WHERE clienteNum_Cadastro = 5501 And data_locacao = '2021-02-24'

UPDATE DVD	
	SET data_fabricacao = '2019-07-14'
	WHERE num = 10005

UPDATE Estrela	
	SET nome_real = 'Miles Alexander Teller'
	WHERE nome = 'Miles Teller'

DELETE FROM Filme
	WHERE titulo = 'Sing'


SELECT * FROM Filme 
	WHERE ano = 2014

SELECT id, ano from Filme
	WHERE titulo = 'Birdman'

SELECT id, ano 
	FROM Filme 
	WHERE titulo like '%plash' 

SELECT id, nome, nome_real 
    FROM Estrela 
	WHERE nome like 'Steve%'

SELECT filmeId,
	CONVERT(CHAR(10), data_fabricacao, 103) as fab
	FROM DVD
	WHERE data_fabricacao like '%2020%'

SELECT dvdNum, data_locacao, data_devolucao,
	valor, valor + 2 as 'valor com multa de acrescimo'
	FROM Locacao 
	WHERE clienteNum_Cadastro = 5505

SELECT logradouro, num, cep 
	FROM Cliente 
	WHERE nome = 'Matilde Luz'

SELECT nome_real 
	FROM Estrela 
		WHERE nome = 'Michael Keaton'

SELECT num_cadastro, nome, 
	logradouro+', '+ CAST(num as VARCHAR(5))+', '+cep as end_comp 
	FROM Cliente 
	WHERE num_cadastro >= 5503

