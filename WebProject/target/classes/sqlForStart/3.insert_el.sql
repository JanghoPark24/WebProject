
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


/* 회원 입력*/
insert INTO member values(
'TheLecture.corp@snu.ac.kr','TheLecture','서울대학교','C54F4493021DE0A059CF719A2DCE3D20941EFE9A625122715BADD0B76244F6DD','y',
'master',/*관리자계정*/
'B6E0lnRevAWmKnASHCYY',/*인증키*/
0,null,sysdate,'컴퓨터공학과','image.jpg','관리자입니다.'
);

insert INTO member values(
'Ghest001@yonsei.ac.kr','Ghest001','연세대학교','C54F4493021DE0A059CF719A2DCE3D20941EFE9A625122715BADD0B76244F6DD','n',
'unknown',/*비인증회원*/
'BFjD4Q472OHqbIazkxFB',/*인증키*/
0,null,sysdate,'경제학과','image.jpg','인증 받지 않은 회원입니다.'
);

insert INTO member values(
'psy8p@yonsei.ac.kr','psy8p','연세대학교','C54F4493021DE0A059CF719A2DCE3D20941EFE9A625122715BADD0B76244F6DD','y',
'member',/*일반계정*/
'c6qVVkURkyLpdcGvjxnn',/*인증키*/
0,null,sysdate,'심리학과','image.jpg','일반 회원입니다.'
);

insert INTO member values(
'goodbye@korea.ac.kr','goobye','고려대학교','C54F4493021DE0A059CF719A2DCE3D20941EFE9A625122715BADD0B76244F6DD','n',
'delete',/*관리자계정*/
'97QrAcogIiLWhBgIZt7m',/*인증키*/
0,null,sysdate,'무역학과','image.jpg','탈퇴하려는 회원입니다.'
);

