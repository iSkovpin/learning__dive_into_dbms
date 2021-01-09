CREATE OR REPLACE FUNCTION SubmitReview(_paper_id INT, _reviewer_id INT, _score INT)
    RETURNS VOID AS
$$
-----------------
DECLARE
    reviewingRec RECORD;
    paperRec     RECORD;
BEGIN
    -- Значение оценки в заданном диапазоне
    IF _score < 1 OR _score > 7 THEN
        RAISE SQLSTATE 'DB017';
    END IF;

    -- Запись о ещё непринятой публикации существует
    SELECT id INTO paperRec FROM paper WHERE id = _paper_id AND accepted IS NULL;
    IF NOT FOUND
    THEN
        RAISE SQLSTATE 'DB017';
    END IF;

    -- Запись о рецензии существует
    SELECT paper_id INTO reviewingRec FROM paperreviewing WHERE paper_id = _paper_id AND reviewer_id = _reviewer_id;
    IF NOT FOUND
    THEN
        RAISE SQLSTATE 'DB017';
    END IF;

    -- Ставим оценку
    UPDATE paperreviewing SET score = _score WHERE paper_id = _paper_id AND reviewer_id = _reviewer_id;

    -- Считаем общее количество рецензий и среднюю оценку
    SELECT count(pv.score) AS reviews_num, avg(pv.score)::NUMERIC(3, 2) AS avg_score
    INTO paperRec
    FROM paper p
             JOIN paperreviewing pv on p.id = pv.paper_id
    WHERE p.id = _paper_id
    GROUP BY p.id;

    -- Выставляем решение о принятии, если у публикации есть 3 рецензента
    IF paperRec.reviews_num = 3
    THEN
        UPDATE paper SET accepted = (paperRec.avg_score > 4)::BOOLEAN WHERE id = _paper_id;
    END IF;
END;
-----------------
$$ LANGUAGE plpgsql;
