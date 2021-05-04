-----------------------------------------------------------------------
--
-- Copyright (C) 2021 CARTO
--
-----------------------------------------------------------------------

CREATE OR REPLACE FUNCTION `@@BQ_PROJECTID@@.@@BQ_DATASET_TRANSFORMATIONS@@.__BUFFER`
    (geojson STRING, radius FLOAT64, units STRING, steps INT64)
    RETURNS STRING
    DETERMINISTIC
    LANGUAGE js
    OPTIONS (library=["@@TRANSFORMATIONS_BQ_LIBRARY@@"])
AS """
    if (!geojson || radius == null) {
        return null;
    }
    let options = {};
    if(units)
    {
        options.units = units;
    }
    if(steps != null)
    {
        options.steps = Number(steps);
    }
    let buffer = turf.buffer(JSON.parse(geojson), Number(radius), options);
    return JSON.stringify(buffer.geometry);
""";

CREATE OR REPLACE FUNCTION `@@BQ_PROJECTID@@.@@BQ_DATASET_TRANSFORMATIONS@@.ST_BUFFER`
    (geog GEOGRAPHY, radius FLOAT64, units STRING, steps INT64)
AS (
    ST_GEOGFROMGEOJSON(`@@BQ_PROJECTID@@`.@@BQ_DATASET_TRANSFORMATIONS@@.__BUFFER(ST_ASGEOJSON(geog),radius, units, steps))
);