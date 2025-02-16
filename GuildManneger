-- Criação das tabelas principais
create schema guildManeger

CREATE TABLE guildManeger.Aventureiro (
    ID_avent SERIAL PRIMARY KEY,
    ID_grupo INT,
    Nome VARCHAR(100) NOT NULL,
    Nível INT NOT NULL,
    Classe VARCHAR(50) NOT NULL,
    Ataque INT NOT NULL,
    HP INT NOT NULL,
    def_passiva INT,
    magia INT,
    atk_dist INT
);

alter table guildManeger.aventureiro
add constraint id_grupo
FOREIGN KEY (ID_grupo) REFERENCES guildManeger.Grupo(ID_grupo)

CREATE TABLE guildManeger.Grupo (
    ID_grupo SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_criação DATE NOT NULL,
    ID_líder INT,
    FOREIGN KEY (ID_líder) REFERENCES guildManeger.Aventureiro(ID_avent)
);

CREATE TABLE guildManeger.Missao (
    ID_missao SERIAL PRIMARY KEY,
    ID_guilda INT,
    Titulo VARCHAR(200) NOT NULL,
    Descricao TEXT NOT NULL,
    Recompensa NUMERIC(10,2) NOT NULL,
    Nivel_recomendado INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_guilda) REFERENCES guildManeger.Guilda(ID_guilda)
);

CREATE TABLE guildManeger.Guilda (
    ID_guilda SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nome_dono VARCHAR(100) NOT NULL
);

CREATE TABLE guildManeger.Fornecedor (
    ID_fornec SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Tipo_itens VARCHAR(100) NOT NULL
);

CREATE TABLE guildManeger.Igreja (
    ID_igreja SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nome_deus VARCHAR(100) NOT NULL
);

CREATE TABLE guildManeger.Item (
    ID_item SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Preco NUMERIC(10,2) NOT NULL,
    Estoque INT NOT NULL
);

CREATE TABLE guildManeger.Curandeiro (
    ID_curandeiro SERIAL PRIMARY KEY,
    ID_igreja INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_igreja) REFERENCES guildManeger.Igreja(ID_igreja)
);

-- Tabelas de relacionamentos
CREATE TABLE guildManeger.AceitaMissao (
    ID_grupo INT null,
    ID_lider INT null,
    ID_avent INT null,
    ID_missao INT NOT NULL,
    Data DATE NOT NULL, 
    ID serial PRIMARY KEY,
    FOREIGN KEY (ID_grupo) REFERENCES guildManeger.Grupo(ID_grupo),
    FOREIGN KEY (ID_lider) REFERENCES guildManeger.Aventureiro(ID_avent),
    FOREIGN KEY (ID_avent) REFERENCES guildManeger.Aventureiro(ID_avent),
    FOREIGN KEY (ID_missao) REFERENCES guildManeger.Missao(ID_missao)
);

CREATE TABLE guildManeger.Fornece (
    ID_fornec INT null,
    ID_igreja INT null,
    ID_item INT NOT NULL,
    ID serial PRIMARY KEY,
    Data_fornec DATE NOT NULL,
    FOREIGN KEY (ID_fornec) REFERENCES guildManeger.Fornecedor(ID_fornec),
    FOREIGN KEY (ID_igreja) REFERENCES guildManeger.Igreja(ID_igreja),
    FOREIGN KEY (ID_item) REFERENCES guildManeger.Item(ID_item),
);

CREATE TABLE guildManeger.Compra (
    ID_compra SERIAL PRIMARY KEY,
    ID_avent INT NOT NULL,
    ID_item INT NOT NULL,
    Quantidade INT NOT NULL,
    Data_compra DATE NOT NULL,
    FOREIGN KEY (ID_avent) REFERENCES guildManeger.Aventureiro(ID_avent),
    FOREIGN KEY (ID_item) REFERENCES guildManeger.Item(ID_item)
);

CREATE TABLE guildManeger.RecebeItem (
    ID_item INT NOT NULL,
    ID_guilda INT NOT NULL,
    FOREIGN KEY (ID_guilda) REFERENCES guildManeger.Guilda(ID_guilda),
    FOREIGN KEY (ID_item) REFERENCES guildManeger.Item(ID_item),
    PRIMARY KEY (ID_item, ID_guilda)
);

CREATE TABLE guildManeger.Tratamento (
    ID_tratamento SERIAL PRIMARY KEY,
    ID_avent INT NOT NULL,
    ID_curandeiro INT NOT NULL,
    Tipo_tratamento VARCHAR(100) NOT NULL,
    Data DATE NOT NULL,
    FOREIGN KEY (ID_avent) REFERENCES guildManeger.Aventureiro(ID_avent),
    FOREIGN KEY (ID_curandeiro) REFERENCES guildManeger.Curandeiro(ID_curandeiro)
);

CREATE TABLE guildManeger.Gerencia (
    ID_grupo INT  NULL,
    ID_lider INT  NULL,
    ID_avent INT not NULL,
    ID_guilda INT NOT NULL,
	id serial primary key,
    FOREIGN KEY (ID_grupo) REFERENCES guildManeger.Grupo(ID_grupo),
    FOREIGN KEY (ID_lider) REFERENCES guildManeger.Aventureiro(ID_avent),
    FOREIGN KEY (ID_avent) REFERENCES guildManeger.Aventureiro(ID_avent),
    FOREIGN KEY (ID_guilda) REFERENCES guildManeger.Guilda(ID_guilda)
);
