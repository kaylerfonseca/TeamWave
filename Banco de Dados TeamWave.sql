-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS db_teamwave;

USE db_teamwave;

CREATE TABLE tb_perfil (
    cd_perfil INT NOT NULL,
    nm_perfil VARCHAR(30) NOT NULL,

    CONSTRAINT pk_perfil PRIMARY KEY (cd_perfil)
);

CREATE TABLE tb_usuario (
    cd_usuario INT NOT NULL AUTO_INCREMENT,
    nm_usuario VARCHAR(100) NOT NULL,
    nm_email VARCHAR(150) NOT NULL,
    ds_hash_senha VARCHAR(255) NOT NULL,
    cd_telefone VARCHAR(20),
    cd_cpf CHAR(11) NOT NULL,
    dt_nascimento DATE NOT NULL,
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    cd_perfil INT NOT NULL,

    CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario),
    CONSTRAINT uk_usuario_email UNIQUE (nm_email),
    CONSTRAINT uk_usuario_cpf UNIQUE (cd_cpf),

    CONSTRAINT fk_usuario_perfil FOREIGN KEY (cd_perfil)
        REFERENCES tb_perfil (cd_perfil)
);

CREATE TABLE tb_tipo_fundo (
    cd_tipo_fundo INT NOT NULL,
    nm_tipo_fundo VARCHAR(20) NOT NULL,

    CONSTRAINT pk_tipo_fundo PRIMARY KEY (cd_tipo_fundo)
);

CREATE TABLE tb_quadro (
    cd_quadro INT NOT NULL AUTO_INCREMENT,
    nm_quadro VARCHAR(45) NOT NULL,
    nm_categoria VARCHAR(45) NOT NULL,
    cd_tipo_fundo INT NOT NULL,
    ds_cor_fundo CHAR(7),
    ds_url_fundo VARCHAR(2048),
    im_fundo LONGBLOB,
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    dt_modificacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_quadro PRIMARY KEY (cd_quadro),

    CONSTRAINT fk_quadro_tipo_fundo FOREIGN KEY (cd_tipo_fundo)
        REFERENCES tb_tipo_fundo (cd_tipo_fundo)
);

CREATE TABLE tb_quadro_participante (
    cd_quadro INT NOT NULL,
    cd_usuario INT NOT NULL,
    dt_entrada DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_quadro_participante
        PRIMARY KEY (cd_quadro, cd_usuario),

    CONSTRAINT fk_quadro_participante_quadro
        FOREIGN KEY (cd_quadro)
        REFERENCES tb_quadro (cd_quadro),

    CONSTRAINT fk_quadro_participante_usuario
        FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE tb_quadro_favorito (
    cd_usuario INT NOT NULL,
    cd_quadro INT NOT NULL,
    dt_favoritado DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_quadro_favorito
        PRIMARY KEY (cd_usuario, cd_quadro),

    CONSTRAINT fk_favorito_usuario
        FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario),

    CONSTRAINT fk_favorito_quadro
        FOREIGN KEY (cd_quadro)
        REFERENCES tb_quadro (cd_quadro)
);

CREATE TABLE tb_status_tarefa (
    cd_status INT NOT NULL,
    nm_status VARCHAR(45) NOT NULL,

    CONSTRAINT pk_status_tarefa PRIMARY KEY (cd_status)
);

CREATE TABLE tb_prioridade (
    cd_prioridade INT NOT NULL,
    nm_prioridade VARCHAR(20) NOT NULL,

    CONSTRAINT pk_prioridade PRIMARY KEY (cd_prioridade)
);

CREATE TABLE tb_tarefa (
    cd_tarefa INT NOT NULL AUTO_INCREMENT,
    nm_tarefa VARCHAR(150) NOT NULL,
    ds_tarefa TEXT,
    ds_detalhes TEXT,
    dt_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    dt_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dt_prazo DATETIME,
    qt_ordem INT NOT NULL,
    cd_quadro INT NOT NULL,
    cd_status INT NOT NULL,
    cd_prioridade INT NOT NULL,

    CONSTRAINT pk_tarefa PRIMARY KEY (cd_tarefa),
    CONSTRAINT uk_tarefa_quadro UNIQUE (cd_tarefa, cd_quadro),

    CONSTRAINT fk_tarefa_quadro FOREIGN KEY (cd_quadro)
        REFERENCES tb_quadro (cd_quadro),

    CONSTRAINT fk_tarefa_status FOREIGN KEY (cd_status)
        REFERENCES tb_status_tarefa (cd_status),

    CONSTRAINT fk_tarefa_prioridade FOREIGN KEY (cd_prioridade)
        REFERENCES tb_prioridade (cd_prioridade)
);

CREATE TABLE tb_tarefa_responsavel (
    cd_tarefa INT NOT NULL,
    cd_quadro INT NOT NULL,
    cd_usuario INT NOT NULL,

    CONSTRAINT pk_tarefa_responsavel
        PRIMARY KEY (cd_tarefa, cd_usuario),

    CONSTRAINT fk_tarefa_responsavel_tarefa
        FOREIGN KEY (cd_tarefa, cd_quadro)
        REFERENCES tb_tarefa (cd_tarefa, cd_quadro),

    CONSTRAINT fk_tarefa_responsavel_participante
        FOREIGN KEY (cd_quadro, cd_usuario)
        REFERENCES tb_quadro_participante (cd_quadro, cd_usuario)
);

CREATE TABLE tb_checklist (
    cd_checklist INT NOT NULL AUTO_INCREMENT,
    cd_tarefa INT NOT NULL,
    nm_item VARCHAR(160) NOT NULL,
    ic_concluido TINYINT(1) NOT NULL,
    qt_ordem INT NOT NULL,

    CONSTRAINT pk_checklist PRIMARY KEY (cd_checklist),

    CONSTRAINT fk_checklist_tarefa FOREIGN KEY (cd_tarefa)
        REFERENCES tb_tarefa (cd_tarefa)
);

CREATE TABLE tb_comentario_tarefa (
    cd_comentario INT NOT NULL AUTO_INCREMENT,
    cd_tarefa INT NOT NULL,
    cd_usuario INT NOT NULL,
    ds_comentario TEXT NOT NULL,
    dt_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_comentario_tarefa PRIMARY KEY (cd_comentario),

    CONSTRAINT fk_comentario_tarefa FOREIGN KEY (cd_tarefa)
        REFERENCES tb_tarefa (cd_tarefa),

    CONSTRAINT fk_comentario_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE tb_tipo_conversa (
    cd_tipo_conversa INT NOT NULL,
    nm_tipo_conversa VARCHAR(20) NOT NULL,

    CONSTRAINT pk_tipo_conversa PRIMARY KEY (cd_tipo_conversa)
);

CREATE TABLE tb_conversa (
    cd_conversa INT NOT NULL AUTO_INCREMENT,
    nm_conversa VARCHAR(100) NOT NULL,
    cd_tipo_conversa INT NOT NULL,
    dt_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_conversa PRIMARY KEY (cd_conversa),

    CONSTRAINT fk_conversa_tipo FOREIGN KEY (cd_tipo_conversa)
        REFERENCES tb_tipo_conversa (cd_tipo_conversa)
);

CREATE TABLE tb_conversa_participante (
    cd_participante INT NOT NULL AUTO_INCREMENT,
    cd_conversa INT NOT NULL,
    cd_usuario INT NOT NULL,

    CONSTRAINT pk_conversa_participante PRIMARY KEY (cd_participante),
    CONSTRAINT uk_usuario_conversa UNIQUE (cd_usuario, cd_conversa),

    CONSTRAINT fk_participante_conversa FOREIGN KEY (cd_conversa)
        REFERENCES tb_conversa (cd_conversa),

    CONSTRAINT fk_participante_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE tb_mensagem (
    cd_mensagem INT NOT NULL AUTO_INCREMENT,
    cd_participante INT NOT NULL,
    cd_mensagem_resposta INT,
    ds_mensagem TEXT,
    ds_mensagem_citada TEXT,
    dt_envio DATETIME DEFAULT CURRENT_TIMESTAMP,
    dt_edicao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ic_fixada TINYINT(1) NOT NULL,

    CONSTRAINT pk_mensagem PRIMARY KEY (cd_mensagem),

    CONSTRAINT fk_mensagem_participante FOREIGN KEY (cd_participante)
        REFERENCES tb_conversa_participante (cd_participante),

    CONSTRAINT fk_mensagem_resposta FOREIGN KEY (cd_mensagem_resposta)
        REFERENCES tb_mensagem (cd_mensagem)
);

CREATE TABLE tb_mensagem_favorito (
    cd_usuario INT NOT NULL,
    cd_mensagem INT NOT NULL,
    dt_favoritado DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_mensagem_favorito
        PRIMARY KEY (cd_usuario, cd_mensagem),

    CONSTRAINT fk_mensagem_favorito_usuario
        FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario),

    CONSTRAINT fk_mensagem_favorito_mensagem
        FOREIGN KEY (cd_mensagem)
        REFERENCES tb_mensagem (cd_mensagem)
);

CREATE TABLE tb_contexto_arquivo (
    cd_contexto_arquivo INT NOT NULL,
    nm_contexto VARCHAR(20) NOT NULL,

    CONSTRAINT pk_contexto_arquivo PRIMARY KEY (cd_contexto_arquivo)
);

CREATE TABLE tb_local_anexo_tarefa (
    cd_local_anexo INT NOT NULL,
    nm_local_anexo VARCHAR(20) NOT NULL,

    CONSTRAINT pk_local_anexo_tarefa PRIMARY KEY (cd_local_anexo)
);

CREATE TABLE tb_arquivo (
    cd_arquivo INT NOT NULL AUTO_INCREMENT,
    nm_arquivo VARCHAR(255) NOT NULL,
    ds_mime VARCHAR(120) NOT NULL,
    qt_tamanho_bytes BIGINT NOT NULL,
    im_conteudo LONGBLOB NOT NULL,
    cd_contexto_arquivo INT NOT NULL,
    dt_envio DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_arquivo PRIMARY KEY (cd_arquivo),

    CONSTRAINT fk_arquivo_contexto FOREIGN KEY (cd_contexto_arquivo)
        REFERENCES tb_contexto_arquivo (cd_contexto_arquivo)
);

CREATE TABLE tb_tarefa_arquivo (
    cd_tarefa INT NOT NULL,
    cd_arquivo INT NOT NULL,
    cd_local_anexo INT NOT NULL,

    CONSTRAINT pk_tarefa_arquivo
        PRIMARY KEY (cd_tarefa, cd_arquivo, cd_local_anexo),

    CONSTRAINT fk_tarefa_arquivo_tarefa FOREIGN KEY (cd_tarefa)
        REFERENCES tb_tarefa (cd_tarefa),

    CONSTRAINT fk_tarefa_arquivo_arquivo FOREIGN KEY (cd_arquivo)
        REFERENCES tb_arquivo (cd_arquivo),

    CONSTRAINT fk_tarefa_arquivo_local FOREIGN KEY (cd_local_anexo)
        REFERENCES tb_local_anexo_tarefa (cd_local_anexo)
);

CREATE TABLE tb_mensagem_arquivo (
    cd_mensagem INT NOT NULL,
    cd_arquivo INT NOT NULL,

    CONSTRAINT pk_mensagem_arquivo
        PRIMARY KEY (cd_mensagem, cd_arquivo),

    CONSTRAINT fk_mensagem_arquivo_mensagem FOREIGN KEY (cd_mensagem)
        REFERENCES tb_mensagem (cd_mensagem),

    CONSTRAINT fk_mensagem_arquivo_arquivo FOREIGN KEY (cd_arquivo)
        REFERENCES tb_arquivo (cd_arquivo)
);

CREATE TABLE tb_evento (
    cd_evento INT NOT NULL AUTO_INCREMENT,
    nm_evento VARCHAR(100) NOT NULL,
    ds_evento TEXT,
    dt_evento DATETIME NOT NULL,
    nm_tipo_evento VARCHAR(40),
    cd_usuario_responsavel INT,
    dt_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    dt_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_evento PRIMARY KEY (cd_evento),

    CONSTRAINT fk_evento_responsavel FOREIGN KEY (cd_usuario_responsavel)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE tb_empresa_mapa (
    cd_empresa INT NOT NULL AUTO_INCREMENT,
    nm_empresa VARCHAR(120) NOT NULL,
    ds_empresa TEXT,
    vl_latitude DECIMAL(10, 7) NOT NULL,
    vl_longitude DECIMAL(10, 7) NOT NULL,

    CONSTRAINT pk_empresa_mapa PRIMARY KEY (cd_empresa)
);

CREATE TABLE tb_empresa_quadro (
    cd_empresa INT NOT NULL,
    cd_quadro INT NOT NULL,

    CONSTRAINT pk_empresa_quadro
        PRIMARY KEY (cd_empresa, cd_quadro),

    CONSTRAINT fk_empresa_quadro_empresa FOREIGN KEY (cd_empresa)
        REFERENCES tb_empresa_mapa (cd_empresa),

    CONSTRAINT fk_empresa_quadro_quadro FOREIGN KEY (cd_quadro)
        REFERENCES tb_quadro (cd_quadro)
);


-- DADOS DAS TABELAS DE APOIO

INSERT INTO tb_perfil VALUES
(1, 'Gestor'),
(2, 'Membro');

INSERT INTO tb_tipo_fundo VALUES
(1, 'Cor'),
(2, 'Imagem por URL'),
(3, 'Imagem enviada');

INSERT INTO tb_status_tarefa VALUES
(1, 'Documentos'),
(2, 'A Fazer'),
(3, 'Fazendo'),
(4, 'Concluído');

INSERT INTO tb_prioridade VALUES
(1, 'Baixa'),
(2, 'Média'),
(3, 'Alta'),
(4, 'Urgente');

INSERT INTO tb_tipo_conversa VALUES
(1, 'Individual'),
(2, 'Grupo');

INSERT INTO tb_contexto_arquivo VALUES
(1, 'TAREFA'),
(2, 'CHAT');
INSERT INTO tb_local_anexo_tarefa VALUES
(1, 'CARTAO'),
(2, 'DETALHES');


-- QUADROS PREDEFINIDOS

INSERT INTO tb_quadro (cd_quadro, nm_quadro, nm_categoria, cd_tipo_fundo, ds_cor_fundo, ds_url_fundo, im_fundo, dt_cadastro, dt_modificacao) VALUES
(1, 'TeamWave', 'Equipe', 1, '#2563eb', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Estratégia', 'Planejamento', 1, '#7c3aed', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Operações', 'Equipe', 1, '#ea580c', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'Marketing', 'Equipe', 1, '#0f766e', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 'Projeto', 'Projeto', 1, '#be123c', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 'Reuniões', 'Equipe', 1, '#334155', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 'Design', 'Criação', 1, '#0891b2', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(8, 'Planejamento', 'Organização', 1, '#4d7c0f', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 'Natureza', 'Imagem', 2, NULL, 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1600&q=85', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 'Montanhas', 'Imagem', 2, NULL, 'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?auto=format&fit=crop&w=1600&q=85', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(11, 'Praia', 'Imagem', 2, NULL, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=85', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(12, 'Amanhecer', 'Imagem', 2, NULL, 'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?auto=format&fit=crop&w=1600&q=85', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(13, 'Céu estrelado', 'Imagem', 2, NULL, 'https://images.unsplash.com/photo-1519608487953-e999c86e7455?auto=format&fit=crop&w=1600&q=85', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- SEDE DA EMPRESA FIXA NO MAPA

INSERT INTO tb_empresa_mapa (cd_empresa, nm_empresa, ds_empresa, vl_latitude, vl_longitude) VALUES
(1, 'Sede demonstrativa TeamWave', 'Sede oficial da TeamWave, empresa especializada em comunicação e gestão de projetos.', -24.032406, -46.506550);