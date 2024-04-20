-- Just putting these here to save them for now


select row_to_json(b) from (
  select * from (
  select name, type
  from location
  order by loc <-> ST_SetSRID(st_makepoint(39.957718, -75.194896), 4326)
  ) b
) b ;



select row_to_json(b) from (
  select * from (
  select name, type
  from location
  order by loc <-> ST_SetSRID(st_makepoint(39.957718, -75.194896), 4326)
  ) b
) b ;

create function nearby(lng float, lat float) returns XML
  language sql as $$
  select row_to_json(*) from (
  select name, type
  from location
  order by loc <-> ST_SetSRID(st_makepoint(lng, lat), 4326));
$$;



create function nearby(lng float, lat float) returns JSON
  language sql as $$
  select row_to_json(b) from (
  select * from (
  select name, type
  from location
  order by loc <-> ST_SetSRID(st_makepoint(lng, lat), 4326)
  ) b
) b ;
$$;
