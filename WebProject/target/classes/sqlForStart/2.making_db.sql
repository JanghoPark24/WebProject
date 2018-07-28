/* 질문항목당평균 */
CREATE TABLE TheLecture.item_avg (
	semester NUMBER NOT NULL, /* 수강학기 */
	lecture_code NUMBER NOT NULL, /* 강의코드 */
	question_num NUMBER NOT NULL, /* 질문번호 */
	question_version NUMBER NOT NULL, /* 질문버전 */
	item_avg_score NUMBER /* 항목당평균점수 */
);

CREATE UNIQUE INDEX TheLecture.PK_item_avg
	ON TheLecture.item_avg (
		semester ASC,
		lecture_code ASC,
		question_num ASC,
		question_version ASC
	);

ALTER TABLE TheLecture.item_avg
	ADD
		CONSTRAINT PK_item_avg
		PRIMARY KEY (
			semester,
			lecture_code,
			question_num,
			question_version
		);

COMMENT ON TABLE TheLecture.item_avg IS '질문항목당평균';

COMMENT ON COLUMN TheLecture.item_avg.semester IS '수강학기';

COMMENT ON COLUMN TheLecture.item_avg.lecture_code IS '강의코드';

COMMENT ON COLUMN TheLecture.item_avg.question_num IS '질문번호';

COMMENT ON COLUMN TheLecture.item_avg.question_version IS '질문버전';

COMMENT ON COLUMN TheLecture.item_avg.item_avg_score IS '항목당평균점수';

/* 강의댓글추천 */
CREATE TABLE TheLecture.lecture_reply_like (
	reply_num NUMBER NOT NULL, /* 강의 번호 */
	email VARCHAR2(40) NOT NULL /* 이메일 */
);

CREATE UNIQUE INDEX TheLecture.PK_lecture_reply_like
	ON TheLecture.lecture_reply_like (
		reply_num ASC,
		email ASC
	);

ALTER TABLE TheLecture.lecture_reply_like
	ADD
		CONSTRAINT PK_lecture_reply_like
		PRIMARY KEY (
			reply_num,
			email
		);

COMMENT ON TABLE TheLecture.lecture_reply_like IS '강의댓글추천';

COMMENT ON COLUMN TheLecture.lecture_reply_like.reply_num IS '강의 번호';

COMMENT ON COLUMN TheLecture.lecture_reply_like.email IS '이메일';

/* 질문 */
CREATE TABLE TheLecture.question (
	question_num NUMBER NOT NULL, /* 질문번호 */
	question_version NUMBER NOT NULL, /* 질문버전 */
	question_content VARCHAR2(2000) /* 질문내용 */
);

CREATE UNIQUE INDEX TheLecture.PK_question
	ON TheLecture.question (
		question_num ASC,
		question_version ASC
	);

ALTER TABLE TheLecture.question
	ADD
		CONSTRAINT PK_question
		PRIMARY KEY (
			question_num,
			question_version
		);

COMMENT ON TABLE TheLecture.question IS '질문';

COMMENT ON COLUMN TheLecture.question.question_num IS '질문번호';

COMMENT ON COLUMN TheLecture.question.question_version IS '질문버전';

COMMENT ON COLUMN TheLecture.question.question_content IS '질문내용';

/* 회원 */
CREATE TABLE TheLecture.member (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	nickname VARCHAR2(20) NOT NULL, /* 닉네임 */
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	password VARCHAR2(64) NOT NULL, /* 비밀번호 */
	is_mail_open VARCHAR2(1) NOT NULL, /* 메일공개여부 */
	grade VARCHAR2(8) NOT NULL, /* 등급(상태) */
	reg_key VARCHAR2(20) NOT NULL, /* 인증용키 */
	fail_count NUMBER NOT NULL, /* 접속실패횟수 */
	try_date DATE, /* 마지막접속시도 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	major VARCHAR2(30) NOT NULL, /* 전공 */
	profile_img VARCHAR2(20), /* 프로필사진 */
	profile VARCHAR2(200) /* 프로필 */
);

CREATE UNIQUE INDEX TheLecture.PK_member
	ON TheLecture.member (
		email ASC
	);

CREATE UNIQUE INDEX TheLecture.UIX_member
	ON TheLecture.member (
		nickname ASC
	);

ALTER TABLE TheLecture.member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			email
		);

ALTER TABLE TheLecture.member
	ADD
		CONSTRAINT UK_member
		UNIQUE (
			nickname
		);

COMMENT ON TABLE TheLecture.member IS '회원';

COMMENT ON COLUMN TheLecture.member.email IS '이메일';

COMMENT ON COLUMN TheLecture.member.nickname IS '닉네임';

COMMENT ON COLUMN TheLecture.member.univ_name IS '대학 이름';

COMMENT ON COLUMN TheLecture.member.password IS '비밀번호';

COMMENT ON COLUMN TheLecture.member.is_mail_open IS '메일공개여부';

COMMENT ON COLUMN TheLecture.member.grade IS '등급(상태)';

COMMENT ON COLUMN TheLecture.member.reg_key IS '인증용키';

COMMENT ON COLUMN TheLecture.member.fail_count IS '접속실패횟수';

COMMENT ON COLUMN TheLecture.member.try_date IS '마지막접속시도';

COMMENT ON COLUMN TheLecture.member.reg_date IS '등록날짜';

COMMENT ON COLUMN TheLecture.member.major IS '전공';

COMMENT ON COLUMN TheLecture.member.profile_img IS '프로필사진';

COMMENT ON COLUMN TheLecture.member.profile IS '프로필';

/* 강의 댓글 */
CREATE TABLE TheLecture.lecture_reply (
	reply_num NUMBER NOT NULL, /* 강의 번호 */
	semester NUMBER NOT NULL, /* 수강학기 */
	lecture_code NUMBER NOT NULL, /* 강의코드 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	ref NUMBER NOT NULL, /* 레퍼런스 */
	depth NUMBER NOT NULL, /* 깊이 */
	content VARCHAR2(600) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	is_deleted NUMBER NOT NULL /* 삭제여부 */
);

CREATE UNIQUE INDEX TheLecture.PK_lecture_reply
	ON TheLecture.lecture_reply (
		reply_num ASC
	);

ALTER TABLE TheLecture.lecture_reply
	ADD
		CONSTRAINT PK_lecture_reply
		PRIMARY KEY (
			reply_num
		);

COMMENT ON TABLE TheLecture.lecture_reply IS '강의 댓글';

COMMENT ON COLUMN TheLecture.lecture_reply.reply_num IS '강의 번호';

COMMENT ON COLUMN TheLecture.lecture_reply.semester IS '수강학기';

COMMENT ON COLUMN TheLecture.lecture_reply.lecture_code IS '강의코드';

COMMENT ON COLUMN TheLecture.lecture_reply.email IS '이메일';

COMMENT ON COLUMN TheLecture.lecture_reply.ref IS '레퍼런스';

COMMENT ON COLUMN TheLecture.lecture_reply.depth IS '깊이';

COMMENT ON COLUMN TheLecture.lecture_reply.content IS '내용';

COMMENT ON COLUMN TheLecture.lecture_reply.reg_date IS '등록날짜';

COMMENT ON COLUMN TheLecture.lecture_reply.is_deleted IS '삭제여부';

/* 내 평가 */
CREATE TABLE TheLecture.my_rating (
	question_num NUMBER NOT NULL, /* 질문번호 */
	question_version NUMBER NOT NULL, /* 질문버전 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	semester NUMBER NOT NULL, /* 수강학기 */
	lecture_code NUMBER NOT NULL, /* 강의코드 */
	question_score NUMBER NOT NULL, /* 질문점수 */
	reg_date DATE NOT NULL /* 등록날짜 */
);

CREATE UNIQUE INDEX TheLecture.PK_my_rating
	ON TheLecture.my_rating (
		question_num ASC,
		question_version ASC,
		email ASC,
		semester ASC,
		lecture_code ASC
	);

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT PK_my_rating
		PRIMARY KEY (
			question_num,
			question_version,
			email,
			semester,
			lecture_code
		);

COMMENT ON TABLE TheLecture.my_rating IS '내 평가';

COMMENT ON COLUMN TheLecture.my_rating.question_num IS '질문번호';

COMMENT ON COLUMN TheLecture.my_rating.question_version IS '질문버전';

COMMENT ON COLUMN TheLecture.my_rating.email IS '이메일';

COMMENT ON COLUMN TheLecture.my_rating.semester IS '수강학기';

COMMENT ON COLUMN TheLecture.my_rating.lecture_code IS '강의코드';

COMMENT ON COLUMN TheLecture.my_rating.question_score IS '질문점수';

COMMENT ON COLUMN TheLecture.my_rating.reg_date IS '등록날짜';

/* 공지사항 */
CREATE TABLE TheLecture.notice (
	board_num NUMBER NOT NULL /* 게시판 번호 */
);

CREATE UNIQUE INDEX TheLecture.PK_notice
	ON TheLecture.notice (
		board_num ASC
	);

ALTER TABLE TheLecture.notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			board_num
		);

COMMENT ON TABLE TheLecture.notice IS '공지사항';

COMMENT ON COLUMN TheLecture.notice.board_num IS '게시판 번호';

/* 게시판댓글추천 */
CREATE TABLE TheLecture.comunnity_board_reply_like (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	reply_num NUMBER NOT NULL /* 댓글번호 */
);

CREATE UNIQUE INDEX TheLecture.PK_comunnity_board_reply_like
	ON TheLecture.comunnity_board_reply_like (
		email ASC,
		reply_num ASC
	);

ALTER TABLE TheLecture.comunnity_board_reply_like
	ADD
		CONSTRAINT PK_comunnity_board_reply_like
		PRIMARY KEY (
			email,
			reply_num
		);

COMMENT ON TABLE TheLecture.comunnity_board_reply_like IS '게시판댓글추천';

COMMENT ON COLUMN TheLecture.comunnity_board_reply_like.email IS '이메일';

COMMENT ON COLUMN TheLecture.comunnity_board_reply_like.reply_num IS '댓글번호';

/* 게시판댓글 */
CREATE TABLE TheLecture.community_board_reply (
	reply_num NUMBER NOT NULL, /* 댓글번호 */
	board_num NUMBER, /* 게시판 번호 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	ref NUMBER NOT NULL, /* 레퍼런스 */
	depth NUMBER NOT NULL, /* 깊이 */
	content VARCHAR2(600), /* 내용 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	is_deleted NUMBER NOT NULL /* 삭제여부 */
);

CREATE UNIQUE INDEX TheLecture.PK_community_board_reply
	ON TheLecture.community_board_reply (
		reply_num ASC
	);

ALTER TABLE TheLecture.community_board_reply
	ADD
		CONSTRAINT PK_community_board_reply
		PRIMARY KEY (
			reply_num
		);

COMMENT ON TABLE TheLecture.community_board_reply IS '게시판댓글';

COMMENT ON COLUMN TheLecture.community_board_reply.reply_num IS '댓글번호';

COMMENT ON COLUMN TheLecture.community_board_reply.board_num IS '게시판 번호';

COMMENT ON COLUMN TheLecture.community_board_reply.email IS '이메일';

COMMENT ON COLUMN TheLecture.community_board_reply.ref IS '레퍼런스';

COMMENT ON COLUMN TheLecture.community_board_reply.depth IS '깊이';

COMMENT ON COLUMN TheLecture.community_board_reply.content IS '내용';

COMMENT ON COLUMN TheLecture.community_board_reply.reg_date IS '등록날짜';

COMMENT ON COLUMN TheLecture.community_board_reply.is_deleted IS '삭제여부';

/* 강의 */
CREATE TABLE TheLecture.lecture (
	semester NUMBER NOT NULL, /* 수강학기 */
	lecture_code NUMBER NOT NULL, /* 강의코드 */
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	major VARCHAR2(30) NOT NULL, /* 전공 */
	lecture_name VARCHAR2(40) NOT NULL, /* 강의 이름 */
	view_count NUMBER NOT NULL, /* 조회수 */
	rating_count NUMBER NOT NULL, /* 평가수 */
	is_deleted NUMBER NOT NULL, /* 삭제여부 */
	total_avg_score NUMBER NOT NULL /* 총평균점수 */
);

CREATE UNIQUE INDEX TheLecture.PK_lecture
	ON TheLecture.lecture (
		semester ASC,
		lecture_code ASC
	);

ALTER TABLE TheLecture.lecture
	ADD
		CONSTRAINT PK_lecture
		PRIMARY KEY (
			semester,
			lecture_code
		);

COMMENT ON TABLE TheLecture.lecture IS '강의';

COMMENT ON COLUMN TheLecture.lecture.semester IS '수강학기';

COMMENT ON COLUMN TheLecture.lecture.lecture_code IS '강의코드';

COMMENT ON COLUMN TheLecture.lecture.univ_name IS '대학 이름';

COMMENT ON COLUMN TheLecture.lecture.major IS '전공';

COMMENT ON COLUMN TheLecture.lecture.lecture_name IS '강의 이름';

COMMENT ON COLUMN TheLecture.lecture.view_count IS '조회수';

COMMENT ON COLUMN TheLecture.lecture.rating_count IS '평가수';

COMMENT ON COLUMN TheLecture.lecture.is_deleted IS '삭제여부';

COMMENT ON COLUMN TheLecture.lecture.total_avg_score IS '총평균점수';

/* 탈퇴요청회원 */
CREATE TABLE TheLecture.member_delete_requests (
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	delete_date DATE NOT NULL /* 삭제날짜 */
);

CREATE UNIQUE INDEX TheLecture.PK_member_delete_requests
	ON TheLecture.member_delete_requests (
		email ASC
	);

ALTER TABLE TheLecture.member_delete_requests
	ADD
		CONSTRAINT PK_member_delete_requests
		PRIMARY KEY (
			email
		);

COMMENT ON TABLE TheLecture.member_delete_requests IS '탈퇴요청회원';

COMMENT ON COLUMN TheLecture.member_delete_requests.email IS '이메일';

COMMENT ON COLUMN TheLecture.member_delete_requests.delete_date IS '삭제날짜';

/* 추천 */
CREATE TABLE TheLecture.comunnity_board_like (
	board_num NUMBER NOT NULL, /* 게시판 번호 */
	email VARCHAR2(40) NOT NULL /* 이메일 */
);

CREATE UNIQUE INDEX TheLecture.PK_comunnity_board_like
	ON TheLecture.comunnity_board_like (
		board_num ASC,
		email ASC
	);

ALTER TABLE TheLecture.comunnity_board_like
	ADD
		CONSTRAINT PK_comunnity_board_like
		PRIMARY KEY (
			board_num,
			email
		);

COMMENT ON TABLE TheLecture.comunnity_board_like IS '추천';

COMMENT ON COLUMN TheLecture.comunnity_board_like.board_num IS '게시판 번호';

COMMENT ON COLUMN TheLecture.comunnity_board_like.email IS '이메일';

/* 대학 */
CREATE TABLE TheLecture.univ (
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	univ_domain VARCHAR2(20), /* 대학 도메인 */
	univ_logo VARCHAR2(30) /* 대학 로고 */
);

CREATE UNIQUE INDEX TheLecture.PK_univ
	ON TheLecture.univ (
		univ_name ASC
	);

ALTER TABLE TheLecture.univ
	ADD
		CONSTRAINT PK_univ
		PRIMARY KEY (
			univ_name
		);

COMMENT ON TABLE TheLecture.univ IS '대학';

COMMENT ON COLUMN TheLecture.univ.univ_name IS '대학 이름';

COMMENT ON COLUMN TheLecture.univ.univ_domain IS '대학 도메인';

COMMENT ON COLUMN TheLecture.univ.univ_logo IS '대학 로고';

/* 커뮤니티 게시판 */
CREATE TABLE TheLecture.community_board (
	board_num NUMBER NOT NULL, /* 게시판 번호 */
	univ_name VARCHAR2(20) NOT NULL, /* 대학 이름 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	subject VARCHAR2(40) NOT NULL, /* 제목 */
	content VARCHAR2(2000) NOT NULL, /* 내용 */
	view_count NUMBER NOT NULL, /* 조회수 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	is_deleted NUMBER NOT NULL /* 삭제여부 */
);

CREATE UNIQUE INDEX TheLecture.PK_community_board
	ON TheLecture.community_board (
		board_num ASC
	);

ALTER TABLE TheLecture.community_board
	ADD
		CONSTRAINT PK_community_board
		PRIMARY KEY (
			board_num
		);

COMMENT ON TABLE TheLecture.community_board IS '커뮤니티 게시판';

COMMENT ON COLUMN TheLecture.community_board.board_num IS '게시판 번호';

COMMENT ON COLUMN TheLecture.community_board.univ_name IS '대학 이름';

COMMENT ON COLUMN TheLecture.community_board.email IS '이메일';

COMMENT ON COLUMN TheLecture.community_board.subject IS '제목';

COMMENT ON COLUMN TheLecture.community_board.content IS '내용';

COMMENT ON COLUMN TheLecture.community_board.view_count IS '조회수';

COMMENT ON COLUMN TheLecture.community_board.reg_date IS '등록날짜';

COMMENT ON COLUMN TheLecture.community_board.is_deleted IS '삭제여부';

ALTER TABLE TheLecture.item_avg
	ADD
		CONSTRAINT FK_lecture_TO_item_avg
		FOREIGN KEY (
			semester,
			lecture_code
		)
		REFERENCES TheLecture.lecture (
			semester,
			lecture_code
		);

ALTER TABLE TheLecture.item_avg
	ADD
		CONSTRAINT FK_question_TO_item_avg
		FOREIGN KEY (
			question_num,
			question_version
		)
		REFERENCES TheLecture.question (
			question_num,
			question_version
		);

ALTER TABLE TheLecture.lecture_reply_like
	ADD
		CONSTRAINT FK_lec_reply_TO_lec_reply_like
		FOREIGN KEY (
			reply_num
		)
		REFERENCES TheLecture.lecture_reply (
			reply_num
		);

ALTER TABLE TheLecture.lecture_reply_like
	ADD
		CONSTRAINT FK_mem_TO_lec_re_like
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.member
	ADD
		CONSTRAINT FK_univ_TO_member
		FOREIGN KEY (
			univ_name
		)
		REFERENCES TheLecture.univ (
			univ_name
		);

ALTER TABLE TheLecture.lecture_reply
	ADD
		CONSTRAINT FK_lecture_TO_lecture_reply
		FOREIGN KEY (
			semester,
			lecture_code
		)
		REFERENCES TheLecture.lecture (
			semester,
			lecture_code
		);

ALTER TABLE TheLecture.lecture_reply
	ADD
		CONSTRAINT FK_member_TO_lecture_reply
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT FK_question_TO_my_rating
		FOREIGN KEY (
			question_num,
			question_version
		)
		REFERENCES TheLecture.question (
			question_num,
			question_version
		);

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT FK_member_TO_my_rating
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.my_rating
	ADD
		CONSTRAINT FK_lecture_TO_my_rating
		FOREIGN KEY (
			semester,
			lecture_code
		)
		REFERENCES TheLecture.lecture (
			semester,
			lecture_code
		);

ALTER TABLE TheLecture.notice
	ADD
		CONSTRAINT FK_community_board_TO_notice
		FOREIGN KEY (
			board_num
		)
		REFERENCES TheLecture.community_board (
			board_num
		);

ALTER TABLE TheLecture.comunnity_board_reply_like
	ADD
		CONSTRAINT FK_mem_TO_com_board_re_like
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.comunnity_board_reply_like
	ADD
		CONSTRAINT FK_com_board_re_TO_like
		FOREIGN KEY (
			reply_num
		)
		REFERENCES TheLecture.community_board_reply (
			reply_num
		);

ALTER TABLE TheLecture.community_board_reply
	ADD
		CONSTRAINT FK_com_board_TO_reply
		FOREIGN KEY (
			board_num
		)
		REFERENCES TheLecture.community_board (
			board_num
		);

ALTER TABLE TheLecture.community_board_reply
	ADD
		CONSTRAINT FK_mem_TO_com_board_re
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.lecture
	ADD
		CONSTRAINT FK_univ_TO_lecture
		FOREIGN KEY (
			univ_name
		)
		REFERENCES TheLecture.univ (
			univ_name
		);

ALTER TABLE TheLecture.member_delete_requests
	ADD
		CONSTRAINT FK_mem_TO_mem_delete_requests
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.comunnity_board_like
	ADD
		CONSTRAINT FK_com_board_TO_com_board_like
		FOREIGN KEY (
			board_num
		)
		REFERENCES TheLecture.community_board (
			board_num
		);

ALTER TABLE TheLecture.comunnity_board_like
	ADD
		CONSTRAINT FK_mem_TO_com_board_like
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

ALTER TABLE TheLecture.community_board
	ADD
		CONSTRAINT FK_univ_TO_community_board
		FOREIGN KEY (
			univ_name
		)
		REFERENCES TheLecture.univ (
			univ_name
		);

ALTER TABLE TheLecture.community_board
	ADD
		CONSTRAINT FK_member_TO_community_board
		FOREIGN KEY (
			email
		)
		REFERENCES TheLecture.member (
			email
		);

