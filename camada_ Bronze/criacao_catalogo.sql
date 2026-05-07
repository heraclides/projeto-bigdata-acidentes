-- Databricks notebook source
-- criando Catalogo
CREATE CATALOG IF NOT EXISTS projeto_profissional_big_data;

-- COMMAND ----------

-- criando Schema
create schema if not exists projeto_profissional_big_data.datatran_2018;

-- COMMAND ----------

-- criando volume 
CREATE VOLUME IF NOT EXISTS projeto_profissional_big_data.datatran_2018.dados;

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW vw_csv_datatran
USING CSV
OPTIONS (
  path "/Volumes/projeto_profissional_big_data/datatran_2018/dados/datatran2018.csv",
  header "true",
  inferSchema "true",
  sep ";",
  encoding "ISO-8859-1"
);

-- COMMAND ----------

CREATE OR REPLACE TABLE projeto_profissional_big_data.datatran_2018.bronze_datatran18
USING DELTA
AS
SELECT * FROM vw_csv_datatran;

-- COMMAND ----------

SELECT * 
FROM projeto_profissional_big_data.datatran_2018.bronze_datatran18
LIMIT 5;
