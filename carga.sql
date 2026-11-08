-- Carga das 6 tabelas cruas no SQLite. Uso (na raiz do projeto): sqlite3 fraude.db < carga.sql
-- Os CSVs ficam em dados/ (fora do Git). Células vazias viram NULL ao final.
PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS transacoes;
DROP TABLE IF EXISTS scores_comportamentais;
DROP TABLE IF EXISTS scores_financeiros;
DROP TABLE IF EXISTS scores_modelo;
DROP TABLE IF EXISTS dim_paises;
DROP TABLE IF EXISTS dim_categorias;

CREATE TABLE transacoes (id_transacao INTEGER, data_compra TEXT, valor_compra REAL, pais TEXT, produto TEXT, categoria_produto TEXT, entrega_doc_1 TEXT, entrega_doc_2 TEXT, entrega_doc_3 TEXT, canal_venda TEXT, is_teste INTEGER, versao_api TEXT);
CREATE TABLE scores_comportamentais (id_transacao INTEGER, score_1 REAL, score_2 REAL, score_4 REAL, score_5 REAL, score_7 REAL, dt_calculo_score TEXT, versao_modelo_comportamental TEXT);
CREATE TABLE scores_financeiros (id_transacao INTEGER, score_3 REAL, score_6 REAL, score_9 REAL, score_10 REAL, moeda_calculo TEXT, recalculado INTEGER);
CREATE TABLE scores_modelo (id_transacao INTEGER, score_8 REAL, score_fraude_modelo REAL, fraude INTEGER, experimento TEXT, threshold_decisao REAL);
CREATE TABLE dim_paises (sigla_pais TEXT, nome_pais TEXT, regiao TEXT, moeda_local TEXT, locale TEXT, ativo INTEGER);
CREATE TABLE dim_categorias (id_categoria TEXT, departamento TEXT, nivel_risco_categoria TEXT, requer_doc_adicional INTEGER, ativo INTEGER);

.mode csv
.import --skip 1 dados/transacoes.csv transacoes
.import --skip 1 dados/scores_comportamentais.csv scores_comportamentais
.import --skip 1 dados/scores_financeiros.csv scores_financeiros
.import --skip 1 dados/scores_modelo.csv scores_modelo
.import --skip 1 dados/dim_paises.csv dim_paises
.import --skip 1 dados/dim_categorias.csv dim_categorias

-- Células vazias do CSV viram NULL (o .import grava texto vazio).
.mode list
UPDATE transacoes SET entrega_doc_2 = NULL WHERE entrega_doc_2 = '';
UPDATE transacoes SET pais = NULL WHERE pais = '';
UPDATE scores_comportamentais SET score_2 = NULL WHERE score_2 = '';
UPDATE scores_comportamentais SET score_4 = NULL WHERE score_4 = '';
UPDATE scores_financeiros SET score_3 = NULL WHERE score_3 = '';
UPDATE scores_financeiros SET score_10 = NULL WHERE score_10 = '';
UPDATE scores_financeiros SET score_6 = NULL WHERE score_6 = '';
UPDATE scores_financeiros SET score_9 = NULL WHERE score_9 = '';
CREATE INDEX IF NOT EXISTS ix_tr_id ON transacoes(id_transacao);
CREATE INDEX IF NOT EXISTS ix_cb_id ON scores_comportamentais(id_transacao);
CREATE INDEX IF NOT EXISTS ix_fi_id ON scores_financeiros(id_transacao);
CREATE INDEX IF NOT EXISTS ix_mo_id ON scores_modelo(id_transacao);
