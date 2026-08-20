-- Minu esimene UrbanStyle päring
-- Nimi: Tiiu Kumar
-- Kuupäev: 17.06.2026

-- Loo meeskonnaliikmete tabel
CREATE TABLE IF NOT EXIST team_members (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(199),
  week INT DEFAULT 0,
  joined_at TIMESTAMP DEFAULT NOW()
  );
--Lisa minu andmed
INSERT INTO team_members (name, role, week)
VALUES ('Tiiu Kumar', 'Andmeanaluutik', 0);

-- Vaata tulemust
SELECT * FROM team_members ORDER BY joined_at;
