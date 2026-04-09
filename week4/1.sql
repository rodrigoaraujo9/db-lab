SELECT f_table_name AS table_name,
       type AS geometry_type,
       srid
FROM geometry_columns
WHERE f_table_schema = 'public'
  AND f_table_name IN (
    'cont_freguesias',
    'raa_cen_ori_freguesias',
    'raa_oci_freguesias',
    'ram_freguesias'
  )
ORDER BY f_table_name;
