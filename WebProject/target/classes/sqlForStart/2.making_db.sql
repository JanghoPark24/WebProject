/* 강의댓글추천 */
CREATE TABLE TheLecture.lecture_reply_like (
	reply_num NUMBER NOT NULL, /* 강의 번호 */
	email VARCHAR2(40) NOT NULL /* 이메일 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_lecture_reply_like
	ON TheLecture.lecture_reply_like (
		reply_num ASC,
		email ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.lecture_reply_like
	ADD
		CONSTRAINT PK_lecture_reply_like
		PRIMARY KEY (
			reply_num,
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 항목당 질문평가 */
CREATE TABLE TheLecture.lecture_rating (
	lecture_id VARCHAR2(20) NOT NULL, /* 강의ID */
	question_id NUMBER NOT NULL, /* 질문번호 */
	avg_score NUMBER /* 항목당 평균점수 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_lecture_rating
	ON TheLecture.lecture_rating (
		lecture_id ASC,
		question_id ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.lecture_rating
	ADD
		CONSTRAINT PK_lecture_rating
		PRIMARY KEY (
			lecture_id,
			question_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 회원 */
CREATE TABLE TheLecture.member (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	nickname VARCHAR2(20) NOT NULL, /* 닉네임 */
	password VARCHAR2(64) NOT NULL, /* 비밀번호 */
	is_mail_open VARCHAR2(1) NOT NULL, /* 메일공개여부 */
	grade VARCHAR2(8) NOT NULL, /* 등급(상태) */
	fail_count NUMBER NOT NULL, /* 접속실패횟수 */
	try_date DATE, /* 마지막접속시도 */
	reg_key VARCHAR2(60) NOT NULL, /* 인증용키 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	major VARCHAR2(30) NOT NULL, /* 전공 */
	profile_img VARCHAR2(20), /* 프로필사진 */
	profile VARCHAR2(200) /* 프로필 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_member
	ON TheLecture.member (
		email ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

CREATE UNIQUE INDEX TheLecture.UIX_member
	ON TheLecture.member (
		nickname ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.member
	ADD
		CONSTRAINT UK_member
		UNIQUE (
			nickname
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 강의 댓글 */
CREATE TABLE TheLecture.lecture_reply (
	reply_num NUMBER NOT NULL, /* 강의 번호 */
	lecture_id VARCHAR2(20), /* 강의ID */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	ref NUMBER NOT NULL, /* 레퍼런스 */
	depth NUMBER NOT NULL, /* 깊이 */
	content VARCHAR2(600) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	is_deleted VARCHAR2(1) NOT NULL /* 삭제여부 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_lecture_reply
	ON TheLecture.lecture_reply (
		reply_num ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.lecture_reply
	ADD
		CONSTRAINT PK_lecture_reply
		PRIMARY KEY (
			reply_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 내 평가 */
CREATE TABLE TheLecture.my_rating (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	lecture_id VARCHAR2(20) NOT NULL, /* 강의ID */
	question_id NUMBER NOT NULL, /* 질문번호 */
	score NUMBER NOT NULL, /* 점수 */
	reg_date DATE NOT NULL /* 등록날짜 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_my_rating
	ON TheLecture.my_rating (
		email ASC,
		lecture_id ASC,
		question_id ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT PK_my_rating
		PRIMARY KEY (
			email,
			lecture_id,
			question_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 공지사항 */
CREATE TABLE TheLecture.notice (
	board_num NUMBER NOT NULL /* 게시판 번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_notice
	ON TheLecture.notice (
		board_num ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			board_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 게시판댓글추천 */
CREATE TABLE TheLecture.comunnity_board_reply_like (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	reply_num NUMBER NOT NULL /* 댓글번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_comunnity_board_reply_like
	ON TheLecture.comunnity_board_reply_like (
		email ASC,
		reply_num ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.comunnity_board_reply_like
	ADD
		CONSTRAINT PK_comunnity_board_reply_like
		PRIMARY KEY (
			email,
			reply_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 게시판댓글 */
CREATE TABLE TheLecture.community_board_reply (
	reply_num NUMBER NOT NULL, /* 댓글번호 */
	board_num NUMBER, /* 게시판 번호 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	ref NUMBER NOT NULL, /* 레퍼런스 */
	depth NUMBER NOT NULL, /* 깊이 */
	content VARCHAR2(600), /* 내용 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	is_deleted VARCHAR2(1) NOT NULL /* 삭제여부 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_community_board_reply
	ON TheLecture.community_board_reply (
		reply_num ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.community_board_reply
	ADD
		CONSTRAINT PK_community_board_reply
		PRIMARY KEY (
			reply_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 강의 */
CREATE TABLE TheLecture.lecture (
	lecture_id VARCHAR2(20) NOT NULL, /* 강의ID */
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	major VARCHAR2(30) NOT NULL, /* 전공 */
	semester NUMBER NOT NULL, /* 수강학기 */
	lecture_code NUMBER NOT NULL, /* 강의코드 */
	lecture_name VARCHAR2(40) NOT NULL, /* 강의 이름 */
	professor VARCHAR2(40), /* 교수 */
	view_count NUMBER NOT NULL, /* 조회수 */
	rating_count NUMBER NOT NULL, /* 평가수 */
	is_deleted VARCHAR2(1) NOT NULL, /* 삭제여부 */
	total_avg_score NUMBER NOT NULL /* 총평균점수 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_lecture
	ON TheLecture.lecture (
		lecture_id ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.lecture
	ADD
		CONSTRAINT PK_lecture
		PRIMARY KEY (
			lecture_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 탈퇴요청회원 */
CREATE TABLE TheLecture.member_delete_requests (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	delete_date DATE NOT NULL /* 삭제날짜 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_member_delete_requests
	ON TheLecture.member_delete_requests (
		email ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.member_delete_requests
	ADD
		CONSTRAINT PK_member_delete_requests
		PRIMARY KEY (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 추천 */
CREATE TABLE TheLecture.comunnity_board_like (
	board_num NUMBER NOT NULL, /* 게시판 번호 */
	email VARCHAR2(40) NOT NULL /* 이메일 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_comunnity_board_like
	ON TheLecture.comunnity_board_like (
		board_num ASC,
		email ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.comunnity_board_like
	ADD
		CONSTRAINT PK_comunnity_board_like
		PRIMARY KEY (
			board_num,
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 대학 */
CREATE TABLE TheLecture.univ (
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	univ_domain VARCHAR2(20), /* 대학 도메인 */
	univ_logo VARCHAR2(30) /* 대학 로고 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_univ
	ON TheLecture.univ (
		univ_name ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.univ
	ADD
		CONSTRAINT PK_univ
		PRIMARY KEY (
			univ_name
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 커뮤니티 게시판 */
CREATE TABLE TheLecture.community_board (
	board_num NUMBER NOT NULL, /* 게시판 번호 */
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	subject VARCHAR2(40) NOT NULL, /* 제목 */
	content VARCHAR2(2000) NOT NULL, /* 내용 */
	view_count NUMBER NOT NULL, /* 조회수 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	is_deleted VARCHAR2(1) NOT NULL /* 삭제여부 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_community_board
	ON TheLecture.community_board (
		board_num ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.community_board
	ADD
		CONSTRAINT PK_community_board
		PRIMARY KEY (
			board_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 질문 */
CREATE TABLE TheLecture.question (
	question_id NUMBER NOT NULL, /* 질문번호 */
	question_version NUMBER, /* 질문버젼 */
	question_content VARCHAR2(2000) /* 질문내용 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_question2
	ON TheLecture.question (
		question_id ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.question
	ADD
		CONSTRAINT PK_question2
		PRIMARY KEY (
			question_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* 질문 버젼 */
CREATE TABLE TheLecture.question_version (
	question_version NUMBER NOT NULL /* 질문버젼 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX TheLecture.PK_question_version2
	ON TheLecture.question_version (
		question_version ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	NOSORT
	NOPARALLEL;

ALTER TABLE TheLecture.question_version
	ADD
		CONSTRAINT PK_question_version2
		PRIMARY KEY (
			question_version
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture_reply_like
	ADD
		CONSTRAINT FK_lec_reply_TO_lec_reply_like
		FOREIGN KEY (
			reply_num
		)
		REFERENCES TheLecture.lecture_reply (
			reply_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture_reply_like
	ADD
		CONSTRAINT FK_mem_TO_lec_re_like
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture_rating
	ADD
		CONSTRAINT FK_lecture_TO_lecture_rating
		FOREIGN KEY (
			lecture_id
		)
		REFERENCES TheLecture.lecture (
			lecture_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture_rating
	ADD
		CONSTRAINT FK_question_TO_lecture_rating
		FOREIGN KEY (
			question_id
		)
		REFERENCES TheLecture.question (
			question_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.member
	ADD
		CONSTRAINT FK_univ_TO_member
		FOREIGN KEY (
			univ_name
		)
		REFERENCES TheLecture.univ (
			univ_name
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture_reply
	ADD
		CONSTRAINT FK_lecture_TO_lecture_reply
		FOREIGN KEY (
			lecture_id
		)
		REFERENCES TheLecture.lecture (
			lecture_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture_reply
	ADD
		CONSTRAINT FK_member_TO_lecture_reply
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT FK_member_TO_my_rating
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT FK_lecture_rating_TO_my_rating
		FOREIGN KEY (
			lecture_id,
			question_id
		)
		REFERENCES TheLecture.lecture_rating (
			lecture_id,
			question_id
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.notice
	ADD
		CONSTRAINT FK_community_board_TO_notice
		FOREIGN KEY (
			board_num
		)
		REFERENCES TheLecture.community_board (
			board_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.comunnity_board_reply_like
	ADD
		CONSTRAINT FK_mem_TO_com_board_re_like
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.comunnity_board_reply_like
	ADD
		CONSTRAINT FK_com_board_re_TO_like
		FOREIGN KEY (
			reply_num
		)
		REFERENCES TheLecture.community_board_reply (
			reply_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.community_board_reply
	ADD
		CONSTRAINT FK_com_board_TO_reply
		FOREIGN KEY (
			board_num
		)
		REFERENCES TheLecture.community_board (
			board_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.community_board_reply
	ADD
		CONSTRAINT FK_mem_TO_com_board_re
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.lecture
	ADD
		CONSTRAINT FK_univ_TO_lecture
		FOREIGN KEY (
			univ_name
		)
		REFERENCES TheLecture.univ (
			univ_name
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.member_delete_requests
	ADD
		CONSTRAINT FK_mem_TO_mem_delete_requests
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.comunnity_board_like
	ADD
		CONSTRAINT FK_com_board_TO_com_board_like
		FOREIGN KEY (
			board_num
		)
		REFERENCES TheLecture.community_board (
			board_num
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.comunnity_board_like
	ADD
		CONSTRAINT FK_mem_TO_com_board_like
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.community_board
	ADD
		CONSTRAINT FK_univ_TO_community_board
		FOREIGN KEY (
			univ_name
		)
		REFERENCES TheLecture.univ (
			univ_name
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.community_board
	ADD
		CONSTRAINT FK_member_TO_community_board
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE TheLecture.question
	ADD
		CONSTRAINT FK_qes_ver_TO_qes
		FOREIGN KEY (
			question_version
		)
		REFERENCES TheLecture.question_version (
			question_version
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;