/*
DDL 명령 세트 : CREATE, DROP, ALTER
	CREATE DATABASE : Schema 생성
    CREATE TABLE : 데이터를 저장할 table 을 정의 및 생성
    
    DROP TABLE : 테이블을 완전하게 제거하기
    DROP DATABASE : Schema를 완전하게 제거, Schema 에 포함된 모든객체가
			같이 삭제된다.

	ALTER TABLE : 칼럼추가, 칼럼변경 등을 수행하는 명령
		명령을 수행하는데 많은 비용이 소요된다
        꼭 필요한 경우, 불가피한 경우가 아니면 가급적 사용하지 말자
*/
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
	st_num	VARCHAR(5)	NOT NULL	PRIMARY KEY,
	st_name	VARCHAR(10)	NOT NULL,	
	st_dept	VARCHAR(20)	,	
	st_grade	INT	,	
	st_tel	VARCHAR(15),		
	st_addr	VARCHAR(125)		
);
SELECT * FROM tbl_student;


