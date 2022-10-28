-- 여기는 주석문
-- 여기는 root 로 접속한 화면입니다
-- SELECT : DB Server에 뭔가 요청하는 명령 키워드
SELECT 30+40;
SELECT '대한민국만세';
-- || : Oracle 에서 문자열 연결, '대한민국' || '만세'
SELECT CONCAT('대한민국',  '만세');

-- world SCHEMA 를 open 하기
-- SCHEMA = DATABASE
USE world; -- 1. DB 를 open 하고
SELECT * 
FROM city; -- 2. city table 에서 데이터를 SELECT(선택)하여 보여주기

-- WHERE 조건절에 조건을 부여하여 
-- 필요한 데이터만 제한적으로 SELECT 하기
SELECT *
FROM city
WHERE District = 'Noord-Holland';

SELECT *
FROM 학생테이블
WHERE 이름 = '홍길동';

SELECT *
FROM city
WHERE Name = 'Alkmaar';

SELECT *
FROM city;

-- Selection 조회
-- 데이터 개수를 축소하여 필요한 데이터 들만 보기
SELECT *
FROM city 
WHERE Name = 'Herat';

-- Projection 조회
-- 데이터의 항목을 축소하여 필요한 항목(칼럼) 들만 보기
SELECT Name, Population
FROM city;

-- Selection 과 Projection 을 동시에 적용하기
SELECT district, population
FROM city
WHERE name = 'Herat';

-- district 칼럼에 저장된 데이터들을 한 묶음으로 묶고
-- 묶음에 포함된 데이터들의 개수를 세어서 보여주기
SELECT district, count(district)
FROM city
GROUP BY district;

-- 성적테이블에서 각 과목의 총점과 평균 계산하여 보여주기
SELECT 과목,SUM(점수),AVG(점수)
FROM 성적테이블
GROUP BY 과목;

-- 학생별 총점과 평균 계산하여 보여주기
SELECT 학번, 이름, SUM(점수), AVG(점수)
FROM 성적테이블
GROUP BY 학번, 이름;

SELECT 학번, 이름, SUM(점수), AVG(점수)
FROM 성적테이블
GROUP BY 학번, 이름
ORDER BY 학번;

/*
city table 에서 인구(population)가 1만 이상인 도시들만
찾으시오
*/
SELECT *
FROM city
WHERE population >= 10000;

/*
city table 에서 인구가 1만이상인 도시들을
인구가 많은 순서대로 조회하기
*/
SELECT * 
FROM city
WHERE population >= 10000
ORDER BY population DESC;

/*
city table 에서 인구가 1만 이상 5만 이하인
도시들의 인구 평균을 구하시오
*/
SELECT AVG(population)
FROM city
WHERE population >= 10000 AND population <= 50000;

/*
city table 에서 인구가 1만 이상 5만 이하인 
도시들의 국가별(CounryCode) 인구 평균을 구하시오
국가별로 정렬

통계( count(), sum(), avg(), max(), min() ) 와 관련된 SQL은
반드시 projection 을 수행하여 칼럼을 제한해야 한다.
projection 칼럼중에 통계함수로 묶이지 않은 칼럼은
반시 GROUP BY 절에서 명시해 주어야 한다
*/
SELECT countryCode, AVG(population)
FROM city
WHERE population >= 10000 AND population <= 50000
GROUP BY countryCode
ORDER BY countryCode;

-- 범위를 부여하는 조건절에서
-- ~~이상 AND ~~이하 의 조건일때
SELECT countryCode, AVG(population)
FROM city
WHERE population BETWEEN 10000 AND 50000
GROUP BY countryCode
ORDER BY countryCode;

/*
city table 에서
각 국가별 인구평균을 계산하고
인구 평균이 5만 이상인 국가만 조회하기

먼저 국가별 인구평균을 계산하고
계산된 인구평균이 5만 이상인 경우
avg() 함수로 계산결과에 조건을 부여하기 때문에
이러한 경우는 WHERE 가 아니고, 
HAVING 절을 GROUP BY 다음에 둔다
*/
SELECT countryCode,avg(population) 평균인구수
FROM city
GROUP by countryCode
HAVING avg(population);


SELECT name,MAX(population)
FROM city;

SELECT * FROM city
ORDER BY population DESC;
/*
각 국가별(그룹을 묶어서)로 가장 인구가 많은 도시는?
max() 함수는 각 그룹에서 최대 값을 찾는 함수이다
이 함수를 사용할때 특이한 점이
한개의 칼럼(name, 도시명)을 GROUP BY 로 묶지 않고
코드를 실행하면 인구가 가장 많은 도시의 이름을 알수 있다
*/
SELECT countryCode AS 국가,name AS 도시, MAX(population) AS 인구수
FROM city
GROUP BY countryCode
ORDER BY MAX(population) DESC;
SELECT * FROM country;

/*
country table 에서
각 국가별 GNP 값이 큰 국가부터 리스트 조회
단, GNP 1000 이상인 국가이름, GNP 값
*/
/*
city table 과 country table 을 참조하여
인구가 1만 이상 5만 이하인 도시의 국가 이름이 무엇인가 조회
JOIN
*/
SELECT name,population,countryCode
FROM city
WHERE population <= 50000;

SELECT * 
FROM Country
WHERE code = 'ANT';







