CREATE TABLE MEMEMER_BACK
AS
    SELECT
        m.*, sysdate backup_date
    FROM
        member m
    WHERE
        1=2
;

CREATE TABLE SURVEY_BACK
AS
    SELECT
        m.*, sysdate backup_date
    FROM
        survey m
    WHERE
        1=2
;


CREATE TABLE BOARD_BACK
AS
    SELECT
        m.*, sysdate backup_date
    FROM
        board m
    WHERE
        1=2
;

CREATE TABLE GUESTBOARD_BACK
AS
    SELECT
        m.*, sysdate backup_date
    FROM
        guestboard m
    WHERE
        1=2
;


CREATE TABLE REBOARD_BACK
AS
    SELECT
        m.*, sysdate backup_date
    FROM
        reboard m
    WHERE
        1=2
;

-- 기본으로 NULLABLE 인 제약조건 NOT NULL 로 변경
ALTER TABLE mememer_back
MODIFY backup_date
    CONSTRAINT MEMBBACK_BDATE_NN NOT NULL;
    
ALTER TABLE guestboard_back
MODIFY backup_date
    CONSTRAINT GBRDBACK_BDATE_NN NOT NULL;
    
ALTER TABLE board_back
MODIFY backup_date
    CONSTRAINT BRDBACK_BDATE_NN NOT NULL;
    
ALTER TABLE reboard_back
MODIFY backup_date
    CONSTRAINT RBRDBACK_BDATE_NN NOT NULL;

ALTER TABLE survey_back
MODIFY backup_date
    CONSTRAINT SVBACK_BDATE_NN NOT NULL;


-- 제약조건비활성
ALTER TABLE guestboard
DISABLE CONSTRAINT GBRD_WRITER_FK;

ALTER TABLE board
DISABLE CONSTRAINT BRD_MNO_FK;

ALTER TABLE reboard
DISABLE CONSTRAINT RBRD_MNO_FK;

ALTER TABLE survey
DISABLE CONSTRAINT SV_MNO_FK;

DELETE FROM member
WHERE
    MNO = 1014;

ALTER TABLE guestboard
ENABLE CONSTRAINT GBRD_WRITER_FK;

ALTER TABLE board
ENABLE CONSTRAINT BRD_MNO_FK;

ALTER TABLE reboard
ENABLE CONSTRAINT RBRD_MNO_FK;

ALTER TABLE survey
ENABLE CONSTRAINT SV_MNO_FK;