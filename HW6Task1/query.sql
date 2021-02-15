WITH RECURSIVE CitiesChain AS (
    SELECT c.id,
           c.value,
           1         AS num,
           ARRAY [0] AS chain
    FROM Cities c
    WHERE id = 0

    UNION ALL

    SELECT c.id,
           c.value,
           ch.num + 1                   AS num,
           array_append(ch.chain, c.id) AS chain
    FROM Cities c
             JOIN CitiesChain ch
                  ON lower(left(c.value, 1)) = lower(right(ch.value, 1)) AND array_position(ch.chain, c.id) IS NULL
)
SELECT id, value, num
FROM CitiesChain;
