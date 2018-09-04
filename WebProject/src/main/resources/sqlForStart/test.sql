SELECT * from
 (select rownum rnum, c.board_num,c.univ_name, c.subject,
        c.REG_DATE, c.VIEW_COUNT , nickname
         FROM qna_board c , member r where c.email = r.email order by c.reg_date desc,c.board_num desc)  
        where rnum >= ((1-1) * 10+1)  and rnum <= (1 * 10)          
select * from user_sequences;
        select * from member;
     
        
        where rnum >= ((1-1) * 10+1)  and rnum <= (1 * 10)  
        
        select * from member;
        select * from qna_board;
        
        select qna_board_seq.currval from dual;
        select rownum rnum, c.board_num,c.univ_name, c.subject,
        c.REG_DATE, c.VIEW_COUNT , nickname
         FROM qna_board c , member r 
         where c.email = r.email 
         order by c.board_num desc,c.reg_date desc
        select
         
        SELECT *
        FROM(
	        SELECT rownum rnum, board_num, univ_name, subject,
	        REG_DATE, VIEW_COUNT , nickname 
	        FROM
		        (SELECT *
		        FROM QNA_BOARD q, member m
		        WHERE q.email = m.email
		        order by board_num desc))
        WHERE rnum>= ((1-1) * 10+1)
        and rnum <= (1* 10) 
        
select * from qna_board;
select rownum,board_num,subject,reg_date from qna_board ;
SELECT * FROM file_storage;
UPDATE lecture
        SET
        grade=1
        where lecture_id = 41
select * from question;
select * from lecture;
select question_verson from
			lecture 
			where lecture_id=6
select * from question
SELECT * from question;

SELECT * from question
		WHERE QUESTION_VERSION=
			(select question_version from
			lecture 
			where lecture_id=21)
		ORDER BY question_id
		
		SELECT * from MY_RATING;

alter table my_rating
drop constraint "THELECTURE.PK_MY_RATING";
select * from member;
select * from lecture_reply;
delete from lecture_reply;
select * from memberView;
ALTER TABLE lecture_reply
  ADD reply_order NUMBER;
  
SELECT count(reply_num) from lecture_reply
		WHERE
		lecture_id =6
		 
  
select * from lecture_reply;  
select * from
lecture_reply lr, 
(select email, nickname from member) m 
where lr.email = m.email;

select * from lecture;

right outer join lecture_reply_like lrl
on lr.
SELECT 
  		FROM
  		lecture_reply lr
  		FULL OUTER JOIN (SELECT email, UPLOADEDFILE from memberView where isdeleted ='n') m
		ON lr.email = m.email;


		select * from community_board;
		select c.email from community_board c, member m
		where c.email = m.email and
		univ_name IS NOT NULL
  		select * from community_board;
		
		select cm.*, uploadedFile from
		(select * from community_board c, member m
		where c.email = m.email and
		is_deleted='n') cm
		full outer join memberView mv
		on cm.email = mv.email
		
		order by board_num desc
		
 select * from lecture_reply;
 delete from lecture_reply
 where reply_num in (26,25,2);
 
		
ALTER TABLE member
  DROP column reply_order;
  
  select sequence_name from ALL_SEQUENCES ;
  
 SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'LECTURE_REPLY'

select * from lecture_reply;

insert into lecture_reply
		values(seq_board1_re_no.nextval,
				6,
				'TheLecture.corp@gmail.com',
				seq_board1_re_no.currval,0,
				'aaaa',sysdate,'n',
				nvl((select max(reply_order)
					from lecture_reply
					where lecture_id=6)+1,0)
				
		);

select * from memberView;
    
SELECT nickname, email, UPLOADEDFILE from memberView
SELECT * from questionInfoOfLecture
		WHERE lecture_id =61 and
		question_version='강의평가1'
		
select * from lecture_reply;
SELECT nvl(trunc(avg(avg_score)*5/6, 2),0)
		FROM questionInfoOfLecture
		WHERE lecture_id=61 and
		question_version = 
		(select question_version
		from lecture
		where lecture_id=61) 
		
select * from lecture_reply;
        SELECT *
  		FROM
  		lecture_reply lr
  		FULL OUTER JOIN (SELECT nickname, email, UPLOADEDFILE from memberView where is_deleted='n') m
		ON lr.email = m.email
  		WHERE
		lecture_id =6 and
		depth= 0
		order by reply_order desc
        
  select * from lecture_reply;
        SELECT *
  		FROM
  		lecture_reply lr
  		LEFT OUTER JOIN (SELECT nickname,isdeleted, email, UPLOADEDFILE from memberView) m
		ON lr.email = m.email
 SELECT * FROM LECTURE;
 SELECT * FROM MY_RATING;
 
 select * from questionInfoOfLecture;
SELECT * 
from 
lecture l
RIGHT OUTER JOIN
(SELECT *
FROM my_rating) r
ON r.question_version = l.question_version
order by question_id;


select * from question ;
        where question_version= #{question_version,jdbcType=VARCHAR} AND is_deleted='n'
        order by question_id