-- 코드를 입력하세요
-- 2024-11-24
SELECT A.APNT_NO, B.PT_NAME, A.PT_NO, A.MCDP_CD, C.DR_NAME, A.APNT_YMD
FROM APPOINTMENT AS A
JOIN PATIENT AS B
JOIN DOCTOR AS C
ON A.PT_NO = B.PT_NO AND A.MDDR_ID = C.DR_ID
WHERE DATE_FORMAT(APNT_YMD, '%Y-%m-%d') = '2022-04-13' AND APNT_CNCL_YN = 'N'
ORDER BY APNT_YMD;