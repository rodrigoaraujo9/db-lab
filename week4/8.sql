select
    distrito_ilha,
    st_simplifypreservetopology(st_union(geom), 250) as geom
from
    cont_freguesias
group by distrito_ilha
order by distrito_ilha;
