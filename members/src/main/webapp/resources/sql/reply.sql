CREATE TABLE reply(
    rno         NUMBER PRIMARY KEY, --댓글번호
    bno         NUMBER NOT NULL,    --게시글번호
    rcontent    VARCHAR2(2000) NOT NULL, --댓글내용
    replyer     VARCHAR2(20) NOT NULL, --작성자
    rdate       TIMESTAMP DEFAUlT SYSTIMESTAMP, --작성일
    rupdate     TIMESTAMP, -- 수정일
    foreign key(bno) REFERENCES board(bno) on delete CASCADE --외래키
);
CREATE SEQUENCE seq_rno NOCACHE;