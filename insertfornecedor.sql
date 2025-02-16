INSERT INTO guildManeger.Fornecedor (ID_fornec, Nome, Tipo_itens, Estoque) VALUES
(1, 'Xizzoth', 'Poções', 150),
(2, 'Belgold', 'Armas', 200),
(3, 'Naqwen', 'Armaduras', 180),
(4, 'Drusilla', 'Magias', 120),
(5, 'Bofo', 'Ervas', 100);

INSERT INTO guildManeger.Igreja (ID_igreja, Nome, Nome_deus) VALUES
(1, 'Igreja de Eris', 'Eris'),
(2, 'Igreja da Água', 'Água');

INSERT INTO guildManeger.Item (ID_item, Nome, Tipo, Preço, Estoque) VALUES
(1, 'Poção Sagrada', 'Poções', 100.00, 10),
(2, 'Espada de Fogo', 'Armas', 50.00, 30),
(3, 'Armadura de Ferro', 'Armaduras', 150.00, 20),
(4, 'Feitiço de Cura', 'Magias', 75.00, 40),
(5, 'Erva de Eris', 'Ervas', 15.50, 100);
INSERT INTO guildManeger.Item (ID_item, Nome, Tipo, Preço, Estoque) VALUES
(6, 'Cajado de Ferro', 'Armas', 120.00, 40),
(7, 'Capacete de Aço', 'Armaduras', 75.00, 30),
(8, 'Escudo de Madeira', 'Armaduras', 50.00, 60),
(9, 'Poção de Defesa', 'Poções', 30.00, 80),
(10, 'Pá de Ferro', 'Ferramentas', 25.00, 100);

INSERT INTO guildManeger.fornece (id_fornec, id_igreja, id_item, data_fornec, Estoque) VALUES
(null, 1, 1, '2025-02-16', 50),
(2, null, 2, '2025-02-16', 75),
(3, null, 3, '2025-02-16', 60),
(null, 2, 4, '2025-02-16', 90),
(null, 1, 5, '2025-02-16', 120);

