-- addrbook table 생성
CREATE TABLE addrbook(
    bnum     NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    tel      VARCHAR2(20),
    email    VARCHAR2(30) UNIQUE,
    gender   VARCHAR2(6),
    regdate  TIMESTAMP DEFAULT SYSTIMESTAMP
);
CREATE SEQUENCE seq_bnum NOCACHE; -- 자동 순번

INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '김지성', '010-2799-1701', 'jstar17@naver.com', '남');
-- 이메일 중복체크
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '김이레', '010-1234-5678', 'jstar17@naver.com', '여');

SELECT * FROM addrbook;

--이메일 찾기
select email from addrbook
where email = 'jstar17@naver.com';

delete from addrbook where bnum=6;

commit;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;
