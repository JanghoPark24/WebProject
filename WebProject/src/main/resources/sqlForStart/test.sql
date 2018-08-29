
SELECT * FROM file_storage;

select * from member;
select * from lecture_reply;

select * from memberView;
ALTER TABLE lecture_reply
  ADD reply_order NUMBER;
  
  select * from memberView;
  
  select * from memberView;

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
		

		    select sum(question_id) sum_id, question_version
		    from question
		    where is_deleted = 'n'
		    group by question_version
		    order by sum_id		