-- 코드를 작성해주세요
-- 2024-10-27
SELECT A.ITEM_ID, A.ITEM_NAME, A.RARITY
FROM ITEM_INFO AS A
LEFT JOIN ITEM_TREE AS B
ON A.ITEM_ID = B.PARENT_ITEM_ID
WHERE PARENT_ITEM_ID IS NULL
ORDER BY ITEM_ID DESC;