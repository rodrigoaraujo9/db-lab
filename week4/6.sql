select
    freguesia,
    st_npoints(st_simplifypreservetopology(geom,50)) as points_50,
    st_npoints(st_simplifypreservetopology(geom,100)) as points_100,
    st_npoints(st_simplifypreservetopology(geom,250)) as points_250
from
    raa_cen_ori_freguesias
where freguesia = 'Lajes do Pico'
