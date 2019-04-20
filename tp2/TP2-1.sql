PROMPT creation des TABLES
SET echo ON
DROP TABLE inscription;

DROP TABLE groupecours;

DROP TABLE prealable;

DROP TABLE cours;

DROP TABLE sessionuqam;

DROP TABLE etudiant;

DROP TABLE professeur;

ALTER SESSION SET nls_date_format = 'DD/MM/YYYY';

CREATE TABLE cours
  (
     sigle     CHAR(7) NOT NULL,
     titre     VARCHAR(50) NOT NULL,
     nbcredits INTEGER NOT NULL,
     CONSTRAINT cleprimairecours PRIMARY KEY (sigle)
  );

CREATE TABLE prealable
  (
     sigle          CHAR(7) NOT NULL,
     sigleprealable CHAR(7) NOT NULL,
     CONSTRAINT cleprimaireprealable PRIMARY KEY (sigle, sigleprealable),
     CONSTRAINT cesiglerefcours FOREIGN KEY (sigle) REFERENCES cours,
     CONSTRAINT cesigleprealablerefcours FOREIGN KEY (sigleprealable) REFERENCES
     cours(sigle)
  );

CREATE TABLE sessionuqam
  (
     codesession INTEGER NOT NULL,
     datedebut   DATE NOT NULL,
     datefin     DATE NOT NULL,
     CONSTRAINT cleprimairesessionuqam PRIMARY KEY (codesession)
  );

CREATE TABLE professeur
  (
     codeprofesseur CHAR(5) NOT NULL,
     nom            VARCHAR(10) NOT NULL,
     prenom         VARCHAR(10) NOT NULL,
     CONSTRAINT cleprimaireprofesseur PRIMARY KEY (codeprofesseur)
  );

CREATE TABLE groupecours
  (
     sigle           CHAR(7) NOT NULL,
     nogroupe        INTEGER NOT NULL,
     codesession     INTEGER NOT NULL,
     maxinscriptions INTEGER NOT NULL,
     codeprofesseur  CHAR(5) NOT NULL,
     CONSTRAINT cleprimairegroupecours PRIMARY KEY (sigle, nogroupe, codesession
     ),
     CONSTRAINT cesiglegrouperefcours FOREIGN KEY (sigle) REFERENCES cours,
     CONSTRAINT cecodesessionrefsessionuqam FOREIGN KEY (codesession) REFERENCES
     sessionuqam,
     CONSTRAINT cecodeprofrefprofesseur FOREIGN KEY(codeprofesseur) REFERENCES
     professeur
  );

CREATE TABLE etudiant
  (
     codepermanent CHAR(12) NOT NULL,
     nom           VARCHAR(10) NOT NULL,
     prenom        VARCHAR(10) NOT NULL,
     codeprogramme INTEGER,
     CONSTRAINT cleprimaireetudiant PRIMARY KEY (codepermanent)
  );

CREATE TABLE inscription
  (
     codepermanent   CHAR(12) NOT NULL,
     sigle           CHAR(7) NOT NULL,
     nogroupe        INTEGER NOT NULL,
     codesession     INTEGER NOT NULL,
     dateinscription DATE NOT NULL,
     dateabandon     DATE,
     note            INTEGER,
     CONSTRAINT cleprimaireinscription PRIMARY KEY (codepermanent, sigle,
     nogroupe, codesession),
     CONSTRAINT cerefgroupecours FOREIGN KEY (sigle, nogroupe, codesession)
     REFERENCES groupecours,
     CONSTRAINT cecodepermamentrefetudiant FOREIGN KEY (codepermanent)
     REFERENCES etudiant
  );

PROMPT insertion de donnees pour les essais
INSERT INTO cours
VALUES     ('INF3180',
            'Fichiers et bases de donnees',
            3);

INSERT INTO cours
VALUES     ('INF5180',
            'Conception et exploitation d''une base de donnees',
            3);

INSERT INTO cours
VALUES     ('INF1110',
            'Programmation I',
            3);

INSERT INTO cours
VALUES     ('INF1130',
            'Mathematiques pour informaticien',
            3);

INSERT INTO cours
VALUES     ('INF2110',
            'Programmation II',
            3);

INSERT INTO cours
VALUES     ('INF3123',
            'Programmation objet',
            3);

INSERT INTO cours
VALUES     ('INF2160',
            'Paradigmes de programmation',
            3);

INSERT INTO prealable
VALUES     ('INF2110',
            'INF1110');

INSERT INTO prealable
VALUES     ('INF2160',
            'INF1130');

INSERT INTO prealable
VALUES     ('INF2160',
            'INF2110');

INSERT INTO prealable
VALUES     ('INF3180',
            'INF2110');

INSERT INTO prealable
VALUES     ('INF3123',
            'INF2110');

INSERT INTO prealable
VALUES     ('INF5180',
            'INF3180');

INSERT INTO sessionuqam
VALUES     (32003,
            '3/09/2003',
            '17/12/2003');

INSERT INTO sessionuqam
VALUES     (12004,
            '8/01/2004',
            '2/05/2004');

INSERT INTO professeur
VALUES     ('TREJ4',
            'Tremblay',
            'Jean');

INSERT INTO professeur
VALUES     ('DEVL2',
            'De Vinci',
            'Leonard');

INSERT INTO professeur
VALUES     ('PASB1',
            'Pascal',
            'Blaise');

INSERT INTO professeur
VALUES     ('GOLA1',
            'Goldberg',
            'Adele');

INSERT INTO professeur
VALUES     ('KNUD1',
            'Knuth',
            'Donald');

INSERT INTO professeur
VALUES     ('GALE9',
            'Galois',
            'Evariste');

INSERT INTO professeur
VALUES     ('CASI0',
            'Casse',
            'Illa');

INSERT INTO professeur
VALUES     ('SAUV5',
            'Sauve',
            'Andre');

INSERT INTO groupecours
VALUES     ('INF1110',
            20,
            32003,
            100,
            'TREJ4');

INSERT INTO groupecours
VALUES     ('INF1110',
            30,
            32003,
            100,
            'PASB1');

INSERT INTO groupecours
VALUES     ('INF1130',
            10,
            32003,
            100,
            'PASB1');

INSERT INTO groupecours
VALUES     ('INF1130',
            30,
            32003,
            100,
            'GALE9');

INSERT INTO groupecours
VALUES     ('INF2110',
            10,
            32003,
            100,
            'TREJ4');

INSERT INTO groupecours
VALUES     ('INF3123',
            20,
            32003,
            50,
            'GOLA1');

INSERT INTO groupecours
VALUES     ('INF3123',
            30,
            32003,
            50,
            'GOLA1');

INSERT INTO groupecours
VALUES     ('INF3180',
            30,
            32003,
            50,
            'DEVL2');

INSERT INTO groupecours
VALUES     ('INF3180',
            40,
            32003,
            50,
            'DEVL2');

INSERT INTO groupecours
VALUES     ('INF5180',
            10,
            32003,
            50,
            'KNUD1');

INSERT INTO groupecours
VALUES     ('INF5180',
            40,
            32003,
            50,
            'KNUD1');

INSERT INTO groupecours
VALUES     ('INF1110',
            20,
            12004,
            100,
            'TREJ4');

INSERT INTO groupecours
VALUES     ('INF1110',
            30,
            12004,
            100,
            'TREJ4');

INSERT INTO groupecours
VALUES     ('INF2110',
            10,
            12004,
            100,
            'PASB1');

INSERT INTO groupecours
VALUES     ('INF2110',
            40,
            12004,
            100,
            'PASB1');

INSERT INTO groupecours
VALUES     ('INF3123',
            20,
            12004,
            50,
            'GOLA1');

INSERT INTO groupecours
VALUES     ('INF3123',
            30,
            12004,
            50,
            'GOLA1');

INSERT INTO groupecours
VALUES     ('INF3180',
            10,
            12004,
            50,
            'DEVL2');

INSERT INTO groupecours
VALUES     ('INF3180',
            30,
            12004,
            50,
            'DEVL2');

INSERT INTO groupecours
VALUES     ('INF5180',
            10,
            12004,
            50,
            'DEVL2');

INSERT INTO groupecours
VALUES     ('INF5180',
            40,
            12004,
            50,
            'GALE9');

INSERT INTO etudiant
VALUES     ('TREJ18088001',
            'Tremblay',
            'Jean',
            7416);

INSERT INTO etudiant
VALUES     ('TREL14027801',
            'Tremblay',
            'Lucie',
            7416);

INSERT INTO etudiant
VALUES     ('DEGE10027801',
            'Degas',
            'Edgar',
            7416);

INSERT INTO etudiant
VALUES     ('MONC05127201',
            'Monet',
            'Claude',
            7316);

INSERT INTO etudiant
VALUES     ('VANV05127201',
            'Van Gogh',
            'Vincent',
            7316);

INSERT INTO etudiant
VALUES     ('MARA25087501',
            'Marshall',
            'Amanda',
            NULL);

INSERT INTO etudiant
VALUES     ('STEG03106901',
            'Stephani',
            'Gwen',
            7416);

INSERT INTO etudiant
VALUES     ('EMEK10106501',
            'Emerson',
            'Keith',
            7416);

INSERT INTO etudiant
VALUES     ('DUGR08085001',
            'Duguay',
            'Roger',
            NULL);

INSERT INTO etudiant
VALUES     ('LAVP08087001',
            'Lavoie',
            'Paul',
            NULL);

INSERT INTO etudiant
VALUES     ('TREY09087501',
            'Tremblay',
            'Yvon',
            7316);

INSERT INTO inscription
VALUES     ('TREJ18088001',
            'INF1110',
            20,
            32003,
            '16/08/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('LAVP08087001',
            'INF1110',
            20,
            32003,
            '16/08/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('TREL14027801',
            'INF1110',
            30,
            32003,
            '17/08/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('MARA25087501',
            'INF1110',
            20,
            32003,
            '20/08/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('STEG03106901',
            'INF1110',
            20,
            32003,
            '17/08/2003',
            NULL,
            70);

INSERT INTO inscription
VALUES     ('TREJ18088001',
            'INF1130',
            10,
            32003,
            '16/08/2003',
            NULL,
            70);

INSERT INTO inscription
VALUES     ('TREL14027801',
            'INF1130',
            30,
            32003,
            '17/08/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('MARA25087501',
            'INF1130',
            10,
            32003,
            '22/08/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('DEGE10027801',
            'INF3180',
            30,
            32003,
            '16/08/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('MONC05127201',
            'INF3180',
            30,
            32003,
            '19/08/2003',
            NULL,
            60);

INSERT INTO inscription
VALUES     ('VANV05127201',
            'INF3180',
            30,
            32003,
            '16/08/2003',
            '20/09/2003',
            NULL);

INSERT INTO inscription
VALUES     ('EMEK10106501',
            'INF3180',
            40,
            32003,
            '19/08/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('DUGR08085001',
            'INF3180',
            40,
            32003,
            '19/08/2003',
            NULL,
            70);

INSERT INTO inscription
VALUES     ('TREJ18088001',
            'INF2110',
            10,
            12004,
            '19/12/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('TREL14027801',
            'INF2110',
            10,
            12004,
            '20/12/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('MARA25087501',
            'INF2110',
            40,
            12004,
            '19/12/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('STEG03106901',
            'INF2110',
            40,
            12004,
            '10/12/2003',
            NULL,
            70);

INSERT INTO inscription
VALUES     ('VANV05127201',
            'INF3180',
            10,
            12004,
            '18/12/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('DEGE10027801',
            'INF5180',
            10,
            12004,
            '15/12/2003',
            NULL,
            90);

INSERT INTO inscription
VALUES     ('MONC05127201',
            'INF5180',
            10,
            12004,
            '19/12/2003',
            '22/01/2004',
            NULL);

INSERT INTO inscription
VALUES     ('EMEK10106501',
            'INF5180',
            40,
            12004,
            '19/12/2003',
            NULL,
            80);

INSERT INTO inscription
VALUES     ('DUGR08085001',
            'INF5180',
            10,
            12004,
            '19/12/2003',
            NULL,
            80);

COMMIT;

PROMPT contenu des TABLES
SELECT *
FROM   cours;

SELECT *
FROM   prealable;

SELECT *
FROM   sessionuqam;

SELECT *
FROM   professeur;

SELECT *
FROM   groupecours;

SELECT *
FROM   etudiant;

SELECT *
FROM   inscription;



CREATE OR REPLACE TRIGGER declencheur_c1
BEFORE INSERT OR UPDATE ON sessionuqam
FOR EACH row
BEGIN
  IF :new.datefin < :new.datedebut THEN
    raise_application_error(-20000, ('Violation de contraintes de vérification C1: La date de fin de session ne devrait pas être inférieure à la date de début de session'));
  END IF;
END;

PROMPT Test de violation de la contrainte C1;
INSERT INTO sessionuqam VALUES('52001', '01/09/2019', '01/01/2000');
UPDATE sessionuqam SET datefin = '01/01/2000' WHERE codesession ='32003';
ROLLBACK;

CREATE OR REPLACE TRIGGER declencheur_c2
BEFORE UPDATE ON inscription
BEGIN
  CASE
    WHEN UPDATING('note') THEN
      DBMS_OUTPUT.PUT_LINE('Mis à jour inscription.note');
    WHEN UPDATING('dateabandon') THEN
      DBMS_OUTPUT.PUT_LINE('Mis à jour inscription.dateabandon');
    ELSE
      raise_application_error(-20001, ('Violation de contraintes de vérification C2: On ne peut mettre à jour que la note et la dateAbandon'));
  END CASE;
END;


PROMPT Test de violation de la contrainte C2;
UPDATE inscription SET nogroupe = 20 WHERE codepermanent ='TREJ18088001';
UPDATE inscription SET sigle = 'INF3180' WHERE codepermanent ='EMEK10106501';
ROLLBACK;

CREATE OR REPLACE TRIGGER declencheur_c3
BEFORE UPDATE ON inscription
FOR EACH row
BEGIN
  IF (:new.note - :old.note)/:old.note < 0.1 AND :new.note > 0 THEN
    raise_application_error(-20002, ('Violation de contraintes de vérification C3: Il est invalide de faire diminuer la valeur de la note d’un étudiant de plus de 10%.'));
  ELSIF :new.note < 0 THEN
    :new.note := 0;
    raise_application_error(-20002, ('Violation de contraintes de vérification C3: La valeur de la note doit être supérieur à zéro.'));
  END IF;
END;

PROMPT Test de violation de la contrainte C3;
UPDATE inscription SET note = 10 WHERE codepermanent ='TREJ18088001';
UPDATE inscription SET note = -2 WHERE codepermanent ='EMEK10106501';
SELECT note FROM inscription  WHERE codepermanent ='EMEK10106501';
ROLLBACK;

ALTER TABLE cours ADD frequence INTEGER;
CREATE OR REPLACE TRIGGER declencheur_c4
BEFORE INSERT ON cours
FOR EACH row
  DECLARE
    frequence INTEGER;
BEGIN
    SELECT MAX(frequence)
    INTO   frequence
    FROM   cours;
    IF frequence IS NULL THEN
        frequence := 0;
    END IF;
    :new.frequence := frequence + 1;
END;

PROMPT Test de la colonne fréquence;
INSERT INTO cours VALUES('INF5080', 'Patrons de conception génie logiciel', 3, NULL);
INSERT INTO cours VALUES('INF9320', 'Bases de donnés NoSQL', 3, NULL);
INSERT INTO cours VALUES('INF7654', 'Exploration de données', 3, NULL);
SELECT * FROM cours;
ROLLBACK;
