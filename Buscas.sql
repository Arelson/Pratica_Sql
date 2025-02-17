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

--Listando a soma e media de ouro ganho nas missoes concluidas por cada aventureiro ou grupo
SELECT 
    am.id_avent,
    am.id_grupo,
    SUM(m.Recompensa) AS total_recompensa,
    ROUND(AVG(m.Recompensa), 2) AS media_recompensa
FROM guildManeger.AceitaMissao am
JOIN guildManeger.Missao m ON am.id_missao = m.id_missao
WHERE m.Status = 'Concluído'
GROUP BY am.id_avent, am.id_grupo;

--Listando os itens comprados pela guilda
SELECT 
    G.Nome AS Nome_Guilda,
    I.Nome AS Nome_Item,
    I.Tipo AS Tipo_Item,
    I.Preco AS Preço_Item,
    c.Quantidade AS Quantidade_Recebida,  
    F.Nome AS Nome_Fornecedor
FROM 
    guildManeger.recebeitem RI
JOIN 
    guildManeger.Item I ON RI.ID_item = I.ID_item
JOIN 
    guildManeger.Guilda G ON RI.ID_guilda = G.ID_guilda
JOIN 
    guildManeger.Fornece Fo ON I.ID_item = Fo.ID_item
JOIN 
    guildManeger.Fornecedor F ON Fo.ID_fornec = F.ID_fornec
join 
	guildManeger.compra c on i.id_item = c.id_item
WHERE 
    G.ID_guilda = 55; 
--listando os itens comprados pelo os aventureiros
SELECT 
    A.Nome AS Nome_Aventureiro,
    C.Quantidade AS Quantidade_Comprada,
    I.Nome AS Nome_Item,
    I.Preco AS Valor_Item
FROM 
    guildManeger.Compra C
JOIN 
    guildManeger.Aventureiro A ON C.ID_avent = A.ID_avent
JOIN 
    guildManeger.Item I ON C.ID_item = I.ID_item
WHERE 
    A.ID_avent = 22;  
--Cauculando o total de ouro gasto por um aventureiro
CREATE or replace FUNCTION guildManeger.TotalGastoAventureiro(idAvent INT) 
RETURNS NUMERIC AS $$
DECLARE 
    total_gasto NUMERIC := 0;
BEGIN
    SELECT COALESCE(SUM(i.Preco * c.Quantidade), 0)
    INTO total_gasto
    FROM guildManeger.Compra c
    JOIN guildManeger.Item i ON c.ID_item = i.ID_item
    WHERE c.ID_avent = idAvent;
    
    RETURN total_gasto;
END;
$$ LANGUAGE plpgsql;

SELECT guildManeger.TotalGastoAventureiro(22);

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



