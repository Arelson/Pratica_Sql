--Buscando um aventureiro de um grupo especifico
SELECT nome, nível, classe 
FROM guildManeger.Aventureiro 
WHERE ID_grupo = 2; 

--Listando as missões aceitas pelo aventureiro ou grupo
SELECT A.Nome AS Aventureiro, G.Nome AS Grupo, M.Titulo AS Missao, AM.Data
FROM guildManeger.AceitaMissao AM
LEFT JOIN guildManeger.Aventureiro A ON AM.ID_avent = A.ID_avent
LEFT JOIN guildManeger.Grupo G ON AM.ID_grupo = G.ID_grupo
INNER JOIN guildManeger.Missao M ON AM.ID_missao = M.ID_missao
WHERE AM.ID_avent = 22 OR AM.ID_grupo = 2; 

--Listando as compras de um aventureiro
SELECT C.ID_compra, A.Nome AS Aventureiro, I.Nome AS Item, C.Quantidade, C.Data_compra
FROM guildManeger.Compra C
INNER JOIN guildManeger.Aventureiro A ON C.ID_avent = A.ID_avent
INNER JOIN guildManeger.Item I ON C.ID_item = I.ID_item
WHERE A.ID_avent = 11; 

--Listando todos os membros e os lideres de cada grupo
SELECT A.Nome AS Aventureiro, G.Nome AS Grupo, L.Nome AS Líder
FROM guildManeger.Aventureiro A
INNER JOIN guildManeger.Grupo G ON A.ID_grupo = G.ID_grupo
INNER JOIN guildManeger.Aventureiro L ON G.ID_líder = L.ID_avent
order by G.id_grupo asc
--where G.id_grupo = 2

--Mostrar todos os tratamentos feitos pelos curandeiros em um aventureiro
SELECT T.ID_tratamento, A.Nome AS Aventureiro, C.Nome AS Curandeiro, T.Tipo_tratamento, T.Data
FROM guildManeger.Tratamento T
INNER JOIN guildManeger.Aventureiro A ON T.ID_avent = A.ID_avent
INNER JOIN guildManeger.Curandeiro C ON T.ID_curandeiro = C.ID_curandeiro
WHERE C.ID_curandeiro = 4; 

--Buscando guildas com mais de tres missoes registradas
SELECT G.Nome AS Guilda, COUNT(M.ID_missao) AS Total_Missoes
FROM guildManeger.Missao M
INNER JOIN guildManeger.Guilda G ON M.ID_guilda = G.ID_guilda
GROUP BY G.Nome
HAVING COUNT(M.ID_missao) > 3;

--Validando a aceitação de missoes
CREATE OR REPLACE FUNCTION guildManeger.validar_aceita_missao()
RETURNS TRIGGER AS $$
BEGIN
    
    IF (NEW.ID_grupo IS NULL AND NEW.ID_avent IS NULL) THEN
        RAISE EXCEPTION 'Um grupo ou um aventureiro deve aceitar a missão!';
    END IF;

    IF (NEW.ID_grupo IS NOT NULL AND NEW.ID_lider IS NULL) THEN
        RAISE EXCEPTION 'Quando um grupo aceita a missão, o ID_lider deve ser preenchido!';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_validar_aceita_missao
BEFORE INSERT OR UPDATE ON guildManeger.AceitaMissao
FOR EACH ROW EXECUTE FUNCTION guildManeger.validar_aceita_missao();



