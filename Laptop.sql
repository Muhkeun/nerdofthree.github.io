﻿-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- member Table Create SQL
CREATE TABLE member
(
    seq              INT             NOT NULL, 
    password         VARCHAR2(80)    NULL, 
    member_Name      VARCHAR2(20)    NULL, 
    member_Age       INT             NULL, 
    member_Gender    VARCHAR2(10)    NULL, 
    f_Key            INT             NULL, 
    email            VARCHAR2(40)    NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (email)
)
/

CREATE SEQUENCE member_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER member_AI_TRG
BEFORE INSERT ON member 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT member_SEQ.NEXTVAL
    INTO :NEW.seq
    FROM DUAL;
END;
/

--DROP TRIGGER member_AI_TRG;
/

--DROP SEQUENCE member_SEQ;
/


-- member Table Create SQL
CREATE TABLE cpu_Bench
(
    cpu_Name     VARCHAR2(30)    NULL, 
    cpu_Point    INT             NULL   
)
/


-- member Table Create SQL
CREATE TABLE gpu_Bench
(
    gpu_Name     VARCHAR2(30)    NULL, 
    gpu_Point    INT             NULL   
)
/


-- member Table Create SQL
CREATE TABLE favorite
(
    f_Key          INT             NULL, 
    laptop_Name    VARCHAR2(70)    NULL   
)
/

COMMENT ON COLUMN favorite.f_Key IS 'f_Key'
/

COMMENT ON COLUMN favorite.laptop_Name IS 'laptop_Name'
/

ALTER TABLE favorite
    ADD CONSTRAINT FK_favorite_f_Key_member_f_Key FOREIGN KEY (f_Key)
        REFERENCES member (f_Key)
/


-- member Table Create SQL
CREATE TABLE program_Bench
(
    program_Name       INT    NULL, 
    program_Cpu_min    INT    NULL, 
    program_Cpu_max    INT    NULL, 
    program_Gpu_min    INT    NULL, 
    program_Gpu_max    INT    NULL   
)
/


-- member Table Create SQL
CREATE TABLE laptop
(
    laptop_Name           VARCHAR2(70)    NULL, 
    cpu_Name              VARCHAR2(30)    NULL, 
    gpu_Name              VARCHAR2(30)    NULL, 
    laptop_Memory         VARCHAR2(20)    NULL, 
    laptop_OS             VARCHAR2(20)    NULL, 
    laptop_MonitorSize    VARCHAR2(30)    NULL, 
    laptop_ImageURL       VARCHAR2(80)    NULL   
)
/

ALTER TABLE laptop
    ADD CONSTRAINT FK_laptop_laptop_Name_favorite FOREIGN KEY (laptop_Name)
        REFERENCES favorite (laptop_Name)
/

ALTER TABLE laptop
    ADD CONSTRAINT FK_laptop_cpu_Name_cpu_Bench_c FOREIGN KEY (cpu_Name)
        REFERENCES cpu_Bench (cpu_Name)
/

ALTER TABLE laptop
    ADD CONSTRAINT FK_laptop_gpu_Name_gpu_Bench_g FOREIGN KEY (gpu_Name)
        REFERENCES gpu_Bench (gpu_Name)
/


