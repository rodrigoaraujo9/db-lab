select
    t.id, t.taxi,
    st_length(proj_track) as total_length,
    st_numpoints(proj_track) as num_sampled_points
from tracks_braga t
group by t.id
