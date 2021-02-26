-----------------------------------GET COLUMN LIST--
 select 'private ' || 
    -- NUMBER일 때는 int, 그 외는 모두 String으로 한다.
    decode(lower(data_type), 'number', 'int ', 'String ') ||
    lower(column_name) || ';'
from cols
where lower(table_name) = '테이블명'; 
-----------------------------------------------------

-----------------------------------------------------
-- users list who a001 is following 
-----------------------------------------------------
select followee
from follow
where follower = 'a001';
-----------------------------------------------------

-----------------------------------------------------
-- user "a004" information 
-----------------------------------------------------
select * 
from users
where user_id = 'a004';

-----------------------------------------------------

-----------------------------------------------------
-- user informations which a001 is following
-----------------------------------------------------
select * 
from users
where user_id in (select followee
                from follow
                where follower = 'psh40963@naver.com');
-----------------------------------------------------

-----------------------------------------------------
-- set new password 
-----------------------------------------------------
update users
set user_password = 'mU5ocy1vmV5+EMhXMRBDOw=='
where user_id = 'psh40963@naver.com';
-----------------------------------------------------

-----------------------------------------------------
-- insert new user
-----------------------------------------------------
INSERT INTO "PLAYDDIT"."USERS" (USER_ID, USER_NICKNAME, USER_PASSWORD, USER_NAME, USER_TEL, USER_BIRTH, USER_CLASS, USER_RATING, USER_SIGN_DATE) 
VALUES ('chdnjs7610@gmail.com', '테스터스칼릿', '1234', '박초원', '1234', TO_DATE('2005-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '202011_302', '1', TO_DATE('2021-02-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
-----------------------------------------------------

-----------------------------------------------------
--  login profile data loading
-----------------------------------------------------
select user_id, user_nickname,
(select count(*) from follow where follower=users.user_id) as following,
(select count(*) from follow where followee=users.user_id) as follower,
(select class_title ||' '|| class_num || ' - ' || class_room
from class
where class_id = (select class_id from users where user_id='psh40963@naver.com')) as className,
(select count(*)
from feed
where feed.user_id = users.user_id) as allFeed,
user_bio
from users
where user_id = 'psh40963@naver.com';
-----------------------------------------------------


-----------------------------------------------------
--  ALL the queries about MESSAGE 
-----------------------------------------------------
update message set msg_senddate = sysdate where msg_sender = 'psh40963@naver.com';

-- get senddate with exact time
select to_char(msg_senddate,'yyyy-mm-dd hh24:mi:ss') from message;

-- getMessage(user,audicence)
select b.user_nickname as receiver, c.user_nickname as sender, a.msg_content as content, to_char(a.msg_senddate,'yyyy-mm-dd hh24:mi:ss') as sentdate
from message a, users b, users c
where ((msg_sender = 'psh40963@naver.com' and msg_target_id = 'expedition1205@gmail.com')
or (msg_target_id = 'psh40963@naver.com' and msg_sender = 'expedition1205@gmail.com'))
and a.msg_target_id = b.user_id
and a.msg_sender = c.user_id
order by msg_no;
-----------------------------------------------------
commit;