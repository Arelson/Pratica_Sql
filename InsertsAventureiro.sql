INSERT INTO guildManeger.Aventureiro (id_avent, id_grupo, nome, nível, classe, ataque, hp, def_passiva, magia, atk_dist) VALUES
    -- Grupo 1
    (1, 1, 'Kael, o Relâmpago', 10, 'Guerreiro', 80, 200, 50, NULL, NULL),
    (2, 1, 'Sylva, a Tempestuosa', 12, 'Mago', 40, 150, NULL, 100, NULL),
    (3, 1, 'Thalor, Olho de Águia', 8, 'Patrulheiro', 60, 120, NULL, NULL, 90),
    
    -- Grupo 2
    (4, 2, 'Nyx, a Sombria', 11, 'Guerreiro', 90, 140, 30, NULL, NULL),
    (5, 2, 'Darian, Lâmina Silenciosa', 13, 'Patrulheiro', 85, 130, NULL, NULL, 75),
    (6, 2, 'Seraph, o Desaparecido', 9, 'Mago', 50, 110, NULL, 120, NULL),

    -- Grupo 3
    (7, 3, 'Drakar, o Incendiário', 14, 'Mago', 60, 170, NULL, 140, NULL),
    (8, 3, 'Liora, a Guardiã', 16, 'Guerreiro', 75, 260, 90, NULL, NULL),
    (9, 3, 'Korrin, Punho de Ferro', 12, 'Guerreiro', 80, 200, 60, NULL, NULL),

    -- Grupo 4
    (10, 4, 'Selene, a Ilusora', 11, 'Mago', 50, 160, NULL, 110, NULL),
    (11, 4, 'Orin, o Andarilho', 7, 'Mago', 40, 150, NULL, 100, NULL),
    (12, 4, 'Bryn, o Caçador', 8, 'Patrulheiro', 65, 140, NULL, NULL, 85),

    -- Grupo 5
    (13, 5, 'Ardyn, o Renegado', 12, 'Guerreiro', 85, 190, 60, NULL, NULL),
    (14, 5, 'Naia, a Viajante', 9, 'Mago', 45, 130, NULL, 80, NULL),
    (15, 5, 'Garrik, o Intrépido', 11, 'Guerreiro', 80, 200, 55, NULL, NULL),

    (16, 1, 'Bran, o Inquebrável', 15, 'Guerreiro', 70, 250, 80, NULL, NULL),
    (17, 2, 'Zekar, o Impiedoso', 14, 'Guerreiro', 100, 180, 40, NULL, NULL),
    (18, 3, 'Mavros, o Devoto', 10, 'Mago', 45, 180, NULL, 90, NULL),
    (19, 4, 'Vex, o Imprudente', 13, 'Guerreiro', 95, 170, 50, NULL, NULL),
    (20, 5, 'Torin, o Ferreiro', 10, 'Guerreiro', 75, 220, 80, NULL, NULL),

    
    (21, NULL, 'Vance, o Solitário', 8, 'Guerreiro', 70, 150, 45, NULL, NULL),
    (22, NULL, 'Luthar, o Exilado', 10, 'Guerreiro', 85, 180, 50, NULL, NULL),
    (23, NULL, 'Zira, a Víbora', 9, 'Patrulheiro', 80, 140, NULL, NULL, 55),
    (24, NULL, 'Felix, o Nômade', 7, 'Mago', 40, 130, NULL, 110, NULL),
    (25, NULL, 'Isolde, a Peregrina', 11, 'Mago', 50, 170, NULL, 120, NULL);

    INSERT INTO guildManeger.Grupo (id_grupo, nome, data_criacao, id_líder) VALUES
    (1, 'Lâminas do Amanhecer', '2024-01-15', null),  -- Kael, o Relâmpago
    (2, 'Sombras da Meia-Noite', '2024-02-20', null),  -- Nyx, a Sombria
    (3, 'Chama Eterna', '2024-03-10', null),          -- Drakar, o Incendiário
    (4, 'Guardas Celestiais', '2024-04-05', null),  -- Selene, a Ilusora
    (5, 'Caçadores do Destino', '2024-05-18', null); -- Ardyn, o Renegado