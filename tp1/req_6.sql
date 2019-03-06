/*
Req 6
Lister les codes permanents et les noms des étudiants dont le nom commence par
la lettre ‘T‘ et contient au moins la lettre ‘a’ quelque soit sa position.
*/
SELECT
    CODEPERMANENT, NOM, PRENOM
FROM
    ETUDIANT
WHERE
    NOM LIKE 'T%' OR NOM LIKE '%a%';