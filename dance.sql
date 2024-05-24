SELECT "name", "artists", "danceability", "energy", "valence", "loudness", "liveness", "tempo", "time_signature", "key", "mode", "duration_ms" 
FROM "songs" WHERE "danceability" >= 0.75 AND "energy" >= 0.75 AND "valence" >= 0.5 
ORDER BY "time_signature" DESC, "tempo" DESC, "valence" DESC, "liveness" DESC, "mode" ASC, "loudness" ASC;

-- sqlite3 -cmd ".mode csv" -cmd ".header on" -cmd ".output dance.csv" top2018.db < dance.sql