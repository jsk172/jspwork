CREATE TABLE member (
   id               VARCHAR2(20)  PRIMARY KEY,
   passwd           VARCHAR2(25)   NOT NULL,
   name             VARCHAR2(30),
   email            VARCHAR2(30),
   phone            VARCHAR2(20)  NOT NULL,
   joindate         TIMESTAMP     DEFAULT SYSTIMESTAMP,
   zip_code         VARCHAR2(10),
   address          VARCHAR2(40),
   detailaddress    VARCHAR2(40)
);

CREATE TABLE cart (
   cartnum      NUMBER,
   cnt			NUMBER,
   cartdate     TIMESTAMP	DEFAULT SYSTIMESTAMP,
   pno          NUMBER,
   id           VARCHAR2(20),
   FOREIGN KEY(id) REFERENCES member,
   FOREIGN KEY(pno) REFERENCES product
);
CREATE SEQUENCE seq_cartnum NOCACHE;

CREATE TABLE purchasehistory(
    pdate           TIMESTAMP	DEFAULT SYSTIMESTAMP,
    pcnt            NUMBER,
    id              VARCHAR(20),
    pno             NUMBER,
    FOREIGN KEY(id) REFERENCES member,
    FOREIGN KEY(pno) REFERENCES product
);

CREATE TABLE product (
   pno          NUMBER          PRIMARY KEY,
   pname        VARCHAR2(40)    NOT NULL,
   price        NUMBER          NOT NULL,
   p_score      NUMBER,
   sal_num      NUMBER,
   pcontent     VARCHAR2(200),
   pfilename    VARCHAR2(50),
   category     VARCHAR2(30)
);
CREATE SEQUENCE seq_pno NOCACHE;

CREATE TABLE qa (
   qno       NUMBER          PRIMARY KEY,
   qtitle    VARCHAR2(50)    NOT NULL,
   qname     VARCHAR2(20)    NOT NULL,
   qdate     TIMESTAMP,
   qhit      NUMBER,
   qcontent  VARCHAR2(500),
   qfilename VARCHAR2(50),
   id       VARCHAR2(30)    NOT NULL,
   FOREIGN KEY(id) REFERENCES member
);

CREATE TABLE review (
   rno       NUMBER             PRIMARY KEY,
   rtype     VARCHAR2(20)       NOT NULL,
   rtitle    VARCHAR2(50)       NOT NULL,
   rdate     TIMESTAMP,
   rcontent  VARCHAR2(200),
   rrate     NUMBER,
   likes     NUMBER,
   id        VARCHAR2(30),
   FOREIGN KEY(id) REFERENCES member
);

CREATE TABLE notice (
   nno      NUMBER          PRIMARY KEY,
   ntitle   VARCHAR2(50)    NOT NULL,
   nfilename    VARCHAR2(20)    NOT NULL,
   ndate    TIMESTAMP       NOT NULL,
   nhit     NUMBER,
   ncontent VARCHAR2(500),
   id       VARCHAR2(30),
   FOREIGN KEY(id) REFERENCES member
);