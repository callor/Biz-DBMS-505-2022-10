# SQL 명령 그룹

- SQL 명령은 관리자 그룹, 일반사용자 및 개발자 그룹에서 수행하는 체계가 구분된다.
- 관리자 그룹은 데이터 저장소의 생성, Table 의 생성 등을 수행하는 CREATE 명령을 수행할수 있다
- 일반사용자 및 개발자 그룹은 CRUD(INSERT, SELECT, UPDATE, DELETE) 명령을 수행할 수 있다

## 관리자(DBA, DataBase Adminstrator) 그룹 명령들

- 물리적 저장소 생성, 삭제, 변경
- 대부분 CREATE 라는 명령으로 시작한다.
- 관리자 명령 그룹에는 다른 사용자를 추가하거나, 사용자의 권한을 부여, 해제 하는 명령도 포함된다.

### 물리적 저장소 생성 명령어들

- `CREATE DATABASE [db이름]` : 물리적 저장소 생성
- `CREATE TABLE [table이름]` : 물리적 저장소에 데이터 추가용 Sheet 를 생성

### 새로운 사용자 추가와 권한부여 명령어

- `CREATE USER [username]` : 새로운 사용자 추가

- `GRANT [권한] TO [username]` : username 사용자의 권한을 부여

### 삭제와 관련된 명령

- `DROP DATABASE [db이름]` : 물리적 저장소 삭제
- `DROP TABLE [table이름]` : Table 삭제
- `DROP USER [username]` : 사용자 삭제

## 일반사용자와 개발자 명령어 그룹

- 물리적 저장소에 데이터 추가, 조회, 수정, 삭제를 수행하는 명령어 그룹
- CRUD 명령 그룹 : CREATE READ UPDATE DELETE 등을 수행하는 명령

### 데이터에 변경을 가하는 명령

- 데이터 추가 : CREATE 명령으로 INSERT 키워드 사용
- 데이터 변경 : 데이터 일부를 다른 값으로 수정하는 명령으로 UPDATE 키워드 사용
- 데이터 삭제 : 데이터 일부를 제거하는 명령으로 DELETE 키워드 사용
- 주의!! : 데이터를 삭제하는 DELETE 는 DROP 명령과는 완전 다른 형태이다. DROP 은 Storage 에 보관중인 물리적 데이터에 대한 삭제를 하는 것이고, DELETE Table 에 저장된 데이터중 필요없는 항목 일부만 제거하는 명령이다

### 데이터 조회 하는 명령

- 저장소에 저장된 table 에서 필요한 데이터를 선택하여 사용자에게 Table 형태로 응답하는 명령
- SELECT 키워드를 사용하는 명령
- 여러가지 조건을 부여하여 필요한 데이만 선택(SELECT)적으로 조회 한다

## 명령어 정리

- DDL(Data Definition Lang., 데이터 정의어) : 관리자가 사용하는 명령 그룹, CREATE, DROP, ALTER 키워드로 시작하는 명령들
- DML(Data Manipulation Lang. 데이터 조작어) : 일반사용자 또는 개발자가 CRUD 를 구현하는 명령 그룹, INSERT, SELECT, UPDATE, DELETE
