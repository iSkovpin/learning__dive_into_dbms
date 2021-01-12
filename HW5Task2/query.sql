SELECT value, Agg.cnt
FROM (SELECT id,
             value,
             (SELECT count(*)
              FROM T T1
              WHERE T1.value <= T2.value) as row_num
      FROM T T2
      ORDER BY T2.value) OrderedValues
         JOIN (SELECT count(*) AS cnt, (count(*) / 2 + 1) AS med FROM T) Agg ON 1 = 1
WHERE OrderedValues.row_num = Agg.med;
