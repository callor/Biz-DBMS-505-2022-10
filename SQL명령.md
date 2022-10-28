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
