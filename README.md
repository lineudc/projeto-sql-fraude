# projeto-sql-fraude

Capstone de detecção de fraude (SQL, SQLite). Da base bruta (6 tabelas) à tabela de modelagem `abt_fraude`, KPIs de fraude, window functions e views analíticas.

## Contexto do problema
_TODO: cenário de risco, por que a fraude é rara (~5%) e por que usar taxa e não acurácia._

## Como reproduzir
```bash
# coloque os CSVs em dados/ (ver dados/README.md)
make db      # cria fraude.db a partir dos CSVs
sqlite3 fraude.db < sql/01_abt.sql
make check   # verificações de grão e aceite
```

## Como a ABT foi montada
_TODO: tabelas que entram e as que não entram, tipo de JOIN e chave, por que 150.000 e não 150.200, colunas e ordem. Cada decisão com justificativa._

## Achados (3 a 5, com números das análises e views)
_TODO_

## Estrutura
`carga.sql` (carga dos CSVs) · `sql/01_abt.sql` · `sql/02_analises.sql` · `sql/03_views.sql` · `sql/00_checks.sql` · `dados/README.md`
