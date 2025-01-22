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