
SELECT * FROM file_storage;

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
  		  