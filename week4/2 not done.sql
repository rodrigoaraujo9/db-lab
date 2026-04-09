\o /Users/rodrigoaraujo/Desktop/github/databases/doc.kml
SELECT '<?xml version="1.0" encoding="UTF-8"?>' ||
       '<kml xmlns="http://www.opengis.net/kml/2.2">' ||
       '<Document>' ||
       '<Placemark><name>' || freguesia || '</name>' ||
       ST_AsKML(ST_Transform(ST_Simplify(geom, 200), 4326)) ||
       '</Placemark>' ||
       '</Document>' ||
       '</kml>' AS kml
FROM cont_freguesias
WHERE freguesia = 'Campanhã';
\o
