INSERT INTO guildManeger.Curandeiro (ID_curandeiro, ID_igreja, Nome, Especialidade) VALUES
(1, 1, 'Eldrin', 'Doenças'),
(2, 2, 'Morgana', 'Feridas'),
(3, 1, 'Therion', 'Envenenamentos'),
(4, 2, 'Selene', 'Maldições'),
(5, 1, 'Gaius', 'Cirurgias'),
(6, 2, 'Lyria', 'Doenças'),
(7, 1, 'Draven', 'Feridas'),
(8, 2, 'Nyx', 'Envenenamentos'),
(9, 1, 'Orin', 'Maldições'),
(10, 2, 'Valeria', 'Cirurgias');

INSERT INTO guildManeger.Tratamento (ID_tratamento, ID_avent, ID_curandeiro, Tipo_tratamento, Data) VALUES
(1, 1, 1, 'Doenças', '2001-03-15'),
(2, 2, 2, 'Feridas', '2003-07-22'),
(3, 1, 3, 'Envenenamentos', '2005-11-10'),
(4, 2, 4, 'Maldições', '2007-05-30'),
(5, 1, 5, 'Cirurgias', '2010-09-18'),
(6, 2, 6, 'Doenças', '2012-02-25'),
(7, 1, 7, 'Feridas', '2014-08-07'),
(8, 2, 8, 'Envenenamentos', '2016-12-13'),
(9, 1, 9, 'Maldições', '2018-06-05'),
(10, 2, 10, 'Cirurgias', '2020-10-29'),
(11, 1, 1, 'Doenças', '2022-04-17'),
(12, 2, 2, 'Feridas', '2024-07-09'),
(13, 1, 3, 'Envenenamentos', '2026-01-31'),
(14, 2, 4, 'Maldições', '2028-09-14'),
(15, 1, 5, 'Cirurgias', '2030-12-05');