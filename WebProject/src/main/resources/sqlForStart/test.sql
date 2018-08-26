
SELECT * FROM file_storage;

select * from member;


ALTER TABLE lecture_reply
  ADD reply_order NUMBER;
  
  
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