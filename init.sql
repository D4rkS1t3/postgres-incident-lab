-- 1. TWORZENIE TABELI
CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  user_id INT,
  amount DECIMAL,
  status TEXT,
  created_at TIMESTAMP
);

-- 2. DODANIE TESTOWYCH DANYCH
INSERT INTO transactions (user_id, amount, status, created_at)
VALUES
(1, 100.50, 'SUCCESS', NOW()),
(2, 250.00, 'FAILED', NOW()),
(3, 300.00, 'SUCCESS', NOW()),
(4, 15.00, 'FAILED', NOW()),
(5, 500.00, 'SUCCESS', NOW());

-- 3. OBSŁUGA INCYDENTU
-- SZUKANIE NIEUDANYCH TRANSAKCJI
SELECT * FROM transactions WHERE status = 'FAILED';

-- PODSUMOWANIE STATUSÓW
SELECT status, COUNT(*) FROM transactions GROUP BY status;
