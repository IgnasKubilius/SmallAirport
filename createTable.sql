CREATE TABLE igku4681.OroUostas
( 
    ID              CHAR(7)     NOT NULL,
    Miestas         CHAR(15)    NOT NULL,
    Pavadinimas     CHAR(50)    NOT NULL,

    PRIMARY KEY  (ID)
);

CREATE TABLE igku4681.Lektuvas
(
    ID             CHAR(7)    NOT NULL,
    Modelis        CHAR(40)   NOT NULL,
    VietuSkaicius  SMALLINT   NOT NULL,
    Bukle          CHAR(15)   NOT NULL,  

    PRIMARY KEY (ID)
);

CREATE TABLE igku4681.Skrydis 
(
    ID             CHAR(7)     NOT NULL,
    Laikas         TIMESTAMP   NOT NULL,
    Bukle          CHAR(30)    NOT NULL,
    LektuvasID     CHAR(7)     NOT NULL,
    IsvykimoVieta  CHAR(50)    NOT NULL,
    AtvykimoVieta  CHAR(50)    NOT NULL,
    OroUostasID    CHAR(7)     NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (LektuvasID) REFERENCES Lektuvas(ID) ON DELETE CASCADE,
    FOREIGN KEY (OroUostasID) REFERENCES OroUostas(ID) ON DELETE CASCADE
);

CREATE TABLE igku4681.Keleivis 
(
    ID             CHAR(7)    NOT NULL,
    Vardas         CHAR(20)   NOT NULL, 
    Pavarde        CHAR(30)   NOT NULL,
    SkrydisID      CHAR(7)    NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (SkrydisID) REFERENCES Skrydis(ID) ON DELETE CASCADE
);

