/*
Req 7
Retourner les sigles des cours non encore enseignés par le professeur
dont le nom est 'Galois','Evariste'.
*/
SELECT
    DISTINCT(SIGLE)
FROM
    GROUPECOURS
WHERE
    GROUPECOURS.SIGLE NOT IN (
        SELECT DISTINCT(SIGLE) FROM GROUPECOURS WHERE CODEPROFESSEUR = (
            SELECT
                CODEPROFESSEUR
            FROM
                PROFESSEUR
            WHERE
                NOM = 'Galois' AND PRENOM = 'Evariste'
            AND
                ROWNUM = 1
        )
    );