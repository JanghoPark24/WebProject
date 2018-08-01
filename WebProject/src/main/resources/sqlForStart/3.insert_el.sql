SELECT * FROM tab;
SELECT * FROM member;
SELECT * FROM univ;

delete from member;
delete from univ;
purge;



CREATE SEQUENCE seq_board1_no START WITH 1 INCREMENT BY 1;--커뮤니티 게시판 시퀀스
CREATE SEQUENCE seq_board1_re_no START WITH 1 INCREMENT BY 1;--커뮤니티 게시판 리플 시퀀스
CREATE SEQUENCE seq_lecture_no START WITH 1 INCREMENT BY 1;--강의 리플 시퀀스
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


commit;
DROP table lecture  CASCADE CONSTRAINTS;

select * from LECTURE;


--insert into lecture values(seq_lecture_no.nextval, '서울대학교','언어학과',1,1,'L0441.000100_001','핀란드어 1','정도상','3',0,0,'n',0)





