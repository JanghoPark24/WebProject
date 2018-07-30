SELECT * FROM tab;
SELECT * FROM member;
SELECT * FROM univ;

delete from member;
purge;

/* 대학입력 */
insert INTO univ values(
'서울대학교','snu.ac.kr','logo1.gif'
);
insert INTO univ values(
'고려대학교','korea.ac.kr','logo2.gif'
);
insert INTO univ values(
'연세대학교','yonsei.ac.kr','logo3.gif'
);
insert INTO univ values(
'구글대학교','gmail.com','logo4.gif'
);

insert INTO univ values(
'네이버대학교','naver.com','logo5.gif'
);


/* 회원 입력*/
insert INTO member values(
    'TheLecture.corp@snu.ac.kr',
    '서울대학교', 'TheLecture',
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

create sequence lecture_id_seq
	start with 1
	increment by 1
	minvalue 0;
	

commit;

