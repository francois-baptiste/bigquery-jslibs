----------------------------
-- Copyright (C) 2021 CARTO
----------------------------

CREATE OR REPLACE FUNCTION @@RS_PREFIX@@constructors.ST_MAKEENVELOPE
(FLOAT8, FLOAT8, FLOAT8, FLOAT8)
-- (xmin, ymin, xmax, ymax)
RETURNS GEOMETRY
IMMUTABLE
AS $$
    SELECT ST_GeomFromText('POLYGON((' || $1 || ' ' || $2 || ',' || $1 || ' ' || $4 || ',' || $3 || ' ' || $4 || ',' || $3 || ' ' || $2 || ',' || $1 || ' ' || $2 || '))')
$$ LANGUAGE sql;