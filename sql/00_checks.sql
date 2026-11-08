-- Verificações de grão e de aceite. Rodar depois de `make db` (e de criar a sua abt_fraude).
-- 1) A chave id_transacao é única em cada tabela de transação? (linhas = distintos)
SELECT 'transacoes' AS tabela, COUNT(*) AS linhas, COUNT(DISTINCT id_transacao) AS distintos FROM transacoes
UNION ALL SELECT 'scores_comportamentais', COUNT(*), COUNT(DISTINCT id_transacao) FROM scores_comportamentais
UNION ALL SELECT 'scores_financeiros',     COUNT(*), COUNT(DISTINCT id_transacao) FROM scores_financeiros
UNION ALL SELECT 'scores_modelo',          COUNT(*), COUNT(DISTINCT id_transacao) FROM scores_modelo;
-- 2) Há id_transacao sem par em alguma tabela? (esperado 0 em cada linha)
SELECT 'sem_comportamental' AS furo, COUNT(*) FROM transacoes t LEFT JOIN scores_comportamentais x USING (id_transacao) WHERE x.id_transacao IS NULL
UNION ALL SELECT 'sem_financeiro', COUNT(*) FROM transacoes t LEFT JOIN scores_financeiros x USING (id_transacao) WHERE x.id_transacao IS NULL
UNION ALL SELECT 'sem_modelo',     COUNT(*) FROM transacoes t LEFT JOIN scores_modelo x USING (id_transacao) WHERE x.id_transacao IS NULL;
-- 3) Critério de aceite da ABT (descomente quando a tabela existir):
-- SELECT COUNT(*) AS linhas, COUNT(DISTINCT rowid) AS distintos FROM abt_fraude;   -- 150000
-- SELECT ROUND(100.0*AVG(fraude), 3) AS taxa_fraude_pct FROM abt_fraude;           -- cerca de 5
