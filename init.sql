--     ____             __
--    / __ \____  _____/ /_____  _____
--   / / / / __ \/ ___/ //_/ _ \/ ___/  POSTGRESQL
--  / /_/ / /_/ / /__/ ,< /  __/ /      Incident Lab
-- /_____/\____/\___/_/|_|\___/_/

-- =================================================
-- 1. TWORZENIE TABELI
-- =================================================

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  user_id INT,
  amount DECIMAL,
  status TEXT,
  created_at TIMESTAMP
);

-- =================================================
-- 2. DODANIE TESTOWYCH DANYCH
-- =================================================

INSERT INTO transactions (user_id, amount, status, created_at)
VALUES
(1, 100.50, 'SUCCESS', NOW()),
(2, 250.00, 'FAILED', NOW()),
(3, 300.00, 'SUCCESS', NOW()),
(4, 15.00, 'FAILED', NOW()),
(5, 500.00, 'SUCCESS', NOW());

-- =================================================
-- 3. ANALIZA INCYDENTU (INVESTIGATION)
-- =================================================

-- KROK 1: PODSUMOWANIE STATUSÓW (OGÓLNA SKALA PROBLEMU)
SELECT status, COUNT(*) FROM transactions GROUP BY status;

-- KROK 2: WYCIĄGNIĘCIE LISTY WSZYSTKICH NIEUDANYCH TRANSAKCJI
SELECT * FROM transactions WHERE status = 'FAILED';

-- KROK 3: SORTOWANIE BŁĘDÓW OD NAJWYŻSZEJ KWOTY (SZUKANIE TRANSAKCJI O WYSOKIM PRIORYTECIE)
SELECT * FROM transcations WHERE status = 'FAILED' ORDER BY amount DESC;

-- KROK 4: ANALIZA OSI CZASU (KIEDY WYSTĄPIŁO NAJWIĘCEJ BŁĘDÓW)
SELECT created_at, COUNT(*) FROM transactions WHERE status = 'FAILED' GROUP BY created_at ORDER BY COUNT(*) DESC;
