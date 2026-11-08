# projeto-sql-fraude

Reconstrução de uma tabela de modelagem de fraude em SQL (SQLite) e análise dos principais fatores de risco.

> Projeto capstone de um curso de pós-graduação em Data Science e IA. Trabalho em andamento: os scripts e as seções marcadas com TODO estão sendo escritos.

## Contexto do problema
_TODO: 2-3 frases. Fraude é rara (~5%); o objetivo é montar a base de treino e entender onde o risco se concentra._

## Dados
Seis tabelas cruas, ligadas por `id_transacao` (as quatro de transação) e por país/categoria (as duas dimensões). Detalhes e dicionário em [dados/README.md](dados/README.md). Os CSVs não são versionados.

## Como a `abt_fraude` foi montada
_TODO: tabelas que entram e as que não entram, tipo de JOIN e chave, filtro `is_teste = 0` (150.200 → 150.000) com a justificativa, colunas e ordem. Cada decisão com motivo._ Script: [sql/01_abt.sql](sql/01_abt.sql).

## Análises realizadas
_TODO: lista curta das perguntas respondidas._ Scripts: [sql/02_analises.sql](sql/02_analises.sql) e [sql/03_views.sql](sql/03_views.sql).

## Principais achados
_TODO: 3 a 5 bullets, cada um com número + implicação._

## Recomendações e materiais
_TODO: recomendação central._ Relatório: [relatorio/recomendacoes.md](relatorio/recomendacoes.md).

## Como reproduzir
Pré-requisito: SQLite 3.32 ou superior (`.import --skip`).
```bash
# 1. coloque os 6 CSVs em dados/ (ver dados/README.md)
make db                                  # cria fraude.db a partir dos CSVs
sqlite3 fraude.db < sql/01_abt.sql       # cria abt_fraude
make check                               # verificações de grão e aceite
sqlite3 fraude.db < sql/02_analises.sql
sqlite3 fraude.db < sql/03_views.sql
```
Dialeto: SQLite (sem `DATE_TRUNC`, `SAFE_DIVIDE` nem `MATERIALIZED VIEW`; usa `strftime`, `NULLIF` e views comuns).

## Estrutura
```
projeto-sql-fraude/
├── README.md
├── carga.sql            # carga dos CSVs no SQLite
├── Makefile             # make db | check | shell
├── sql/                 # 00_checks, 01_abt, 02_analises, 03_views
├── relatorio/           # recomendacoes.md
├── apresentacao/        # deck com os insights
├── assets/img/          # gráficos
└── dados/               # README.md; CSVs ignorados pelo Git
```

## Autor
Lineu Del Ciampo · 2026
