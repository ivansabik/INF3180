/*
Req 3
On cherche les informations sur différents étudiants qui ont reçu la même note
pour le même cours (sigle) à la même session (codesession). Le résultat doit être affiché
avec les attributs suivants (code permanent 1, code permanent 2, sigle, codesession, note).
*/
SELECT
    INSCRIPTION.CODEPERMANENT, INSCRIPTION2.CODEPERMANENT2,
    INSCRIPTION.SIGLE, INSCRIPTION.CODESESSION, INSCRIPTION.NOTE
FROM
    INSCRIPTION
JOIN
    (SELECT
        CODEPERMANENT AS CODEPERMANENT2, NOTE, SIGLE, CODESESSION
    FROM
        INSCRIPTION) INSCRIPTION2
ON (
    INSCRIPTION.NOTE = INSCRIPTION2.NOTE AND
    INSCRIPTION.SIGLE = INSCRIPTION2.SIGLE AND
    INSCRIPTION.CODESESSION = INSCRIPTION2.CODESESSION
)
WHERE
    INSCRIPTION.CODEPERMANENT != INSCRIPTION2.CODEPERMANENT2;