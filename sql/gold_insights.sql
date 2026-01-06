/* =========================================================
   GOLD INSIGHTS
   Projeto: ETL Medallion - IPCA x Boi Gordo
   Camada: Gold
   Objetivo: Análises econômicas e indicadores finais
   ========================================================= */

/* ---------------------------------------------------------
   View base de insights
--------------------------------------------------------- */
CREATE OR REPLACE VIEW gold.vw_insights AS
SELECT
    data,
    boi_gordo,
    ipca,
    variacao_boi,
    ipca_acumulado
FROM workspace.gold.insights;

/* ---------------------------------------------------------
   Status relativo do boi x inflação
--------------------------------------------------------- */
SELECT
    data,
    ipca,
    variacao_boi,
    CASE
        WHEN variacao_boi > ipca THEN 'Boi acima da inflação'
        WHEN variacao_boi < ipca THEN 'Boi abaixo da inflação'
        ELSE 'Empate'
    END AS status_relativo
FROM workspace.gold.vw_insights;

/* ---------------------------------------------------------
   Preço real do boi ajustado pelo IPCA acumulado
--------------------------------------------------------- */
SELECT
    data,
    boi_gordo AS boi_nominal,
    ipca_acumulado,
    boi_gordo / (1 + ipca_acumulado / 100) AS boi_preco_real
FROM workspace.gold.vw_insights;

/* ---------------------------------------------------------
   Volatilidade do boi e do IPCA
--------------------------------------------------------- */
SELECT
    STDDEV(variacao_boi) AS volatilidade_boi,
    STDDEV(ipca) AS volatilidade_ipca
FROM workspace.gold.vw_insights;

/* ---------------------------------------------------------
   Correlação entre boi e inflação
--------------------------------------------------------- */
SELECT
    CORR(variacao_boi, ipca) AS correlacao_boi_ipca,
    CORR(boi_gordo, ipca_acumulado) AS correlacao_boi_ipca_acumulado
FROM workspace.gold.vw_insights;

/* ---------------------------------------------------------
   Detecção de outliers na variação do boi
--------------------------------------------------------- */
SELECT
    data,
    variacao_boi,
    ipca
FROM workspace.gold.vw_insights
WHERE ABS(variacao_boi) > 3;
