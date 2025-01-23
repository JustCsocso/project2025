/* https://www.figma.com/board/jkzhAXLYT27vzMmPu4iaPT/Canwe-database-uml-(Community)?node-id=0-1&t=1cV3hFdbE6nj8gmW-1 */
/* https://www.figma.com/board/y2DQaCEDYDq6Nw7bL8Pegz/ERD-DTA-DB-SQL-(Community)?node-id=0-1&t=sIqfYNDxklyD8lia-1 */







CREATE DATABASE AutoSzerviz DEFAULT CHARSET=utf8 Collate=utf8_hungarian_ci;

USE AutoSzerviz;

CREATE TABLE Alkatreszek (
    alkatresz_id INT PRIMARY KEY AUTO_INCREMENT,
    alkatresz_nev VARCHAR(255) NOT NULL,
    alkatresz_leiras DATE NOT NULL,
    ar INT NOT NULL
);

CREATE TABLE Ugyfelek (
    ugyfel_id INT PRIMARY KEY AUTO_INCREMENT,
    kereszt_nev VARCHAR(255) NOT NULL,
    vezeteknev VARCHAR(255) NOT NULL,
    telefonszam VARCHAR(20),
    email VARCHAR(255),
    cim VARCHAR(255)
);

CREATE TABLE Jarmuvek (
    jarmu_id INT PRIMARY KEY AUTO_INCREMENT,
    rendszam VARCHAR(50) NOT NULL,
    marka VARCHAR(255) NOT NULL,
    modell VARCHAR(255) NOT NULL,
    evjarat INT NOT NULL,
    ugyfel_id INT NOT NULL,
    FOREIGN KEY (ugyfel_id) REFERENCES Ugyfelek(ugyfel_id) ON DELETE CASCADE
);

CREATE TABLE Munkak (
    munka_id INT PRIMARY KEY AUTO_INCREMENT,
    munkaleiras VARCHAR(255) NOT NULL,
    datum DATE NOT NULL,
    jarmu_id INT NOT NULL,
    FOREIGN KEY (jarmu_id) REFERENCES Jarmuvek(jarmu_id) ON DELETE CASCADE
);

CREATE TABLE Szamlak (
    szamla_id INT PRIMARY KEY AUTO_INCREMENT,
    ugyfel_id INT NOT NULL,
    kiallitas_datum DATE NOT NULL,
    osszeg INT NOT NULL,
    FOREIGN KEY (ugyfel_id) REFERENCES Ugyfelek(ugyfel_id) ON DELETE CASCADE
);

CREATE TABLE Munkahoz_rendelt_alkatreszek (
    id INT PRIMARY KEY AUTO_INCREMENT,
    munka_id INT NOT NULL,
    alkatresz_id INT NOT NULL,
    mennyiseg VARCHAR(50) NOT NULL,
    FOREIGN KEY (munka_id) REFERENCES Munkak(munka_id) ON DELETE CASCADE,
    FOREIGN KEY (alkatresz_id) REFERENCES Alkatreszek(alkatresz_id) ON DELETE CASCADE
);

CREATE TABLE Szamlahoz_rendelt_munkak (
    id INT PRIMARY KEY AUTO_INCREMENT,
    szamla_id INT NOT NULL,
    munka_id INT NOT NULL,
    FOREIGN KEY (szamla_id) REFERENCES Szamlak(szamla_id) ON DELETE CASCADE,
    FOREIGN KEY (munka_id) REFERENCES Munkak(munka_id) ON DELETE CASCADE
);

INSERT INTO Alkatreszek (alkatresz_nev, alkatresz_leiras, ar)
VALUES ('Olajszűrő', '2025-01-01', 5000),
       ('Fékbetét', '2025-01-01', 10000),
       ('Gyújtógyertya', '2025-01-01', 3000);

INSERT INTO Ugyfelek (kereszt_nev, vezeteknev, telefonszam, email, cim)
VALUES ('János', 'Kovács', '06123456789', 'janos.kovacs@example.com', 'Budapest, Fő utca 1.'),
       ('Anna', 'Nagy', '06111223344', 'anna.nagy@example.com', 'Debrecen, Kossuth tér 2.');

INSERT INTO Jarmuvek (rendszam, marka, modell, evjarat, ugyfel_id)
VALUES ('ABC-123', 'Toyota', 'Corolla', 2020, 1),
       ('XYZ-987', 'Ford', 'Focus', 2018, 2);

INSERT INTO Munkak (munkaleiras, datum, jarmu_id)
VALUES ('Olajcsere', '2025-01-22', 1),
       ('Fékrendszer ellenőrzés', '2025-01-23', 2);

INSERT INTO Szamlak (ugyfel_id, kiallitas_datum, osszeg)
VALUES (1, '2025-01-22', 5000),
       (2, '2025-01-23', 10000);

INSERT INTO Munkahoz_rendelt_alkatreszek (munka_id, alkatresz_id, mennyiseg)
VALUES (1, 1, '1 db'),
       (2, 2, '2 db');

INSERT INTO Szamlahoz_rendelt_munkak (szamla_id, munka_id)
VALUES (1, 1),
       (2, 2);


Show tables;
Select * From Alkatreszek;
Select * From jarmuvek;
Select * From munkahoz_rendelt_alkatreszek;
Select * From munkak;
Select * From szamlahoz_rendelt_munkak;
Select * From szamlak;
Select * From ugyfelek;


