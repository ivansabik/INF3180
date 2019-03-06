/*
Req 11
Supprimer les colonnes dateAbandon et maxInscriptions de(s) la table(s) concernée(s).
Afficher le(s) contenu(s) de(s) la table(s) concernée(s).
*/
ALTER TABLE INSCRIPTION DROP COLUMN DATEABANDON;
ALTER TABLE GROUPECOURS DROP COLUMN MAXINSCRIPTIONS;
SELECT * FROM INSCRIPTION;
SELECT * FROM GROUPECOURS;
