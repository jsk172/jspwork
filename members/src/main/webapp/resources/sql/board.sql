--board 테이블 생성
CREATE TABLE board(
    bno             NUMBER PRIMARY KEY,
    title           VARCHAR2(100) NOT NULL,
    content         CLOB NOT NULL,
    createdate      TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate      TIMESTAMP,
    hit             NUMBER DEFAULT 0,
    filename        VARCHAR2(50),
    id              VARCHAR2(20) NOT NULL,
    FOREIGN KEY(id) references member(id) ON DELETE CASCADE
);
CREATE SEQUENCE seq_bno NOCACHE;
insert into board(bno, title, content, id)
values(seq_bno.NEXTVAL, '글제목', '글내용입니다.', 'khit');
select * from board;
delete from board where bno = 3;
update board set title = '공지사항', content='공지사항 수정입니다.' where bno = 1;
-- 번호가 3번인 게시글의 조회수를 1증가
update board set hit = hit+1 where bno = 2;

commit;