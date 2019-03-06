/*
Req 12
Supprimer tous les étudiants de la base de données à l’exception des étudiants
dont le nom commence par la lettre ‘T’. Afficher le(s) contenu(s) de(s) la table(s) concernée(s).
*/
DELETE
FROM
    INSCRIPTION
WHERE
    CODEPERMANENT IN (
        SELECT
            CODEPERMANENT
        FROM
            ETUDIANT
        WHERE
            ETUDIANT.NOM NOT LIKE 'T%'
    );
DELETE
FROM
    ETUDIANT
WHERE
    ETUDIANT.NOM NOT LIKE 'T%';
SELECT * FROM INSCRIPTION;
SELECT * FROM ETUDIANT;
