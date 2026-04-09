select
    t.name,
    st_distance(st_transform(t.proj_location,4326), st_setsrid(st_makepoint(-8.615, 41.141), 4326)) AS distance_meters
from taxi_stands t
order by distance_meters asc
limit 1;
