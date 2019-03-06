# TP 1

<p align="center">
  <img src="https://github.com/ivansabik/INF3180/blob/master/tp1/doc/erd.png?raw=true"/>
</p>

```sql
CREATE USER inf3180 IDENTIFIED BY inf3180;
GRANT RESOURCE TO inf3180;
GRANT CONNECT TO inf3180;
GRANT CREATE VIEW TO inf3180;
GRANT CREATE SESSION TO inf3180;
GRANT UNLIMITED TABLESPACE TO inf3180;
```

## Exercice 1

1. Faite une représentation UML de la BD selon la méthode présentée dans le cours_02 sur l’algèbre relationnelle (acétate 15).
2. Formulez les requêtes suivantes en algèbre relationnelle (format textuel/à la main). Représentez la requête sous forme d’arbre algébrique (format textuel/ à la main). Aussi, donnez la solution pour chaque requête en SQL avec son résultat.

#### Req 1

Donnez les informations sans répétition des sigles, titres des cours pris par l’étudiant Lavoie Paul
ainsi que les noms des professeurs qui donnent ces cours.

#### Req 2

On cherche les code et noms des professeurs, sans répétition, qui ont enseigné à la fois les cours INF3180 et INF2110, durant la session dont le code est 12004. Aussi, les code et noms des professeurs, sans répétition, qui ont enseigné les cours INF1130 ou INF1110, durant la session dont le code est 32003

#### Req 3

On cherche les informations sur différents étudiants qui ont reçu la même note pour le même cours (sigle) à la même session (codesession). Le résultat doit être affiché avec les attributs suivants (code permanent 1, code permanent 2, sigle, codesession, note).

#### Req 4

On cherche les codes permanents, noms et prénoms des étudiants inscrits aux cours dont les sigles commencent par les lettres ‘InF’, enseignés par le professeur dont le nom est 'De Vinci' des sessions 32003 ou 12004. Ces étudiants sont considérés n’avoir pas abandonné le cours durant cette session.

## Exercice 2

Formulez les requêtes suivantes en SQL et donnez leurs résultats

#### Req 5

On cherche les codes et les noms des professeurs, sans répétition, qui ont enseigné au plus un cours offert à la session 32003 ou au moins un cours offert aux deux sessions (toutes les deux) dont les codes sont 12004 et 22005.

#### Req 6

Lister les codes permanents et les noms des étudiants dont le nom commence par la lettre ‘T‘ et contient au moins la lettre ‘a’ quelque soit sa position.

#### Req 7

Retourner les sigles des cours non encore enseignés par le professeur dont le nom est
'Galois','Evariste'.

#### Req 8

Afficher la différence entre la moyenne des notes des cours donnés durant la session dont le code est 32203 et ceux de la session dont le code est 12204.

#### Req 9

Pour chaque code session et sigle d’un cours, retourner le sigle du cours et son titre et la différence entre la meilleure et la plus mauvaise note pour un cours donné.

#### Req 10

Pour tous les cours qui ont une moyenne des notes supérieure ou égale à 80 pour la session dont le code est 32003, mettre à jour la colonne dateFin de la table SessionUQAM en la mettant au 22 décembre 2003.

#### Req 11

Supprimer les colonnes dateAbandon et maxInscriptions de(s) la table(s) concernée(s). Afficher le(s) contenu(s) de(s) la table(s) concernée(s).


#### Req 12

Supprimer tous les étudiants de la base de données à l’exception des étudiants dont le nom commence par la lettre ‘T’. Afficher le(s) contenu(s) de(s) la table(s) concernée(s).
