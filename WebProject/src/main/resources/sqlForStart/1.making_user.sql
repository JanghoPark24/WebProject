/* 계정삭제 */
drop user thelecture CASCADE;

/* 계정생성 */
create user thelecture identified by wnddkd1971;
/* 권한부여 */
grant connect, resource, dba to thelecture;