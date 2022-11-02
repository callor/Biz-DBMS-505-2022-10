-- 여기는 root 권한 화면

-- world SCHEMA 를 대상으로 DB 를 핸들링(CRUD) 하기 위하여
-- world SCHEMA open
USE world;

/*
country table 에서
각 국가별 GNP 값이 큰 국가부터 리스트 조회
단, GNP 1000 이상인 국가이름, GNP 값
*/
-- city table 에서 인구가 5만이상인 국가들을 표현
-- 여에는 countryCode 가 있는데 이 코드가 무엇을 의미하는지
-- 알기 어렵다
SELECT name,population,countryCode
FROM city
WHERE population <= 50000;

-- countryCode 가 무엇을 의미하는지를 살펴봤더니
-- 그에 대한 정보가 Country table 에 있더라
-- 인구가 5만 이상 도시가 포함된 국가가 어디인가를 보면서
-- 국가에 대한 정보도 함께 보고 싶다
SELECT * 
FROM Country
WHERE code = 'ANT';

/*
인구가 1만 이상 5만 이하인 도시의 
국가정보를 같이 확인하고 싶다
인구정보는 city table 에 저장되어 있고
국가정보는 country table 에 저장되어 있다
이러한 상황이 되면 2개의 table 을 select 하여
데이터를 확인하고 확인된 데이터를 묶어주는 절차가 필요하다
*/

-- 1 city 에서 인구가 1만 이상 5만이하는 데이터 SELECT
SELECT *
FROM city
WHERE population BETWEEN 10000 AND 50000;
-- 2. SELECT 한 결과를 봤더니 국가에 대한 정보가 CountryCode 만
-- 보여지고 있다
-- CountryCode 를 가지고 다시 Country table 에서 국가 정보를
-- SELECT 해야 한다

-- city table의 countryCode 데이터와 country table code 데이터가
-- 일치된것을 찾아서 두 테이블 정보를 연결하여 보여라
-- 완전 JOIN(EQ JOIN)
-- 완전 JOIN 주의 사항
-- city table countryCode 데이터가 
-- "반드시" Country 테이블의 code 데이터에 존재해야 한다
-- 만약 city 데이터에는 도시에 대한 정보가 있는데
-- 그 city 의 CountryCode 에 해당하는 데이터가
-- country 에 없으면 city 데이터의 리스트가 누락되어 버린다
-- 완전 JOIN 은 매우 쉬운 JOIN  이지만 데이터가 누락될수 있다
-- 두 테이블의 교집합 연산 이라고도 한다
SELECT *
FROM city, country
WHERE city.population BETWEEN 10000 AND 50000
	AND city.countryCode = country.code;
/*
INNER JOIN
두 table 의 교집합을 찾아 SELECT 하기
EQ JOIN 이 하고 두 테이블간에 데이터가 완전 일치할 경우 사용

EQ JOIN : 완전JOIN, INNER JOIN을 말한다
EQ JOIN 의 결과가 보증되려면 table 간에 "참조무결성"이 보장되어야 한다

*/
SELECT *
FROM city
	JOIN country
		ON city.countryCode = country.code
WHERE city.population BETWEEN 10000 AND 50000;

/*
두 table 간에 "참조 무결성" 조건이 없거나
"참조 무결성" 성립이 아직 이루어 지지 않았을 경우
예를들어 성적Table 과 학생Table 을 JOIN 하려고 하는데
성적Table 에는 특정 학번의 성적이 추가되어 있으나
학생Table 에는 특정 학번의 학생정보가 아직 추가되지 않았을 경우
EQ JOIN을 수행하면 성적 데이터가 보이지 않게 된다

두 (성적, 학생정보) table 을 JOIN했을때
성적table 의 모든 데이터는 일단 보여주고
학생정보가 있으면 학생정보고 같이 보여주고
없으면 다른 표식으로 보여주면 좋겠다
이럴때 사용하는 JOIN 을 outer JOIN 이라고 한다
*/

-- 1. city table WHERE 조건에 맞도록 SELECT 하고
-- 2. SELECT 된 List 에서 countryCode 데이터를 가지고
-- 3. coutry table 에서 SELECT 를 수행한다
-- 4. coutry table 에서 데이터가 SELECT 되면 해당 데이터를 보여주고
-- 5. 없으면 <null> 이라고 보여준다
-- 이 JOIN 은 city table 의 데이터 검증을 목적으로 한다.
SELECT *
FROM city
	LEFT JOIN country
		ON city.countryCode = country.code
WHERE city.population BETWEEN 10000 AND 50000;



USE world;	
SELECT * FROM city
WHERE population BETWEEN 10000 AND 20000;









