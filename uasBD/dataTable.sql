CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat TEXT,
    Tanggal_Lahir DATE,
    Email VARCHAR(100),
    No_Telepon VARCHAR(15)
);
CREATE TABLE Dosen (
    NIDN INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat TEXT,
    Tanggal_Lahir DATE,
    Email VARCHAR(100),
    No_Telepon VARCHAR(15)
);
CREATE TABLE Fakultas (
    Kode_Fakultas INT PRIMARY KEY,
    Nama_Fakultas VARCHAR(100)
);
CREATE TABLE Program_Studi (
    Kode_Prodi INT PRIMARY KEY,
    Nama_Prodi VARCHAR(100),
    Kode_Fakultas INT,
    FOREIGN KEY (Kode_Fakultas) REFERENCES Fakultas(Kode_Fakultas)
);
CREATE TABLE Mata_Kuliah (
    Kode_MK INT PRIMARY KEY,
    Nama_MK VARCHAR(100),
    SKS INT
);
CREATE TABLE Kelas (
    ID_Kelas INT PRIMARY KEY,
    Kode_MK INT,
    NIDN INT,
    Ruangan VARCHAR(50),
    Waktu TIMESTAMP,
    FOREIGN KEY (Kode_MK) REFERENCES Mata_Kuliah(Kode_MK),
    FOREIGN KEY (NIDN) REFERENCES Dosen(NIDN)
);
CREATE TABLE Nilai (
    ID_Nilai INT PRIMARY KEY,
    Nilai CHAR(2),
    Kode_MK INT,
    NIM INT,
    FOREIGN KEY (Kode_MK) REFERENCES Mata_Kuliah(Kode_MK),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);
CREATE TABLE Mengikuti (
    NIM INT,
    ID_Kelas INT,
    PRIMARY KEY (NIM, ID_Kelas),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (ID_Kelas) REFERENCES Kelas(ID_Kelas)
);
CREATE TABLE Terdaftar (
    NIM INT,
    Kode_Prodi INT,
    PRIMARY KEY (NIM, Kode_Prodi),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (Kode_Prodi) REFERENCES Program_Studi(Kode_Prodi)
);
CREATE TABLE Mengajar (
    NIDN INT,
    Kode_MK INT,
    PRIMARY KEY (NIDN, Kode_MK),
    FOREIGN KEY (NIDN) REFERENCES Dosen(NIDN),
    FOREIGN KEY (Kode_MK) REFERENCES Mata_Kuliah(Kode_MK)
);
