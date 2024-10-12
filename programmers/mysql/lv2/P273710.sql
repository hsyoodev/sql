-- 코드를 작성해주세요
-- 2024-10-12
SELECT A.ITEM_ID, A.ITEM_NAME
FROM ITEM_INFO AS A
INNER JOIN ITEM_TREE AS B
ON A.ITEM_ID = B.ITEM_ID
WHERE PARENT_ITEM_ID IS NULL
ORDER BY ITEM_ID ASC;