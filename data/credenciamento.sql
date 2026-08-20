use credenciamento;
CREATE TABLE tipo_acesso (
    id_tipo SERIAL PRIMARY KEY,
    descricao VARCHAR(20) NOT NULL
);
CREATE TABLE participante (
    id_participante SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE evento (
    id_evento SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    local VARCHAR(200)
);
CREATE TABLE inscricao_evento (
    id_inscricao SERIAL PRIMARY KEY,
    id_participante INT NOT NULL,
    id_evento INT NOT NULL,
    id_tipo INT NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante),

    FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento),

    FOREIGN KEY (id_tipo)
        REFERENCES tipo_acesso(id_tipo)
);
CREATE TABLE palestra (
    id_palestra SERIAL PRIMARY KEY,
    id_evento INT NOT NULL,

    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,
    palestrante VARCHAR(150),
    data_hora TIMESTAMP,
    carga_horaria DECIMAL(4,2),
    vagas INT,

    FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
);
CREATE TABLE workshop (
    id_workshop SERIAL PRIMARY KEY,
    id_evento INT NOT NULL,

    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,
    instrutor VARCHAR(150),
    data_hora TIMESTAMP,
    carga_horaria DECIMAL(4,2),
    vagas INT,

    FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
);
CREATE TABLE inscricao_palestra (
    id_inscricao_palestra SERIAL PRIMARY KEY,

    id_participante INT NOT NULL,
    id_palestra INT NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante),

    FOREIGN KEY (id_palestra)
        REFERENCES palestra(id_palestra),

    UNIQUE(id_participante,id_palestra)
);
CREATE TABLE inscricao_workshop (
    id_inscricao_workshop SERIAL PRIMARY KEY,

    id_participante INT NOT NULL,
    id_workshop INT NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante),

    FOREIGN KEY (id_workshop)
        REFERENCES workshop(id_workshop),

    UNIQUE(id_participante,id_workshop)
);
CREATE TABLE presenca_palestra (
    id_presenca SERIAL PRIMARY KEY,

    id_participante INT NOT NULL,
    id_palestra INT NOT NULL,
    percentual_presenca DECIMAL(5,2),

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante),

    FOREIGN KEY (id_palestra)
        REFERENCES palestra(id_palestra)
);
CREATE TABLE presenca_workshop (
    id_presenca SERIAL PRIMARY KEY,

    id_participante INT NOT NULL,
    id_workshop INT NOT NULL,
    percentual_presenca DECIMAL(5,2),

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante),

    FOREIGN KEY (id_workshop)
        REFERENCES workshop(id_workshop)
);
CREATE TABLE certificado (
    id_certificado SERIAL PRIMARY KEY,

    id_participante INT NOT NULL,
    tipo_atividade VARCHAR(20),
    id_atividade INT NOT NULL,

    data_emissao TIMESTAMP,
    codigo_validacao VARCHAR(50) UNIQUE,

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante)
);
CREATE TABLE credenciamento (
    id_credenciamento INT AUTO_INCREMENT PRIMARY KEY,

    id_participante INT NOT NULL,
    id_evento INT NOT NULL,

    data_hora_credenciamento DATETIME DEFAULT CURRENT_TIMESTAMP,

    qr_code VARCHAR(255) UNIQUE,
    status_entrada ENUM('PENDENTE','CREDENCIADO','PRESENTE'),

    cracha_emitido BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (id_participante)
        REFERENCES participante(id_participante),

    FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
);