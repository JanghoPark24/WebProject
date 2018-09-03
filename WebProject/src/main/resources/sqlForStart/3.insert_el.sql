SELECT * FROM tab;
SELECT * FROM member;
SELECT * FROM univ;
SELECT * FROM file_storage;

select * from LECTURE_REPLY;


delete from member;
delete from univ;
purge;


-- 시퀀스 생성
create SEQUENCE seq_question_id START WITH 1 INCREMENT BY 1;--질문 시퀀스
CREATE SEQUENCE seq_board1_no START WITH 1 INCREMENT BY 1;--커뮤니티 게시판 시퀀스
CREATE SEQUENCE seq_board1_re_no START WITH 1 INCREMENT BY 1;--커뮤니티 게시판 리플 시퀀스
CREATE SEQUENCE seq_lecture_no START WITH 1 INCREMENT BY 1;--강의 시퀀스
CREATE SEQUENCE seq_lecture_re_no START WITH 1 INCREMENT BY 1;--강의 리플 시퀀스
create SEQUENCE seq_qestion_version START WITH 1 INCREMENT BY 1;--강의 리플 시퀀스
ALTER TABLE univ
ADD CONSTRAINT uk_univ_url  UNIQUE (univ_url); 

select * from univ;

delete from univ;



/* 대학입력 */
insert INTO univ values(
'서울대학교','snu','snu.ac.kr','logo1.gif'
);
insert INTO univ values(
'고려대학교','korea','korea.ac.kr','logo2.gif'
);
insert INTO univ values(
'연세대학교','yonsei','yonsei.ac.kr','logo3.gif'
);
insert INTO univ values(
'구글대학교','google','gmail.com','logo4.gif'
);

insert INTO univ values(
'네이버대학교','naver','naver.com','logo5.gif'
);


/* 회원 입력*/
insert INTO member values(
    'TheLecture.corp@gmail.com',
    '구글대학교', 'Admin',
    'c54f4493021de0a059cf719a2dce3d20941efe9a625122715badd0b76244f6dd',
    'y','master',/*관리자계정*/
    0,null,'B6E0lnRevAWmKnASHCYY',/*인증키*/
    sysdate,'컴퓨터공학과','image.jpg','관리자입니다.'
);

insert INTO member values(
'Ghest001@yonsei.ac.kr','연세대학교','Ghest001',
'c54f4493021de0a059cf719a2dce3d20941efe9a625122715badd0b76244f6dd',
'n','unknown',/*비인증회원*/
0,null,'BFjD4Q472OHqbIazkxFB',/*인증키*/
sysdate,'경제학과','image.jpg','인증 받지 않은 회원입니다.'
);

insert INTO member values(
'psy8p@yonsei.ac.kr','연세대학교','psy8p',
'c54f4493021de0a059cf719a2dce3d20941efe9a625122715badd0b76244f6dd','y',
'member',/*일반계정*/
0,null,'c6qVVkURkyLpdcGvjxnn',/*인증키*/
sysdate,'심리학과','image.jpg','일반 회원입니다.'
);

insert INTO member values(
'goodbye@korea.ac.kr','고려대학교','goobye',
'c54f4493021de0a059cf719a2dce3d20941efe9a625122715badd0b76244f6dd','n',
'delete',/*관리자계정*/
/*인증키*/
0,null,'97QrAcogIiLWhBgIZt7m',
sysdate,'무역학과','image.jpg','탈퇴하려는 회원입니다.'
);


/*
 * author:종혁
 * lecture List 새로 추가
 * 
 * */
select * from member;
select * from memberView;

commit;
DROP table lecture  CASCADE CONSTRAINTS;

select * from LECTURE;



insert into lecture values(seq_lecture_no.nextval, '서울대학교','언어학과',1,1,'L0441.000100_001','핀란드어 1','정도상','3',0,0,'n',0)
insert into lecture values(seq_lecture_no.nextval, '연세대학교','컴퓨터공학과',1,1,'111123','알고리즘','교수님1','2',0,0,'n',0);
insert into question_version values('강의평가1');

insert into question values(seq_question_id.nextval,
                            '강의평가1',
                            '난이도');
insert into question values(seq_question_id.nextval,
                            '강의평가1',
                            '학점');                            
insert into question values(seq_question_id.nextval,
                            '강의평가1',
                            '강의력');                            
insert into question values(seq_question_id.nextval,
                            '강의평가1',
                            '과제');

           

--검색하기 위한 view 생성
create or replace view lecture_search 
as select 
    lecture_id, univ_name, major,grade , semester, lecture_code , lecture_name, 
    professor,credit,view_count,rating_count, is_deleted, total_avg_score, --lecture table 정보
    major||univ_name || lecture_code ||lecture_name || credit || professor char_info,
    grade ||' , '||semester number_info --검색시 사용하는 정보
from lecture;




--멤버 뷰 생성(마지막에 생성된것 하나만)
create or replace view memberView
as
select mb.email email, univ_name, 
nickname, password,is_mail_open,
profile, grade, reg_date, major, profile_img, uploadedfile, isdeleted
from member mb
full outer join file_storage fs --outer join 
ON mb.email = fs.email and  --조인
profile_img = filename and  --파일 이름이 같은 곳
savedTime in (select max(savedTime) from file_storage group by email)  -- 
WHERE mb.email is not null -- email이 없는 곳 제외
;


-- 강의 질문 정보
create or replace view questionInfoOfLecture
as
SELECT * 
from question
NATURAL JOIN
(SELECT
question_id, avg(score) as avg_score,lecture_id
FROM my_rating
GROUP BY question_id,question_version,lecture_id) r
order by question_id;

