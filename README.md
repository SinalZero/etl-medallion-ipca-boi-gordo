# ETL Medallion Architecture – IPCA x Boi Gordo (Databricks)

## 📌 Visão Geral
Este projeto implementa um pipeline de dados utilizando a **arquitetura Medallion (Bronze, Silver, Gold)** no Databricks, com foco na análise econômica entre o **IPCA (inflação)** e o **preço do boi gordo**.

O objetivo é demonstrar práticas de **engenharia de dados**, modelagem analítica e geração de **insights econômicos** utilizando Spark, SQL e Delta Lake.

---

## 🏗 Arquitetura do Projeto

**Bronze**
- Ingestão de dados brutos
- IPCA (CSV manual, simulando ingestão externa)
- Boi Gordo (dados econômicos)
- Adição de timestamp de ingestão

**Silver**
- Limpeza e padronização
- Conversão de tipos (date, double, timestamp)
- Remoção de metadados e registros inválidos
- Join econômico por data

**Gold**
- Criação de métricas e indicadores finais
- Variação percentual do boi gordo
- IPCA acumulado
- Comparações relativas e análises estatísticas
- Views analíticas para consumo

---

## 📁 Estrutura de Pastas

```text
notebooks/  -> Processos ETL (Bronze, Silver, Gold)
sql/        -> Consultas analíticas SQL (camada Gold)
images/     -> Evidências visuais do Databricks e resultados

