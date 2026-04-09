select st_distance(t1.proj_location, t2.proj_location) AS distance_meters
from taxi_stands t1, taxi_stands t2
where t1.id = 1
  and t2.id = 2;

select st_distancesphere(st_transform(t1.proj_location, 4326), st_transform(t2.proj_location,4326)) AS distance_meters
from taxi_stands t1, taxi_stands t2
where t1.id = 1
and t2.id = 2;
