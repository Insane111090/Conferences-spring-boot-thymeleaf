DROP TABLE USERS;
DROP TABLE CONFERENCES;
DROP TABLE USERS_CONFERENCES;

CREATE TABLE USERS
(
    USER_ID          SERIAL PRIMARY KEY,
    FIRST_NAME       VARCHAR(50)  NOT NULL,
    LAST_NAME        VARCHAR(50)  NOT NULL,
    THIRD_NAME       VARCHAR(50),
    PASSWORD         VARCHAR(200) NOT NULL,
    DATE_OF_BIRTH    DATE         NOT NULL,
    GENDER           CHAR         NOT NULL,
    PHONE            VARCHAR(50),
    EMAIL            VARCHAR(255) NOT NULL UNIQUE,
    ORGANISATION     VARCHAR(70),
    UNIVERSITY       VARCHAR(100),
    DEPARTMENT       VARCHAR(100),
    EDUCATION_TYPE   VARCHAR(30),
    EDUCATION_STATUS VARCHAR(30),
    GRADUATION_YEAR  VARCHAR(4),
    USER_ROLE        VARCHAR(10)  NOT NULL
);

CREATE TABLE CONFERENCES
(
    CONFERENCE_ID      SERIAL PRIMARY KEY,
    TITLE              VARCHAR(100) NOT NULL,
    SHORT_DESCRIPTION  VARCHAR(100) NOT NULL,
    FULL_DESCRIPTION   VARCHAR(4000),
    CONF_LOCATION      VARCHAR(100) NOT NULL,
    ORGANIZER          VARCHAR(100) NOT NULL,
    CONTACTS           VARCHAR(100) NOT NULL,
    START_DATE         DATE         NOT NULL,
    END_DATE           DATE         NOT NULL,
    START_REGISTRATION DATE         NOT NULL,
    END_REGISTRATION   DATE         NOT NULL,
    CREATED_BY         INT          NOT NULL
);

alter TABLE CONFERENCES
add COLUMN CREATED_BY INT;


CREATE TABLE USERS_CONFERENCES
(
    USER_CONFERENCE_ID SERIAL PRIMARY KEY,
    USER_ID            INT         NOT NULL REFERENCES USERS (USER_ID) ON DELETE CASCADE,
    CONFERENCE_ID      INT         NOT NULL REFERENCES CONFERENCES (CONFERENCE_ID) ON DELETE CASCADE,
    ROLE               VARCHAR(20) NOT NULL,
    REPORT_FILE_PATH   VARCHAR(4000),
    REVIEW_FILE_PATH   VARCHAR(4000),
    reportIsOK         VARCHAR(10)
);

alter table USERS_CONFERENCES
    alter COLUMN reportIsOK type VARCHAR(10)
    ;

alter table USERS_CONFERENCES
add COLUMN REPORT_FILE_PATH VARCHAR(4000),
add COLUMN REVIEW_FILE_PATH VARCHAR(4000)
;

select *
FROM USERS;

SELECT *
FROM CONFERENCES;

select *
FROM USERS_CONFERENCES;

DELETE from USERS
where user_id = 33;

UPDATE users_conferences SET REPORTISOK = null WHERE user_conference_id = 52;


insert into USERS_CONFERENCES
values (1, 26, 4, 'SPEAKER');

select u.*, uc.ROLE
from CONFERENCES c,
     USERS_CONFERENCES uc,
     users u
where c.CONFERENCE_ID = uc.CONFERENCE_ID
and uc.USER_ID = u.USER_ID
and c.CONFERENCE_ID=8;


