-- root 화면
CREATE DATABASE foodDB;
USE foodDB;
/* 
BIGINT	AUTO_INCREMENT
work 테이블(수시로 데이터가 추가, 수정, 삭제가 이루어지는 table)
master 테이블(처음에 대량의 데이터가 추가된 후로는 추가, 수정, 삭제가
		자주 발생하지 않는 table)
        
work 테이블은 보통 데이터 칼럼으로 PK를 설정하기가 어렵다
이때 실제 데이터와는 관계없이 PK 만을 위하여 칼럼을 추가하고
이 칼럼의 데이터 type 을 BIGINT 로 설정하고 AUTO_INCREMENT 를 설정하여
데이터를 INSERT 할때 자동으로 증가된 일련번호 값이 포함되도록 하는 것        

IF NOT EXISTS :
CREATE TABLE 를 실행할때 table 이 이미 있으면
오류가 발생하므로 오류를 방지하는 목적으로 사용하는 키워드
MySQL, MariaDB 에서만 사용가능한 키워드
*/
CREATE TABLE IF NOT EXISTS tbl_todayV2 (
	t_seq	BIGINT	AUTO_INCREMENT PRIMARY KEY,
	t_date	VARCHAR(10)	NOT NULL,
	t_time	VARCHAR(14)	NOT NULL,
	t_content	VARCHAR(125)	NOT NULL,
	t_qty	INT,	
	t_cal	INT	
);
INSERT INTO tbl_todayV2(t_date, t_time, t_content, t_qty, t_cal)
VALUES ('2022-11-08','16:20:00.000','빅맥10000',3,1200);
SELECT * FROM tbl_todayv2;

USE foodDB;
DESC tbl_todayV7;
select * from tbl_todayv7;



