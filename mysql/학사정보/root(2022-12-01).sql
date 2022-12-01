-- 학사정보 데이터베이스, root 화면
USE schoolDB;
SELECT * FROM tbl_students LIMIT 10;

-- 이미 만들어진 학생데이터 table에 지도교수 항목이 누락되었다
-- 엑셀 학생 데이터를 봤더니, 지도 교수 부분이 누락되었다
-- 이미 만들어진 학생데이터에 지도교수 항목을 추가하는 작업
/*
학생정보(지도교수 정보가 포함된) 데이터를 복제하여 새로운 시트로 생성
이 시트에서 학번, 지도교수(이름) 항목만 남기고 나머지는 삭제한다
이렇게 생성된 데이터를 관계(Relation)이라고 한다.
*/
-- 교수정보 테이블 생성
CREATE TABLE tbl_professors(
	pro_code	VARCHAR(5)		PRIMARY KEY,
	pro_name	VARCHAR(20)	NOT NULL, 	
	pro_tel	VARCHAR(15),		
	pro_subject	VARCHAR(20),		
	pro_office	VARCHAR(5)		
);

SELECT COUNT(*) FROM tbl_professors;
/*
학생-교수 Relation 데이터를 import 할텐데
현재 학생-교수 데이터에는 교수 이름은 알수 있으나 교수의 코드는 알수 없다
학생-교수 Relation 테이블을 학번-교수이름 연관 데이터를 만들고
여기에 교수 코드를 Update 하여 최종 데이터를 만든다
*/
-- 임시 학생-교수테이블 생성
CREATE TABLE tbl_std_pro (
	r_stnum VARCHAR(5),
    r_procode VARCHAR(5),
    r_proname VARCHAR(20)
);
SELECT * FROM tbl_std_pro;
-- import 된 데이터에는 학번, 교수이름이 저장되어 있다
-- 이 데이터에 교수 코드를 Update 할것이다
-- 교수테이블에서 이름을 SELECT 하여 교수 코드를 Update
SELECT r_stnum, r_procode,pro_code, r_proname, pro_name
FROM tbl_std_pro R
	LEFT JOIN tbl_professors PR
		ON R.r_proname = PR.pro_name
WHERE pro_code IS NULL; -- 검증하기 위한 설정        
-- 위의 결과에서 데이터가 하나도 나오지 않아야 한다.
-- 만약 데이터가 보인다면, 원본 데이터에 문제가 있다는 것이다
SET SQL_SAFE_UPDATES = 0; -- 다중 Update 허용하기
UPDATE tbl_std_pro R
	LEFT JOIN tbl_professors PR
		ON R.r_proname = PR.pro_name
SET r_procode = pro_code;

SELECT r_stnum, r_procode,pro_code, r_proname, pro_name
FROM tbl_std_pro R
	LEFT JOIN tbl_professors PR
		ON R.r_proname = PR.pro_name
ORDER BY pro_code;        

SELECT r_stnum, r_proname, r_procode FROM tbl_std_pro;

CREATE TABLE tbl_r_std_pro (
	rst_stcode	VARCHAR(5)	NOT NULL, 	
	rst_prcode	VARCHAR(5)	NOT NULL, 	
	PRIMARY KEY(rst_stcode, rst_prcode)
);

SELECT * FROM tbl_r_std_pro;

-- 학생정보 list 를 보이는데
-- 지도교수가 누구인지 함께 묶어서 보이기
-- 이 DB 에서 학생정보 Table 에는 교수정보가 없다
-- 학생정보 - 학생,교수 Relation - 교수정보 3개의 table 을 묵어서
-- JOIN 을 해야 한다

/*
1. 학생테이블에는 교수님 정보가 일체 없다
2. 학생테이블과 학생-교수 Relation 을 JOIN 하여 교수님 정보를 SELECT 한다
3. Relation 된 데이터의 교수님 코드와 교수님 테이블을 JOIN 하여 
		교수님의 구체적인(Details)정보를 SELECT 한다
*/
CREATE VIEW view_student_professor
AS
(
SELECT st_num, st_name,st_tel,
	rst_prcode,pro_name, pro_tel
FROM tbl_students ST
	LEFT JOIN tbl_r_std_pro RE
		ON ST.st_num = RE.rst_stcode
	LEFT JOIN tbl_professors PRO
		ON RE.rst_prcode = PRO.pro_code
 );
 SELECT * FROM view_student_professor
 ORDER BY pro_name;
 
 SELECT pro_name, st_num, st_name
 FROM view_student_professor
 WHERE pro_name = '아인슈타인'
 ORDER BY pro_name;

/*
Excel 성적 데이터를 정규화 하여 테이블에 추가하기
Excel 성적 데이터의 칼럼 이름을 갖는 임시 테이블 생성하기
*/ 
CREATE TABLE tbl_성적 (
	학번	VARCHAR(5),
	국어	INT,
	영어	INT,
	수학	INT,
	역사	INT,
	도덕	INT,
	과학	INT,
	음악	INT,
	미술	INT,
	한국사	INT,
	한국지리	INT,
	한문	INT,
	세계사	INT,
	세계지리	INT,
	물리학	INT,
	생물학	INT,
	화학	INT,
	지구과학	INT,
	기술	INT,
	가정	INT,
	정보기술	INT
);

-- UNION ALL
/*
여러개의 SELECT 결과를 한개의 List View 처럼 보여주는 키워드
모든 SELECT 의 칼럼의 개수와 데이터 type 이 같아야 한다
*/
DROP VIEW view_scores;
CREATE VIEW view_scores
AS
(
	SELECT 학번,'국어' AS 과목명,국어 AS 점수 FROM tbl_성적
	UNION ALL
	SELECT 학번,'영어',영어 AS 점수 FROM tbl_성적
	UNION ALL
	SELECT 학번,'수학',수학 AS 점수 FROM tbl_성적
	UNION ALL
	SELECT 학번,'역사',	역사 FROM tbl_성적
	UNION ALL
	SELECT 학번,'도덕',	도덕 FROM tbl_성적
	UNION ALL
	SELECT 학번,'과학',	과학 FROM tbl_성적
	UNION ALL
	SELECT 학번,'음악',	음악 FROM tbl_성적
	UNION ALL
	SELECT 학번,'미술',	미술 FROM tbl_성적
	UNION ALL
	SELECT 학번,'한국사',	한국사 FROM tbl_성적
	UNION ALL
	SELECT 학번,'한국지리',	한국지리 FROM tbl_성적
	UNION ALL
	SELECT 학번,'한문',	한문 FROM tbl_성적
	UNION ALL
	SELECT 학번,'세계사',	세계사 FROM tbl_성적
	UNION ALL
	SELECT 학번,'세계지리',	세계지리 FROM tbl_성적
	UNION ALL
	SELECT 학번,'물리학',	물리학 FROM tbl_성적
	UNION ALL
	SELECT 학번,'생물학',	생물학 FROM tbl_성적
	UNION ALL
	SELECT 학번,'화학',	화학 FROM tbl_성적
	UNION ALL
	SELECT 학번,'지구과학',	지구과학 FROM tbl_성적
	UNION ALL
	SELECT 학번,'기술',	기술 FROM tbl_성적
	UNION ALL
	SELECT 학번,'가정',	가정 FROM tbl_성적
	UNION ALL
	SELECT 학번,'정보기술',	정보기술 FROM tbl_성적
);

SELECT * FROM view_scores;
SELECT 학번,SUM(점수) 총점, AVG(점수) 평균 FROM view_scores
GROUP BY 학번;

SELECT * FROM view_scores;

SELECT 과목명,
	SUM(점수) 총점, 
    AVG(점수) 평균 FROM view_scores
GROUP BY 과목명;

SELECT 학번, st_name, st_tel,
	SUM(점수) 총점, AVG(점수) 평균
FROM view_scores
	LEFT JOIN tbl_students 
		ON st_num = 학번
GROUP BY 학번, st_num, st_tel        
ORDER BY 학번;    

-- MySQL 8 이상에서 가능
-- 내부에서 SUM(점수) 를 계산하여 DESC 정렬을 하고
-- 전체 데이터 리스트중에 현재 데이터의 rank 가 얼마인지 보이기
-- 동점자 있을 경우 처리하는 방법에서 dense_rank() 와 비교 하여 사용하기
SELECT 학번,SUM(점수) AS 총점, AVG(점수) AS 평균,
	rank() OVER( ORDER BY SUM(점수) DESC) AS 석차
FROM view_scores
	LEFT JOIN tbl_students
		ON 학번 = st_num
GROUP BY 학번;        

SELECT 학번,SUM(점수) AS 총점, AVG(점수) AS 평균,
	dense_rank() OVER( ORDER BY SUM(점수) DESC) AS 석차
FROM view_scores
	LEFT JOIN tbl_students
		ON 학번 = st_num
GROUP BY 학번;        

/*
생성된 점수 view 를 실제 table 로 만들고
과목명을 별도로 과목정보 table 만들어서 정규화 실행
*/
SELECT 과목명 FROM view_scores
GROUP BY 과목명
ORDER BY 과목명;

 CREATE TABLE tbl_subjects (
	sb_code	VARCHAR(5)	NOT NULL 	PRIMARY KEY,
	sb_name	VARCHAR(20)	NOT NULL 	
);

SELECT * FROM tbl_subjects;
SELECT 학번,sb_code,점수,과목명,sb_name
FROM view_scores
	LEFT JOIN tbl_subjects
		ON 과목명 = sb_name
LIMIT 2000;

-- WHERE 과목명 <> sb_name; -- 데이터 검증하기

CREATE TABLE tbl_scores (
	sc_stnum	VARCHAR(5)	NOT NULL, 	
	sc_sbcode	VARCHAR(20)	NOT NULL, 	
	sc_score	INT,		
	PRIMARY KEY(sc_stnum, sc_sbcode)	
);

SELECT * FROM tbl_scores;
SELECT COUNT(*) FROM tbl_scores;
SELECT SUM(sc_score) FROM tbl_scores;

/*
학생정보:tbl_students
성적정보:tbl_scores
과목정보:tbl_subjecc

학생별로 총점, 평균 구하고
학생이름, 총점, 평균, 전화번호, 학과, 학년을 projection 하여 보이기

과목별로 총점, 평균 구하고
과목이름, 총점, 평균 을 projection 하여 보이기
*/

        
 
 





