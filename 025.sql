/*Please add ; after each select statement*/
CREATE PROCEDURE nullIntern()
BEGIN
    -- SELECT COUNT(*) as number_of_nulls FROM departments WHERE description IS 'NULL';
    SELECT 
        COUNT(dataDep.gg) as number_of_nulls
    FROM (
        SELECT '' as gg FROM departments WHERE
            -- ( description LIKE '%NULL%') OR 
            ( description IS NULL ) OR 
            REGEXP_LIKE(TRIM(description), '^(NULL|nil|-)$', 'i') -- OR
            -- REGEXP_LIKE(description, '^[ ]+(NULL|nil|-)[ ]+$', 'i') -- OR
    ) dataDep
    GROUP BY 
        dataDep.gg;
END