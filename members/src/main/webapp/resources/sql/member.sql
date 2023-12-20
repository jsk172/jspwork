-- jweb, member테이블 생성
CREATE TABLE member(
    mno         INT,
    id          VARCHAR2(20) not null unique,
    passwd      VARCHAR2(20) not null,
    name        VARCHAR2(30) not null,
    email       VARCHAR2(50),
    gender      VARCHAR2(6),
    joindate    TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(mno)
);
CREATE SEQUENCE seq_mno NOCACHE;

insert into member(mno, id, passwd, name, email, gender) 
values(seq_mno.NEXTVAL,'khit', 'm1234567', '재원형', 'JWzzang@naver.com', '남');

