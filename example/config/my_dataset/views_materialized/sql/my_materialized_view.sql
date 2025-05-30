SELECT
    field_1,
    COUNT(*) as cnt
FROM `${project_id}.${dataset_name}.my_table`
GROUP BY field_1
;
