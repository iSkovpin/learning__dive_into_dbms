WITH PriceChange AS
         (SELECT s1.company, s1.week, s1.share_price, (s1.share_price - s2.share_price) AS price_change
          FROM stockquotes s1
                   LEFT JOIN stockquotes s2 ON s1.week = (s2.week + 1) AND s1.company = s2.company),
     PriceIndex AS
         (SELECT *, AVG(price_change) OVER (PARTITION BY week) AS price_index
          FROM PriceChange),
     CompanySucceed AS (
         SELECT *, (price_change > price_index)::INT AS succeed
         FROM PriceIndex
     ),
     SompanySucceedRow AS (SELECT *,
                                  sum(succeed) OVER (PARTITION BY company order by week
                                      rows between 2 preceding and current row) AS succeed_row
                           FROM CompanySucceed)

SELECT company, count(company) as succeed_rows
FROM SompanySucceedRow
WHERE succeed_row = 3
GROUP BY company


