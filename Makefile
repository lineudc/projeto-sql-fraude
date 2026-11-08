# Uso: make db | make check | make ref | make shell
DB ?= fraude.db
.PHONY: db check ref shell
db:    ## recria o banco SQLite a partir de dados/*.csv
	rm -f $(DB) && sqlite3 $(DB) < carga.sql
check: ## verificações de grão e aceite (sql/00_checks.sql)
	sqlite3 -header -column $(DB) < sql/00_checks.sql
ref:   ## roda a referência fornecida (comparação com o seu resultado)
	sqlite3 $(DB) < sql/referencia/01_abt_referencia.sql && sqlite3 $(DB) < sql/referencia/02_analises_referencia.sql
shell:
	sqlite3 -header -column $(DB)
