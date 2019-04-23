# INF3180

Pour le cours INF3105 Fichiers et Bases de Données‎ (Hiver 2019 -  Fatiha Sadat)

Pour démarrer le serveur oracle avec docker:
```
docker-compose up
```

Pour créer l'usager pour la bd:
```sql
CREATE USER inf3180 IDENTIFIED BY inf3180;
GRANT RESOURCE TO inf3180;
GRANT CONNECT TO inf3180;
GRANT CREATE VIEW TO inf3180;
GRANT CREATE SESSION TO inf3180;
GRANT UNLIMITED TABLESPACE TO inf3180;
```
