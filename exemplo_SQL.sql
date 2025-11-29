-- exemplo_SQL.sql
-- Consulta exemplo para investigação de divergência entre valores esperados e carregados
-- (ajuste nomes de tabelas/colunas conforme seu ambiente)

-- 1) Sumário por conta / periodo para checagem de totais
SELECT
  account_id,
  period,
  SUM(amount) AS total_amount,
  COUNT(*) AS row_count
FROM staging_transactions
WHERE period BETWEEN '2024-01' AND '2024-12'
GROUP BY account_id, period
ORDER BY account_id, period;

-- 2) Linhas com valores nulos ou dados inconsistentes
SELECT *
FROM staging_transactions
WHERE amount IS NULL
   OR account_id IS NULL
   OR TRIM(description) = '';

-- 3) Exemplo de join para comparar origem x destino (reconciliação básica)
SELECT s.transaction_id, s.account_id, s.amount AS amount_stg, t.amount AS amount_target
FROM staging_transactions s
LEFT JOIN target_ledger t
  ON s.transaction_id = t.transaction_id
WHERE COALESCE(s.amount, 0) <> COALESCE(t.amount, 0)
ORDER BY s.transaction_id
LIMIT 200;
