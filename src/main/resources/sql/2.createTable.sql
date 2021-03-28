-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- USER_MNG_T Table Create SQL
CREATE TABLE USER_MNG_T
(
    grade         CHAR(1)         NOT NULL,
    price         INT             NOT NULL,
    sale_rate     VARCHAR2(20)    NOT NULL,
    grade_name    VARCHAR2(20)    NOT NULL,
    CONSTRAINT USER_MNG_T_PK PRIMARY KEY (grade)
)
/

COMMENT ON TABLE USER_MNG_T IS '회원관리테이블( 12개월내에 구매한금액별등급 )'
/

COMMENT ON COLUMN USER_MNG_T.grade IS '등급'
/

COMMENT ON COLUMN USER_MNG_T.price IS '구매 금액'
/

COMMENT ON COLUMN USER_MNG_T.sale_rate IS '할인율'
/

COMMENT ON COLUMN USER_MNG_T.grade_name IS '등급 명'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE USER_T
(
    user_id       VARCHAR2(10)     NOT NULL,
    user_pw       VARCHAR2(20)     NOT NULL,
    user_name     VARCHAR2(20)     NOT NULL,
    zipcode       VARCHAR2(20)     NOT NULL,
    address       VARCHAR2(100)    NOT NULL,
    phone         VARCHAR2(20)     NOT NULL,
    email         VARCHAR2(30)     NOT NULL,
    birth         VARCHAR2(6)      NULL,
    birth_flag    CHAR(1)          NULL,
    user_grade    CHAR(1)          NOT NULL,
    black_yn      CHAR(1)          NULL,
    CONSTRAINT USER_T_PK PRIMARY KEY (user_id)
)
/

COMMENT ON TABLE USER_T IS '회원정보'
/

COMMENT ON COLUMN USER_T.user_id IS '회원 아이디'
/

COMMENT ON COLUMN USER_T.user_pw IS '회원 비밀번호'
/

COMMENT ON COLUMN USER_T.user_name IS '회원 명'
/

COMMENT ON COLUMN USER_T.zipcode IS '우편번호'
/

COMMENT ON COLUMN USER_T.address IS '주소'
/

COMMENT ON COLUMN USER_T.phone IS '전화번호'
/

COMMENT ON COLUMN USER_T.email IS '이메일'
/

COMMENT ON COLUMN USER_T.birth IS '생년월일'
/

COMMENT ON COLUMN USER_T.birth_flag IS '양력음력 구분'
/

COMMENT ON COLUMN USER_T.user_grade IS '회원 등급'
/

COMMENT ON COLUMN USER_T.black_yn IS '블랙리스트 여부'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ITEM_CODE_T
(
    item_code         VARCHAR2(5)     NOT NULL,
    item_main         VARCHAR2(5)     NOT NULL,
    item_main_name    VARCHAR2(20)    NOT NULL,
    item_sub          VARCHAR2(5)     NOT NULL,
    item_sub_name     VARCHAR2(20)    NOT NULL,
    CONSTRAINT ITEM_CODE_T_PK PRIMARY KEY (item_code)
)
/

COMMENT ON TABLE ITEM_CODE_T IS '상품코드'
/

COMMENT ON COLUMN ITEM_CODE_T.item_code IS '상품 코드'
/

COMMENT ON COLUMN ITEM_CODE_T.item_main IS '상품 대분류'
/

COMMENT ON COLUMN ITEM_CODE_T.item_main_name IS '상품 대분류 명'
/

COMMENT ON COLUMN ITEM_CODE_T.item_sub IS '상품 중분류'
/

COMMENT ON COLUMN ITEM_CODE_T.item_sub_name IS '상품 중분류 명'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ITEM_T
(
    item_id       VARCHAR2(20)     NOT NULL,
    item_name     VARCHAR2(20)     NOT NULL,
    item_color    VARCHAR2(200)    NOT NULL,
    full_price    NUMBER           NOT NULL,
    sale_rate     NUMBER           NOT NULL,
    contents      CLOB             NOT NULL,
    reg_date      TIMESTAMP        NOT NULL,
    item_code     VARCHAR2(5)      NOT NULL,
    photo1        VARCHAR2(100)    NOT NULL,
    photo2        VARCHAR2(100)    NULL,
    photo3        VARCHAR2(100)    NULL,
    CONSTRAINT ITEM_T_PK PRIMARY KEY (item_id)
)
/

COMMENT ON TABLE ITEM_T IS '상품'
/

COMMENT ON COLUMN ITEM_T.item_id IS '상품 아이디'
/

COMMENT ON COLUMN ITEM_T.item_name IS '상품 명'
/

COMMENT ON COLUMN ITEM_T.item_color IS '상품 색상'
/

COMMENT ON COLUMN ITEM_T.full_price IS '정가'
/

COMMENT ON COLUMN ITEM_T.sale_rate IS '할인율'
/

COMMENT ON COLUMN ITEM_T.contents IS '상품상세설명'
/

COMMENT ON COLUMN ITEM_T.reg_date IS '등록 일자'
/

COMMENT ON COLUMN ITEM_T.item_code IS '상품 코드'
/

COMMENT ON COLUMN ITEM_T.photo1 IS '상품사진1'
/

COMMENT ON COLUMN ITEM_T.photo2 IS '상품사진2'
/

COMMENT ON COLUMN ITEM_T.photo3 IS '상품사진3'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ITEM_COLOR_T
(
    color_code    VARCHAR2(7)     NOT NULL,
    color_name    VARCHAR2(20)    NOT NULL,
    CONSTRAINT ITEM_COLOR_T_PK PRIMARY KEY (color_code)
)
/

COMMENT ON TABLE ITEM_COLOR_T IS '상품색상'
/

COMMENT ON COLUMN ITEM_COLOR_T.color_code IS '색상 코드'
/

COMMENT ON COLUMN ITEM_COLOR_T.color_name IS '색상 명'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ITEM_SIZE_T
(
    seq          NUMBER          NOT NULL,
    item_main    VARCHAR2(5)     NOT NULL,
    size_info    VARCHAR2(20)    NOT NULL,
    CONSTRAINT ITEM_SIZE_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE ITEM_SIZE_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ITEM_SIZE_T_AI_TRG
    BEFORE INSERT ON ITEM_SIZE_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT ITEM_SIZE_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER ITEM_SIZE_T_AI_TRG;
/

--DROP SEQUENCE ITEM_SIZE_T_SEQ;
/

COMMENT ON TABLE ITEM_SIZE_T IS '상품사이즈템플릿'
/

COMMENT ON COLUMN ITEM_SIZE_T.seq IS '시퀀스'
/

COMMENT ON COLUMN ITEM_SIZE_T.item_main IS '상품 대분류'
/

COMMENT ON COLUMN ITEM_SIZE_T.size_info IS '사이즈 명칭'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE BOART_T
(
    seq          NUMBER           NOT NULL,
    title        VARCHAR2(150)    NOT NULL,
    writer_id    VARCHAR2(10)     NOT NULL,
    reg_date     TIMESTAMP        NOT NULL,
    type         VARCHAR2(2)      NOT NULL,
    contents     CLOB             NOT NULL,
    CONSTRAINT BOART_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE BOART_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER BOART_T_AI_TRG
    BEFORE INSERT ON BOART_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT BOART_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER BOART_T_AI_TRG;
/

--DROP SEQUENCE BOART_T_SEQ;
/

COMMENT ON TABLE BOART_T IS '게시판'
/

COMMENT ON COLUMN BOART_T.seq IS '시퀀스'
/

COMMENT ON COLUMN BOART_T.title IS '제목'
/

COMMENT ON COLUMN BOART_T.writer_id IS '작성자 아이디'
/

COMMENT ON COLUMN BOART_T.reg_date IS '등록 일자'
/

COMMENT ON COLUMN BOART_T.type IS '타입'
/

COMMENT ON COLUMN BOART_T.contents IS '내용'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ADDRESS_T
(
    seq             NUMBER           NOT NULL,
    user_id         VARCHAR2(10)     NOT NULL,
    zipcode         VARCHAR2(20)     NOT NULL,
    address         VARCHAR2(100)    NOT NULL,
    address_name    VARCHAR2(20)     NOT NULL,
    default_yn      CHAR(1)          NOT NULL,
    CONSTRAINT ADDRESS_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE ADDRESS_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ADDRESS_T_AI_TRG
    BEFORE INSERT ON ADDRESS_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT ADDRESS_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER ADDRESS_T_AI_TRG;
/

--DROP SEQUENCE ADDRESS_T_SEQ;
/

COMMENT ON TABLE ADDRESS_T IS '배송지관리'
/

COMMENT ON COLUMN ADDRESS_T.seq IS '시퀀스'
/

COMMENT ON COLUMN ADDRESS_T.user_id IS '회원 아이디'
/

COMMENT ON COLUMN ADDRESS_T.zipcode IS '우편번호'
/

COMMENT ON COLUMN ADDRESS_T.address IS '주소'
/

COMMENT ON COLUMN ADDRESS_T.address_name IS '주소 명'
/

COMMENT ON COLUMN ADDRESS_T.default_yn IS '기본배송지 여부'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ORDER_T
(
    order_no        VARCHAR2(12)    NOT NULL,
    user_id         VARCHAR2(10)    NOT NULL,
    item_id         VARCHAR2(20)    NOT NULL,
    color_code      VARCHAR2(7)     NOT NULL,
    order_size      VARCHAR2(20)    NOT NULL,
    qty             NUMBER          NOT NULL,
    order_date      TIMESTAMP       NOT NULL,
    order_status    CHAR(1)         NOT NULL,
    CONSTRAINT ORDER_T_PK PRIMARY KEY (order_no)
)
/

COMMENT ON TABLE ORDER_T IS '주문내역'
/

COMMENT ON COLUMN ORDER_T.order_no IS '년월일(8자리)+4자리'
/

COMMENT ON COLUMN ORDER_T.user_id IS '회원 아이디'
/

COMMENT ON COLUMN ORDER_T.item_id IS '상품 아이디'
/

COMMENT ON COLUMN ORDER_T.color_code IS '색상 코드'
/

COMMENT ON COLUMN ORDER_T.order_size IS '주문 사이즈'
/

COMMENT ON COLUMN ORDER_T.qty IS '수량'
/

COMMENT ON COLUMN ORDER_T.order_date IS '주문 일자'
/

COMMENT ON COLUMN ORDER_T.order_status IS '입금전,배송완료/취소,반품,교환 등'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE WISHLIST_T
(
    seq        NUMBER          NOT NULL,
    user_id    VARCHAR2(10)    NOT NULL,
    item_id    VARCHAR2(20)    NOT NULL,
    CONSTRAINT WISHLIST_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE WISHLIST_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER WISHLIST_T_AI_TRG
    BEFORE INSERT ON WISHLIST_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT WISHLIST_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER WISHLIST_T_AI_TRG;
/

--DROP SEQUENCE WISHLIST_T_SEQ;
/

COMMENT ON TABLE WISHLIST_T IS '위시리스트'
/

COMMENT ON COLUMN WISHLIST_T.seq IS '시퀀스'
/

COMMENT ON COLUMN WISHLIST_T.user_id IS '회원 아이디'
/

COMMENT ON COLUMN WISHLIST_T.item_id IS '상품 아이디'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE MILEAGE_T
(
    seq          NUMBER          NOT NULL,
    user_id      VARCHAR2(10)    NOT NULL,
    point        NUMBER          NOT NULL,
    mile_date    TIMESTAMP       NOT NULL,
    order_no     VARCHAR2(12)    NOT NULL,
    contents     VARCHAR2(40)    NOT NULL,
    use_yn       CHAR(1)         NOT NULL,
    CONSTRAINT MILEAGE_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE MILEAGE_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER MILEAGE_T_AI_TRG
    BEFORE INSERT ON MILEAGE_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT MILEAGE_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER MILEAGE_T_AI_TRG;
/

--DROP SEQUENCE MILEAGE_T_SEQ;
/

COMMENT ON TABLE MILEAGE_T IS '적립금'
/

COMMENT ON COLUMN MILEAGE_T.seq IS '시퀀스'
/

COMMENT ON COLUMN MILEAGE_T.user_id IS '회원 아이디'
/

COMMENT ON COLUMN MILEAGE_T.point IS '적립금'
/

COMMENT ON COLUMN MILEAGE_T.mile_date IS '적립일자'
/

COMMENT ON COLUMN MILEAGE_T.order_no IS '년월일(8자리)+4자리'
/

COMMENT ON COLUMN MILEAGE_T.contents IS '내용'
/

COMMENT ON COLUMN MILEAGE_T.use_yn IS '사용 여부'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE ITEM_SIZE_DETAIL_T
(
    seq              NUMBER          NOT NULL,
    item_id          VARCHAR2(20)    NOT NULL,
    item_main        VARCHAR2(5)     NOT NULL,
    item_size_seq    NUMBER          NOT NULL,
    size_name        VARCHAR2(20)    NOT NULL,
    size_value       NUMBER          NOT NULL,
    CONSTRAINT ITEM_SIZE_DETAIL_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE ITEM_SIZE_DETAIL_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ITEM_SIZE_DETAIL_T_AI_TRG
    BEFORE INSERT ON ITEM_SIZE_DETAIL_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT ITEM_SIZE_DETAIL_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER ITEM_SIZE_DETAIL_T_AI_TRG;
/

--DROP SEQUENCE ITEM_SIZE_DETAIL_T_SEQ;
/

COMMENT ON TABLE ITEM_SIZE_DETAIL_T IS '상품사이즈데이터'
/

COMMENT ON COLUMN ITEM_SIZE_DETAIL_T.seq IS '시퀀스'
/

COMMENT ON COLUMN ITEM_SIZE_DETAIL_T.item_id IS '상품 아이디'
/

COMMENT ON COLUMN ITEM_SIZE_DETAIL_T.item_main IS '상품 대분류'
/

COMMENT ON COLUMN ITEM_SIZE_DETAIL_T.item_size_seq IS '상품 사이즈 시퀀스'
/

COMMENT ON COLUMN ITEM_SIZE_DETAIL_T.size_name IS 'S,M,L...등'
/

COMMENT ON COLUMN ITEM_SIZE_DETAIL_T.size_value IS '사이즈 값'
/


-- USER_MNG_T Table Create SQL
CREATE TABLE BOARD_SUB_T
(
    seq          NUMBER          NOT NULL,
    board_seq    NUMBER          NOT NULL,
    writer_id    VARCHAR2(10)    NOT NULL,
    reg_date     TIMESTAMP       NOT NULL,
    contents     CLOB            NOT NULL,
    CONSTRAINT BOARD_SUB_T_PK PRIMARY KEY (seq)
)
/

CREATE SEQUENCE BOARD_SUB_T_SEQ
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER BOARD_SUB_T_AI_TRG
    BEFORE INSERT ON BOARD_SUB_T
    REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
    SELECT BOARD_SUB_T_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER BOARD_SUB_T_AI_TRG;
/

--DROP SEQUENCE BOARD_SUB_T_SEQ;
/

COMMENT ON TABLE BOARD_SUB_T IS '게시판 답변글 관리'
/

COMMENT ON COLUMN BOARD_SUB_T.seq IS '시퀀스'
/

COMMENT ON COLUMN BOARD_SUB_T.board_seq IS '게시판 시퀀스'
/

COMMENT ON COLUMN BOARD_SUB_T.writer_id IS '작성자 아이디'
/

COMMENT ON COLUMN BOARD_SUB_T.reg_date IS '등록 일자'
/

COMMENT ON COLUMN BOARD_SUB_T.contents IS '내용'
/


