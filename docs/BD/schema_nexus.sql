-- =====================================================================
-- NEXUS - ESQUEMA DE INSTALACAO DO BANCO DE DADOS (MySQL 8)
-- =====================================================================
-- Arquivo unico que consolida as migrations V1 a V21 do backend
-- (BD_3S_BACKEND, src/main/resources/db/migration) no estado final.
-- Cria as 26 tabelas, chaves, indices e CHECKs. Nao inclui dados de exemplo
-- (db/seed) nem a tabela flyway_schema_history.
--
-- Migrations consideradas, na ordem de aplicacao:
--   V1__criar_tabelas_iniciais            V12__guia_rascunho_validade
--   V2__alterar_estrutura                 V13__guia_validade_obrigatoria
--   V3__add_ocs_ativa                     V14__rotina_execucao
--   V4__fixar_collation_ocs               V15__setor_fatura_protocolo
--   V5__fixar_collation_procedimento_exame  V16__setor_fatura_tipos_evento
--   V6__criar_guia_rascunho               V17__rastreabilidade_lisura_glosa
--   V7__criar_assinatura                  V18__rastreabilidade_revisao_rodadas
--   V8__perfil_ocs_conta_ocs              V19__dependentes_responsavel_externo
--   V9__guia_execucao                     V20__pre_guia_paciente
--   V10__criar_espelho                    V21__ajustes_modelo_guia_espelho
--   V11__guia_rascunho_procedimento
--
-- COMO USAR: abra este arquivo no MySQL Workbench e execute tudo (botao do raio).
--
-- ATENCAO: este arquivo serve para criar o banco SEM o backend (consulta, modelagem,
-- avaliacao). Para rodar o sistema NEXUS, NAO execute este arquivo: crie apenas o banco
-- vazio (veja o Manual de Instalacao) e deixe o Flyway do backend criar as tabelas e
-- os dados de exemplo. Se as tabelas ja existirem, o Flyway recusa iniciar.
-- =====================================================================

CREATE DATABASE IF NOT EXISTS nexus
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE nexus;

-- Convencoes: tabelas em PascalCase, colunas em snake_case, PK id_<tabela>, exceto especializacoes de Usuario
--             (Beneficiario, MedicoFusex, ChefeFusex, ResponsavelExterno e ContaOcs: PK = FK usuario_id) e
--             GuiaRascunho (PK = FK pre_guia_id). Collation padrao do banco: utf8mb4_unicode_ci.
-- As FKs que formariam ciclo na criacao (ex.: Usuario <-> Assinatura) aparecem no fim, em ALTER TABLE.
-- Indices criados automaticamente pelo MySQL para as FKs nao sao repetidos.
-- =====================================================================

-- Tabelas (26):
--   Usuario                    1 FK(s), 3 CHECK(s)
--   Assinatura                 1 FK(s), 0 CHECK(s)
--   Beneficiario               1 FK(s), 3 CHECK(s)
--   MedicoFusex                1 FK(s), 3 CHECK(s)
--   ChefeFusex                 1 FK(s), 1 CHECK(s)
--   ResponsavelExterno         1 FK(s), 2 CHECK(s)
--   Ocs                        0 FK(s), 1 CHECK(s)
--   ContaOcs                   2 FK(s), 0 CHECK(s)
--   ProcedimentoExame          0 FK(s), 1 CHECK(s)
--   OcsProcedimento            2 FK(s), 0 CHECK(s)
--   OcsPreco                   1 FK(s), 3 CHECK(s)
--   Dependente                 3 FK(s), 5 CHECK(s)
--   PreGuia                    5 FK(s), 2 CHECK(s)
--   PreGuiaProcedimento        2 FK(s), 0 CHECK(s)
--   PreGuiaHistorico           2 FK(s), 2 CHECK(s)
--   GuiaRascunho               1 FK(s), 0 CHECK(s)
--   GuiaRascunhoProcedimento   1 FK(s), 2 CHECK(s)
--   Espelho                    4 FK(s), 5 CHECK(s)
--   Guia                       4 FK(s), 2 CHECK(s)
--   GuiaProcedimento           1 FK(s), 2 CHECK(s)
--   AssinaturaGuia             3 FK(s), 1 CHECK(s)
--   Sessao                     4 FK(s), 4 CHECK(s)
--   EspelhoItem                2 FK(s), 7 CHECK(s)
--   FaturaEvento               2 FK(s), 2 CHECK(s)
--   EspelhoItemRodadaOcs       3 FK(s), 4 CHECK(s)
--   RotinaExecucao             0 FK(s), 0 CHECK(s)


-- ---------------------------------------------------------------------
-- Usuario: conta de acesso de qualquer perfil (login pelo CPF ou nome de usuario)
-- Criada/alterada em: V2, V7, V8, V15, V19
-- ---------------------------------------------------------------------
CREATE TABLE Usuario (
    id_usuario    BIGINT       NOT NULL AUTO_INCREMENT,
    login         VARCHAR(50)  NOT NULL,
    senha_hash    VARCHAR(255) NOT NULL,
    perfil        VARCHAR(20)  NOT NULL,
    ativo         BOOLEAN      NOT NULL DEFAULT TRUE,
    assinatura_id BIGINT       NULL,

    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uk_usuario_login UNIQUE (login),
    CONSTRAINT ck_usuario_assinatura_id
        CHECK (perfil NOT IN ('SETOR_GUIAS', 'RECEPCAO', 'OCS', 'SETOR_FATURA', 'RASTREABILIDADE', 'AUDITORIA') OR assinatura_id IS NULL),
    CONSTRAINT ck_usuario_login CHECK (CHAR_LENGTH(login) >= 3),
    CONSTRAINT ck_usuario_perfil
        CHECK (perfil IN ('BENEFICIARIO', 'MEDICO', 'CHEFE_FUSEX', 'SETOR_GUIAS', 'RECEPCAO', 'OCS', 'SETOR_FATURA', 'RASTREABILIDADE', 'AUDITORIA', 'RESPONSAVEL_EXTERNO'))
);

-- ---------------------------------------------------------------------
-- Assinatura: uma linha por cadastro de imagem de assinatura; Usuario.assinatura_id aponta para a vigente
-- Criada/alterada em: V7
-- ---------------------------------------------------------------------
CREATE TABLE Assinatura (
    id_assinatura  BIGINT       NOT NULL AUTO_INCREMENT,
    usuario_id     BIGINT       NOT NULL,
    assinatura_url VARCHAR(500) NOT NULL,

    CONSTRAINT pk_assinatura PRIMARY KEY (id_assinatura),
    CONSTRAINT uk_assinatura_usuario_assinatura UNIQUE (usuario_id, assinatura_url),
    CONSTRAINT fk_assinatura_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario)
);

-- ---------------------------------------------------------------------
-- Beneficiario: titular do FUSEX; especializacao de Usuario (PK = FK)
-- Criada/alterada em: V1, V2
-- ---------------------------------------------------------------------
CREATE TABLE Beneficiario (
    usuario_id      BIGINT       NOT NULL,
    telefone        VARCHAR(11)  NOT NULL,
    prec_cp         VARCHAR(11)  NOT NULL,
    nome            VARCHAR(150) NOT NULL,
    data_nascimento DATE         NOT NULL,

    CONSTRAINT pk_beneficiario PRIMARY KEY (usuario_id),
    CONSTRAINT uk_beneficiario_prec_cp UNIQUE (prec_cp),
    CONSTRAINT fk_beneficiario_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_beneficiario_nome CHECK (CHAR_LENGTH(TRIM(nome)) > 0),
    CONSTRAINT ck_beneficiario_prec_cp CHECK (REGEXP_LIKE(prec_cp, '^[0-9]{11}$')),
    CONSTRAINT ck_beneficiario_telefone CHECK (REGEXP_LIKE(telefone, '^[1-9][1-9]9[0-9]{8}$'))
);

-- ---------------------------------------------------------------------
-- MedicoFusex: medico do FUSEX; especializacao de Usuario (PK = FK)
-- Criada/alterada em: V2
-- ---------------------------------------------------------------------
CREATE TABLE MedicoFusex (
    usuario_id BIGINT       NOT NULL,
    nome       VARCHAR(150) NOT NULL,
    prec_cp    VARCHAR(11)  NOT NULL,
    patente    VARCHAR(50)  NOT NULL,
    crm        VARCHAR(20)  NOT NULL,

    CONSTRAINT pk_medicofusex PRIMARY KEY (usuario_id),
    CONSTRAINT uk_medicofusex_crm UNIQUE (crm),
    CONSTRAINT uk_medicofusex_prec_cp UNIQUE (prec_cp),
    CONSTRAINT fk_medicofusex_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_medicofusex_crm CHECK (REGEXP_LIKE(crm, '^[0-9]+-[A-Z]{2}$', 'c')),
    CONSTRAINT ck_medicofusex_nome CHECK (CHAR_LENGTH(TRIM(nome)) > 0),
    CONSTRAINT ck_medicofusex_prec_cp CHECK (REGEXP_LIKE(prec_cp, '^[0-9]{11}$'))
);

-- ---------------------------------------------------------------------
-- ChefeFusex: chefe do FUSEX; especializacao de Usuario (PK = FK)
-- Criada/alterada em: V2
-- ---------------------------------------------------------------------
CREATE TABLE ChefeFusex (
    usuario_id BIGINT       NOT NULL,
    nome       VARCHAR(150) NOT NULL,
    patente    VARCHAR(50)  NOT NULL,

    CONSTRAINT pk_chefefusex PRIMARY KEY (usuario_id),
    CONSTRAINT fk_chefefusex_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_chefefusex_nome CHECK (CHAR_LENGTH(TRIM(nome)) > 0)
);

-- ---------------------------------------------------------------------
-- ResponsavelExterno: responsavel legal externo de menores (sem Prec CP); especializacao de Usuario (PK = FK)
-- Criada/alterada em: V19
-- ---------------------------------------------------------------------
CREATE TABLE ResponsavelExterno (
    usuario_id BIGINT       NOT NULL,
    nome       VARCHAR(150) NOT NULL,
    telefone   VARCHAR(11)  NULL,

    CONSTRAINT pk_responsavelexterno PRIMARY KEY (usuario_id),
    CONSTRAINT fk_responsavelexterno_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_responsavelexterno_nome CHECK (CHAR_LENGTH(TRIM(nome)) > 0),
    CONSTRAINT ck_responsavelexterno_telefone
        CHECK (telefone IS NULL OR REGEXP_LIKE(telefone, '^[1-9][1-9]9[0-9]{8}$'))
);

-- ---------------------------------------------------------------------
-- Ocs: rede credenciada (OCS/PSA)
-- Criada/alterada em: V1, V2, V3, V4
-- ---------------------------------------------------------------------
CREATE TABLE Ocs (
    id_ocs       BIGINT       NOT NULL AUTO_INCREMENT,
    contrato_num VARCHAR(50)  NOT NULL,
    nome         VARCHAR(200) NOT NULL,
    tipo         VARCHAR(3)   NOT NULL,
    ativo        BOOLEAN      NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_ocs PRIMARY KEY (id_ocs),
    CONSTRAINT ck_ocs_tipo CHECK (tipo IN ('OCS', 'PSA'))
);

-- ---------------------------------------------------------------------
-- ContaOcs: liga a conta de perfil OCS a uma Ocs (uma conta por OCS); especializacao de Usuario (PK = FK)
-- Criada/alterada em: V8
-- ---------------------------------------------------------------------
CREATE TABLE ContaOcs (
    usuario_id BIGINT NOT NULL,
    ocs_id     BIGINT NOT NULL,

    CONSTRAINT pk_conta_ocs PRIMARY KEY (usuario_id),
    CONSTRAINT uk_conta_ocs_ocs UNIQUE (ocs_id),
    CONSTRAINT fk_conta_ocs_ocs FOREIGN KEY (ocs_id) REFERENCES Ocs (id_ocs),
    CONSTRAINT fk_conta_ocs_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario)
);

-- ---------------------------------------------------------------------
-- ProcedimentoExame: catalogo de procedimentos (codigo TUSS), usado na pre-guia do medico
-- Criada/alterada em: V1, V2, V5
-- ---------------------------------------------------------------------
CREATE TABLE ProcedimentoExame (
    id_procedimento_exame       BIGINT       NOT NULL AUTO_INCREMENT,
    codigo_tuss                 VARCHAR(10)  NOT NULL,
    terminologia_procedimento   VARCHAR(500) NOT NULL,
    rol_ans_resolucao_normativa VARCHAR(100) NULL,
    rol_ans                     VARCHAR(3)   NOT NULL,
    subgrupo                    VARCHAR(150) NULL,

    CONSTRAINT pk_procedimento_exame PRIMARY KEY (id_procedimento_exame),
    CONSTRAINT uk_procedimentoexame_codigo_tuss UNIQUE (codigo_tuss),
    CONSTRAINT ck_procedimentoexame_rol_ans CHECK (rol_ans IN ('SIM', 'NAO'))
);

-- ---------------------------------------------------------------------
-- OcsProcedimento: procedimentos que cada OCS realiza (N:N)
-- Criada/alterada em: V1, V2
-- ---------------------------------------------------------------------
CREATE TABLE OcsProcedimento (
    ocs_id          BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,

    CONSTRAINT pk_ocs_procedimento PRIMARY KEY (ocs_id, procedimento_id),
    CONSTRAINT fk_ocsprocedimento_ocs FOREIGN KEY (ocs_id) REFERENCES Ocs (id_ocs),
    CONSTRAINT fk_ocsprocedimento_procedimentoexame FOREIGN KEY (procedimento_id) REFERENCES ProcedimentoExame (id_procedimento_exame)
);

-- ---------------------------------------------------------------------
-- OcsPreco: tabela de precos de contrato da OCS por codigo de cobranca (Cod DGP), usada na lisura
-- Criada/alterada em: V17, V18
-- ---------------------------------------------------------------------
CREATE TABLE OcsPreco (
    id_ocs_preco   BIGINT        NOT NULL AUTO_INCREMENT,
    ocs_id         BIGINT        NOT NULL,
    cod_dgp        VARCHAR(10)   NOT NULL,
    valor_sessao   DECIMAL(10,2) NOT NULL,
    atualizado_em  DATETIME      NULL,
    atualizado_por VARCHAR(100)  NULL,
    descricao      VARCHAR(300)  NULL,

    CONSTRAINT pk_ocspreco PRIMARY KEY (id_ocs_preco),
    CONSTRAINT uk_ocspreco_ocs_cod UNIQUE (ocs_id, cod_dgp),
    CONSTRAINT fk_ocspreco_ocs FOREIGN KEY (ocs_id) REFERENCES Ocs (id_ocs),
    CONSTRAINT ck_ocspreco_atualizacao CHECK ((atualizado_em IS NULL) = (atualizado_por IS NULL)),
    CONSTRAINT ck_ocspreco_cod_dgp CHECK (REGEXP_LIKE(cod_dgp, '^[0-9]+$')),
    CONSTRAINT ck_ocspreco_valor CHECK (valor_sessao >= 0)
);

-- indice que sobrou da FK fk_ocspreco_atualizado_por, removida na V18 (atualizado_por passou a guardar o nome digitado)
CREATE INDEX fk_ocspreco_atualizado_por ON OcsPreco (atualizado_por);

-- ---------------------------------------------------------------------
-- Dependente: dependente de um titular: MENOR_TITULAR, MENOR_RESPONSAVEL ou MAIOR (vigencia_fim nula = vitalicia)
-- Criada/alterada em: V19
-- ---------------------------------------------------------------------
CREATE TABLE Dependente (
    id_dependente   BIGINT       NOT NULL AUTO_INCREMENT,
    titular_id      BIGINT       NOT NULL,
    usuario_id      BIGINT       NULL,
    responsavel_id  BIGINT       NULL,
    nome            VARCHAR(150) NOT NULL,
    data_nascimento DATE         NOT NULL,
    cpf             VARCHAR(11)  NOT NULL,
    telefone        VARCHAR(11)  NULL,
    prec_cp         VARCHAR(11)  NOT NULL,
    vinculo         VARCHAR(50)  NULL,
    tipo            VARCHAR(17)  NOT NULL,
    vigencia_fim    DATE         NULL,

    CONSTRAINT pk_dependente PRIMARY KEY (id_dependente),
    CONSTRAINT uk_dependente_cpf UNIQUE (cpf),
    CONSTRAINT uk_dependente_prec_cp UNIQUE (prec_cp),
    CONSTRAINT uk_dependente_usuario UNIQUE (usuario_id),
    CONSTRAINT fk_dependente_responsavel FOREIGN KEY (responsavel_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_dependente_titular FOREIGN KEY (titular_id) REFERENCES Beneficiario (usuario_id),
    CONSTRAINT fk_dependente_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_dependente_cpf CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$')),
    CONSTRAINT ck_dependente_nome CHECK (CHAR_LENGTH(TRIM(nome)) > 0),
    CONSTRAINT ck_dependente_prec_cp CHECK (REGEXP_LIKE(prec_cp, '^[0-9]{11}$')),
    CONSTRAINT ck_dependente_telefone
        CHECK (telefone IS NULL OR REGEXP_LIKE(telefone, '^[1-9][1-9]9[0-9]{8}$')),
    CONSTRAINT ck_dependente_tipo
        CHECK ((tipo = 'MENOR_TITULAR' AND usuario_id IS NULL AND responsavel_id IS NULL AND vigencia_fim IS NOT NULL) OR (tipo = 'MENOR_RESPONSAVEL' AND usuario_id IS NULL AND responsavel_id IS NOT NULL AND vigencia_fim IS NOT NULL) OR (tipo = 'MAIOR' AND usuario_id IS NOT NULL AND responsavel_id IS NULL))
);

-- ---------------------------------------------------------------------
-- PreGuia: pre-guia do beneficiario, do responsavel legal, do dependente maior ou do medico
-- Criada/alterada em: V1, V2, V20
-- ---------------------------------------------------------------------
CREATE TABLE PreGuia (
    id_pre_guia        BIGINT       NOT NULL AUTO_INCREMENT,
    status             VARCHAR(12)  NOT NULL DEFAULT 'PENDENTE',
    data_criacao       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    encaminhamento_url VARCHAR(500) NULL,
    beneficiario_id    BIGINT       NOT NULL,
    ocs_id             BIGINT       NOT NULL,
    medico_id          BIGINT       NULL,
    dependente_id      BIGINT       NULL,
    criada_por         BIGINT       NULL,

    CONSTRAINT pk_pre_guia PRIMARY KEY (id_pre_guia),
    CONSTRAINT fk_preguia_beneficiario FOREIGN KEY (beneficiario_id) REFERENCES Beneficiario (usuario_id),
    CONSTRAINT fk_preguia_criada_por FOREIGN KEY (criada_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_preguia_dependente FOREIGN KEY (dependente_id) REFERENCES Dependente (id_dependente),
    CONSTRAINT fk_preguia_medicofusex FOREIGN KEY (medico_id) REFERENCES MedicoFusex (usuario_id),
    CONSTRAINT fk_preguia_ocs FOREIGN KEY (ocs_id) REFERENCES Ocs (id_ocs),
    CONSTRAINT ck_preguia_encaminhamento_url
        CHECK (encaminhamento_url IS NOT NULL OR medico_id IS NOT NULL),
    CONSTRAINT ck_preguia_status CHECK (status IN ('PENDENTE', 'EM_ANALISE', 'ATENCAO', 'CONCLUIDA'))
);

CREATE INDEX ix_preguia_dependente ON PreGuia (dependente_id);

-- ---------------------------------------------------------------------
-- PreGuiaProcedimento: exames pedidos pelo medico na pre-guia (N:N com ProcedimentoExame)
-- Criada/alterada em: V1, V2
-- ---------------------------------------------------------------------
CREATE TABLE PreGuiaProcedimento (
    pre_guia_id     BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,

    CONSTRAINT pk_pre_guia_procedimento PRIMARY KEY (pre_guia_id, procedimento_id),
    CONSTRAINT fk_preguiaprocedimento_preguia FOREIGN KEY (pre_guia_id) REFERENCES PreGuia (id_pre_guia),
    CONSTRAINT fk_preguiaprocedimento_procedimentoexame FOREIGN KEY (procedimento_id) REFERENCES ProcedimentoExame (id_procedimento_exame)
);

-- ---------------------------------------------------------------------
-- PreGuiaHistorico: historico de status da pre-guia (observacao do setor e encaminhamento de cada envio)
-- Criada/alterada em: V2
-- ---------------------------------------------------------------------
CREATE TABLE PreGuiaHistorico (
    id_pre_guia_historico BIGINT       NOT NULL AUTO_INCREMENT,
    pre_guia_id           BIGINT       NOT NULL,
    status                VARCHAR(12)  NOT NULL,
    observacao            VARCHAR(500) NULL,
    encaminhamento_url    VARCHAR(500) NULL,
    usuario_id            BIGINT       NOT NULL,
    data_hora             DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_preguiahistorico PRIMARY KEY (id_pre_guia_historico),
    CONSTRAINT fk_preguiahistorico_preguia FOREIGN KEY (pre_guia_id) REFERENCES PreGuia (id_pre_guia),
    CONSTRAINT fk_preguiahistorico_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_preguiahistorico_observacao
        CHECK (status <> 'ATENCAO' OR (observacao IS NOT NULL AND TRIM(observacao) <> '')),
    CONSTRAINT ck_preguiahistorico_status
        CHECK (status IN ('PENDENTE', 'EM_ANALISE', 'ATENCAO', 'CONCLUIDA'))
);

-- ---------------------------------------------------------------------
-- GuiaRascunho: Guia anexada pelo setor de Guias antes de concluir (PK = FK pre_guia_id)
-- Criada/alterada em: V6, V12
-- ---------------------------------------------------------------------
CREATE TABLE GuiaRascunho (
    pre_guia_id      BIGINT       NOT NULL,
    numero           VARCHAR(20)  NOT NULL,
    arquivo_url      VARCHAR(500) NOT NULL,
    nome_arquivo     VARCHAR(255) NOT NULL,
    data_atualizacao DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    validade_ate     DATE         NULL,

    CONSTRAINT pk_guia_rascunho PRIMARY KEY (pre_guia_id),
    CONSTRAINT fk_guia_rascunho_preguia FOREIGN KEY (pre_guia_id) REFERENCES PreGuia (id_pre_guia)
);

-- ---------------------------------------------------------------------
-- GuiaRascunhoProcedimento: exames conferidos pelo setor de Guias no rascunho
-- Criada/alterada em: V11
-- ---------------------------------------------------------------------
CREATE TABLE GuiaRascunhoProcedimento (
    pre_guia_id            BIGINT       NOT NULL,
    ordem                  INT          NOT NULL,
    cod_dgp                VARCHAR(10)  NOT NULL,
    descricao_procedimento VARCHAR(500) NOT NULL,
    quantidade_autorizada  INT          NOT NULL,

    CONSTRAINT pk_guia_rascunho_procedimento PRIMARY KEY (pre_guia_id, ordem),
    CONSTRAINT fk_guia_rascunho_procedimento_rascunho FOREIGN KEY (pre_guia_id) REFERENCES GuiaRascunho (pre_guia_id),
    CONSTRAINT ck_guia_rascunho_procedimento_cod_dgp CHECK (REGEXP_LIKE(cod_dgp, '^[0-9]+$')),
    CONSTRAINT ck_guia_rascunho_procedimento_quantidade CHECK (quantidade_autorizada > 0)
);

-- ---------------------------------------------------------------------
-- Espelho: espelho da OCS; depois de enviado, e a fatura do setor de Faturas (situacao_fatura)
-- Criada/alterada em: V10, V15, V21
-- ---------------------------------------------------------------------
CREATE TABLE Espelho (
    id_espelho        BIGINT      NOT NULL AUTO_INCREMENT,
    ocs_id            BIGINT      NOT NULL,
    status            VARCHAR(13) NOT NULL DEFAULT 'EM_CONSTRUCAO',
    data_criacao      DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    criado_por        BIGINT      NOT NULL,
    data_envio        DATETIME    NULL,
    enviado_por       BIGINT      NULL,
    situacao_fatura   VARCHAR(14) NULL,
    numero_fatura     VARCHAR(8)  NULL,
    protocolada_por   BIGINT      NULL,
    ocs_em_construcao BIGINT      GENERATED ALWAYS AS (CASE WHEN status = 'EM_CONSTRUCAO' THEN ocs_id END) STORED,

    CONSTRAINT pk_espelho PRIMARY KEY (id_espelho),
    CONSTRAINT uk_espelho_ocs_em_construcao UNIQUE (ocs_em_construcao),
    CONSTRAINT uk_espelho_ocs_numero_fatura UNIQUE (ocs_id, numero_fatura),
    CONSTRAINT fk_espelho_criado_por FOREIGN KEY (criado_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_espelho_enviado_por FOREIGN KEY (enviado_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_espelho_ocs FOREIGN KEY (ocs_id) REFERENCES Ocs (id_ocs),
    CONSTRAINT fk_espelho_protocolada_por FOREIGN KEY (protocolada_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_espelho_envio
        CHECK ((status = 'EM_CONSTRUCAO' AND data_envio IS NULL AND enviado_por IS NULL) OR (status = 'ENVIADO' AND data_envio IS NOT NULL AND enviado_por IS NOT NULL)),
    CONSTRAINT ck_espelho_fatura
        CHECK ((status = 'EM_CONSTRUCAO' AND situacao_fatura IS NULL AND numero_fatura IS NULL AND protocolada_por IS NULL) OR (status = 'ENVIADO' AND situacao_fatura = 'RECEBIDO' AND numero_fatura IS NULL AND protocolada_por IS NULL) OR (status = 'ENVIADO' AND situacao_fatura IN ('PROTOCOLADA', 'EM_LISURA', 'AGUARDANDO_OCS', 'EM_AUDITORIA', 'AUDITADA') AND numero_fatura IS NOT NULL AND protocolada_por IS NOT NULL)),
    CONSTRAINT ck_espelho_numero_fatura
        CHECK (numero_fatura IS NULL OR REGEXP_LIKE(numero_fatura, '^[0-9]{3}/[0-9]{4}$')),
    CONSTRAINT ck_espelho_situacao_fatura
        CHECK (situacao_fatura IS NULL OR situacao_fatura IN ('RECEBIDO', 'PROTOCOLADA', 'EM_LISURA', 'AGUARDANDO_OCS', 'EM_AUDITORIA', 'AUDITADA')),
    CONSTRAINT ck_espelho_status CHECK (status IN ('EM_CONSTRUCAO', 'ENVIADO'))
);

-- ---------------------------------------------------------------------
-- Guia: Guia de Encaminhamento concluida (uma por pre-guia), com a validade NAO RECEBER APOS e a situacao de execucao
-- Criada/alterada em: V2, V9, V10, V13
-- ---------------------------------------------------------------------
CREATE TABLE Guia (
    id_guia           BIGINT       NOT NULL AUTO_INCREMENT,
    pre_guia_id       BIGINT       NOT NULL,
    numero            VARCHAR(20)  NOT NULL,
    arquivo_url       VARCHAR(500) NOT NULL,
    data_insercao     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    inserida_por      BIGINT       NOT NULL,
    validade_ate      DATE         NOT NULL,
    data_envio        DATETIME     NULL,
    enviada_por       BIGINT       NULL,
    situacao_execucao VARCHAR(20)  NOT NULL DEFAULT 'NAO_ENVIADA',
    espelho_id        BIGINT       NULL,

    CONSTRAINT pk_guia PRIMARY KEY (id_guia),
    CONSTRAINT uk_guia_numero UNIQUE (numero),
    CONSTRAINT uk_guia_pre_guia_id UNIQUE (pre_guia_id),
    CONSTRAINT fk_guia_enviada_por FOREIGN KEY (enviada_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_guia_espelho FOREIGN KEY (espelho_id) REFERENCES Espelho (id_espelho),
    CONSTRAINT fk_guia_preguia FOREIGN KEY (pre_guia_id) REFERENCES PreGuia (id_pre_guia),
    CONSTRAINT fk_guia_usuario FOREIGN KEY (inserida_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_guia_envio CHECK (data_envio IS NULL OR enviada_por IS NOT NULL),
    CONSTRAINT ck_guia_situacao_execucao
        CHECK (situacao_execucao IN ('NAO_ENVIADA', 'ENVIADA', 'EM_EXECUCAO', 'REALIZADA', 'ENCERRADA', 'VENCIDA'))
);

-- ---------------------------------------------------------------------
-- GuiaProcedimento: exames autorizados da Guia (Cod DGP e quantidade); o V.Unit nao e gravado (coluna removida na V21)
-- Criada/alterada em: V9, V21
-- ---------------------------------------------------------------------
CREATE TABLE GuiaProcedimento (
    id_guia_procedimento   BIGINT       NOT NULL AUTO_INCREMENT,
    guia_id                BIGINT       NOT NULL,
    cod_dgp                VARCHAR(10)  NOT NULL,
    descricao_procedimento VARCHAR(500) NOT NULL,
    quantidade_autorizada  INT          NOT NULL,

    CONSTRAINT pk_guiaprocedimento PRIMARY KEY (id_guia_procedimento),
    CONSTRAINT uk_guiaprocedimento_guia_cod UNIQUE (guia_id, cod_dgp),
    CONSTRAINT fk_guiaprocedimento_guia FOREIGN KEY (guia_id) REFERENCES Guia (id_guia),
    CONSTRAINT ck_guiaprocedimento_cod_dgp CHECK (REGEXP_LIKE(cod_dgp, '^[0-9]+$')),
    CONSTRAINT ck_guiaprocedimento_quantidade CHECK (quantidade_autorizada > 0)
);

-- ---------------------------------------------------------------------
-- AssinaturaGuia: assinaturas da Guia pelo medico e pelo chefe, com o snapshot da assinatura usada
-- Criada/alterada em: V2, V7
-- ---------------------------------------------------------------------
CREATE TABLE AssinaturaGuia (
    id_assinatura_guia BIGINT     NOT NULL AUTO_INCREMENT,
    guia_id            BIGINT     NOT NULL,
    papel              VARCHAR(6) NOT NULL,
    usuario_id         BIGINT     NOT NULL,
    data_assinatura    DATETIME   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assinatura_id      BIGINT     NOT NULL,

    CONSTRAINT pk_assinaturaguia PRIMARY KEY (id_assinatura_guia),
    CONSTRAINT uk_assinaturaguia_guia_id_papel_unico UNIQUE (guia_id, papel),
    CONSTRAINT fk_assinaturaguia_assinatura FOREIGN KEY (assinatura_id) REFERENCES Assinatura (id_assinatura),
    CONSTRAINT fk_assinaturaguia_guia FOREIGN KEY (guia_id) REFERENCES Guia (id_guia),
    CONSTRAINT fk_assinaturaguia_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_assinaturaguia_papel CHECK (papel IN ('MEDICO', 'CHEFE'))
);

-- ---------------------------------------------------------------------
-- Sessao: uma sessao por unidade da quantidade autorizada; assinada pelo paciente (ou por quem age por ele)
-- Criada/alterada em: V9
-- ---------------------------------------------------------------------
CREATE TABLE Sessao (
    id_sessao            BIGINT      NOT NULL AUTO_INCREMENT,
    guia_procedimento_id BIGINT      NOT NULL,
    numero               INT         NOT NULL,
    status               VARCHAR(12) NOT NULL DEFAULT 'DISPONIVEL',
    data_solicitacao     DATETIME    NULL,
    solicitada_por       BIGINT      NULL,
    data_assinatura      DATETIME    NULL,
    assinado_por         BIGINT      NULL,
    assinatura_id        BIGINT      NULL,

    CONSTRAINT pk_sessao PRIMARY KEY (id_sessao),
    CONSTRAINT uk_sessao_procedimento_numero UNIQUE (guia_procedimento_id, numero),
    CONSTRAINT fk_sessao_assinado_por FOREIGN KEY (assinado_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_sessao_assinatura FOREIGN KEY (assinatura_id) REFERENCES Assinatura (id_assinatura),
    CONSTRAINT fk_sessao_guiaprocedimento FOREIGN KEY (guia_procedimento_id) REFERENCES GuiaProcedimento (id_guia_procedimento),
    CONSTRAINT fk_sessao_solicitada_por FOREIGN KEY (solicitada_por) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_sessao_assinatura
        CHECK (status <> 'ASSINADA' OR (data_assinatura IS NOT NULL AND assinado_por IS NOT NULL AND assinatura_id IS NOT NULL)),
    CONSTRAINT ck_sessao_numero CHECK (numero > 0),
    CONSTRAINT ck_sessao_solicitacao
        CHECK (status IN ('DISPONIVEL', 'EXPIRADA') OR (data_solicitacao IS NOT NULL AND solicitada_por IS NOT NULL)),
    CONSTRAINT ck_sessao_status
        CHECK (status IN ('DISPONIVEL', 'SOLICITADA', 'ASSINADA', 'EXPIRADA'))
);

-- ---------------------------------------------------------------------
-- EspelhoItem: linha do espelho/fatura: um procedimento de uma Guia, com a lisura, a glosa e a decisao da OCS
-- Criada/alterada em: V10, V17, V18
-- ---------------------------------------------------------------------
CREATE TABLE EspelhoItem (
    id_espelho_item        BIGINT        NOT NULL AUTO_INCREMENT,
    espelho_id             BIGINT        NOT NULL,
    guia_procedimento_id   BIGINT        NOT NULL,
    quantidade_sessoes     INT           NOT NULL,
    valor_sessao           DECIMAL(10,2) NOT NULL,
    valor_contrato_sessao  DECIMAL(10,2) NULL,
    origem_contrato        VARCHAR(16)   NULL,
    observacao             VARCHAR(500)  NULL,
    decisao_ocs            VARCHAR(10)   NULL,
    motivo_contestacao_ocs VARCHAR(500)  NULL,

    CONSTRAINT pk_espelhoitem PRIMARY KEY (id_espelho_item),
    CONSTRAINT uk_espelhoitem_guiaprocedimento UNIQUE (guia_procedimento_id),
    CONSTRAINT fk_espelhoitem_espelho FOREIGN KEY (espelho_id) REFERENCES Espelho (id_espelho),
    CONSTRAINT fk_espelhoitem_guiaprocedimento FOREIGN KEY (guia_procedimento_id) REFERENCES GuiaProcedimento (id_guia_procedimento),
    CONSTRAINT ck_espelhoitem_conferido
        CHECK (origem_contrato <> 'CONFERIDO' OR valor_contrato_sessao = valor_sessao),
    CONSTRAINT ck_espelhoitem_contrato_par
        CHECK ((valor_contrato_sessao IS NULL AND origem_contrato IS NULL) OR (valor_contrato_sessao IS NOT NULL AND origem_contrato IS NOT NULL)),
    CONSTRAINT ck_espelhoitem_decisao_ocs
        CHECK (decisao_ocs IS NULL OR decisao_ocs IN ('OK', 'CONTESTADA')),
    CONSTRAINT ck_espelhoitem_motivo_contestacao
        CHECK ((decisao_ocs = 'CONTESTADA' AND CHAR_LENGTH(TRIM(motivo_contestacao_ocs)) BETWEEN 10 AND 500) OR (NOT (decisao_ocs <=> 'CONTESTADA') AND motivo_contestacao_ocs IS NULL)),
    CONSTRAINT ck_espelhoitem_origem_contrato
        CHECK (origem_contrato IS NULL OR origem_contrato IN ('TABELA', 'TABELA_CORRIGIDA', 'CONFERIDO', 'MANUAL')),
    CONSTRAINT ck_espelhoitem_quantidade CHECK (quantidade_sessoes > 0),
    CONSTRAINT ck_espelhoitem_valor CHECK (valor_sessao >= 0)
);

-- ---------------------------------------------------------------------
-- FaturaEvento: historico das mudancas de situacao da fatura, com o responsavel digitado
-- Criada/alterada em: V15, V16
-- ---------------------------------------------------------------------
CREATE TABLE FaturaEvento (
    id_fatura_evento BIGINT       NOT NULL AUTO_INCREMENT,
    espelho_id       BIGINT       NOT NULL,
    tipo             VARCHAR(18)  NOT NULL,
    usuario_id       BIGINT       NOT NULL,
    responsavel      VARCHAR(100) NOT NULL,
    data_evento      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_faturaevento PRIMARY KEY (id_fatura_evento),
    CONSTRAINT fk_faturaevento_espelho FOREIGN KEY (espelho_id) REFERENCES Espelho (id_espelho),
    CONSTRAINT fk_faturaevento_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id_usuario),
    CONSTRAINT ck_faturaevento_responsavel CHECK (CHAR_LENGTH(TRIM(responsavel)) BETWEEN 3 AND 100),
    CONSTRAINT ck_faturaevento_tipo
        CHECK (tipo IN ('PROTOCOLADA', 'ENVIADA_LISURA', 'ENVIADA_OCS', 'CIENTE_OCS', 'CONTESTADA_OCS', 'ENVIADA_AUDITORIA', 'VISUALIZADA'))
);

CREATE INDEX ix_faturaevento_espelho ON FaturaEvento (espelho_id, data_evento);

-- ---------------------------------------------------------------------
-- EspelhoItemRodadaOcs: cada rodada de envio da glosa de uma linha a OCS, com a decisao e o motivo
-- Criada/alterada em: V18
-- ---------------------------------------------------------------------
CREATE TABLE EspelhoItemRodadaOcs (
    id_rodada_ocs          BIGINT        NOT NULL AUTO_INCREMENT,
    espelho_item_id        BIGINT        NOT NULL,
    envio_evento_id        BIGINT        NOT NULL,
    valor_contrato_sessao  DECIMAL(10,2) NOT NULL,
    origem_contrato        VARCHAR(16)   NOT NULL,
    decisao_ocs            VARCHAR(10)   NULL,
    motivo_contestacao_ocs VARCHAR(500)  NULL,
    decisao_evento_id      BIGINT        NULL,

    CONSTRAINT pk_espelhoitemrodadaocs PRIMARY KEY (id_rodada_ocs),
    CONSTRAINT uk_rodadaocs_item_envio UNIQUE (espelho_item_id, envio_evento_id),
    CONSTRAINT fk_rodadaocs_decisao FOREIGN KEY (decisao_evento_id) REFERENCES FaturaEvento (id_fatura_evento),
    CONSTRAINT fk_rodadaocs_envio FOREIGN KEY (envio_evento_id) REFERENCES FaturaEvento (id_fatura_evento),
    CONSTRAINT fk_rodadaocs_item FOREIGN KEY (espelho_item_id) REFERENCES EspelhoItem (id_espelho_item),
    CONSTRAINT ck_rodadaocs_decisao
        CHECK (decisao_ocs IS NULL OR decisao_ocs IN ('OK', 'CONTESTADA')),
    CONSTRAINT ck_rodadaocs_decisao_evento
        CHECK (decisao_ocs IS NULL OR decisao_evento_id IS NOT NULL),
    CONSTRAINT ck_rodadaocs_motivo
        CHECK ((decisao_ocs = 'CONTESTADA' AND CHAR_LENGTH(TRIM(motivo_contestacao_ocs)) BETWEEN 10 AND 500) OR (NOT (decisao_ocs <=> 'CONTESTADA') AND motivo_contestacao_ocs IS NULL)),
    CONSTRAINT ck_rodadaocs_origem
        CHECK (origem_contrato IN ('TABELA', 'TABELA_CORRIGIDA', 'CONFERIDO', 'MANUAL'))
);

-- ---------------------------------------------------------------------
-- RotinaExecucao: controle das rotinas de execucao unica (ex.: correcao da validade das Guias antigas)
-- Criada/alterada em: V14
-- ---------------------------------------------------------------------
CREATE TABLE RotinaExecucao (
    nome          VARCHAR(100) NOT NULL,
    data_execucao DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_rotina_execucao PRIMARY KEY (nome)
);

-- ---------------------------------------------------------------------
-- FKs adicionadas depois das tabelas (dependencias circulares)
-- ---------------------------------------------------------------------
ALTER TABLE Usuario
    ADD CONSTRAINT fk_usuario_assinatura FOREIGN KEY (assinatura_id) REFERENCES Assinatura (id_assinatura);
