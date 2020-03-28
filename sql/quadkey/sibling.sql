CREATE OR REPLACE FUNCTION libjs4ue.quadkey.sibling(quadkey STRING, direction STRING)
  RETURNS STRING
  LANGUAGE js AS
"""
return sibling(quadkey,direction);  
"""
OPTIONS (
  library=["gs://bigquery-geolib/quadkey.js"]
);
