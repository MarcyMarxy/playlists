-- Dataset from https://www.kaggle.com/datasets/nadintamer/top-spotify-tracks-of-2018
-- sqlite3 top2018.db

-- .read top2018spotify.sql
.mode column
.headers on

.import --csv top2018.csv temp 

CREATE TABLE "songs" (
    "id" INTEGER, 
    "name" TEXT NOT NULL, 
    "artists" TEXT NOT NULL, 
    "danceability" REAL,
    "energy" REAL, 
    "key" INTEGER, 
    "loudness" REAL, 
    "mode" TEXT,
    "speechiness" REAL, 
    "acousticness" REAL, 
    "instrumentalness" REAL, 
    "liveness" REAL,
    "valence" REAL, 
    "tempo" REAL, 
    "duration_ms" INTEGER, 
    "time_signature" INTEGER,
    PRIMARY KEY("id")
);

INSERT INTO "songs" ("name", "artists", "danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo", "duration_ms", "time_signature")
SELECT "name", "artists", "danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo", "duration_ms", "time_signature" FROM "temp";

-- DROP TABLE "temp";
