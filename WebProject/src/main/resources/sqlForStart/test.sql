SELECT * from lecture_reply
WHERE   reply_num =91
order by reply_order;

select * from 
questionInfoOfLecture;
alter session set time_zone='Asia/Seoul';
select sysdate from dual;
select localtimestamp from dual;


select current_date from dual;

select * from tabs;
select * from lecture_reply_like;
select * from question 
        where question_version= '강의평가1' AND is_deleted='n'
        order by question_id 
        
        select * from lecture;
        
select * from lecture_reply;

select * from lecture_reply
order by reply_order;
        
insert into lecture(total_avg_score) values(0)
where lecture_id = 61;

select * from lecture;
delete LECTURE_REPLY_LIKE;
select * from lecture_reply_like;

update lecture_reply
set likes =0

select * from lecture_reply_like;

select * from lecture_reply;

