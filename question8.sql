SELECT Device_Type, 
    CASE
        WHEN Stats_Access_Link LIKE '%https://%-%/%'
            THEN REGEXP_SUBSTR(SUBSTR(Stats_Access_Link, INSTR(Stats_Access_Link, 'https://')), '[a-zA-Z0-9_\.]+')
        WHEN Stats_Access_Link LIKE '%http://%-%/%'
            THEN REGEXP_SUBSTR(SUBSTR(Stats_Access_Link, INSTR(Stats_Access_Link, 'http://')), '[a-zA-Z0-9_\.]+')
        ELSE REGEXP_SUBSTR(Stats_Access_Link, '[a-zA-Z0-9_\.]+')
    END AS Pure_URL
FROM Table_Name
GROUP BY Device_Type, Pure_URL;
