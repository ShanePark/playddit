-----------------------------------GET COLUMN LIST--
 select 'private ' || 
    -- NUMBER일 때는 int, 그 외는 모두 String으로 한다.
    decode(lower(data_type), 'number', 'int ', 'String ') ||
    lower(column_name) || ';'
from cols
where lower(table_name) = '테이블명'; 
-----------------------------------------------------
--
--      ALL ABOUT FOLLOWING
--
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
-- users informations who a001 is following
select * 
from users
where user_id in (select followee
                from follow
                where follower = 'psh40963@naver.com');
-----------------------------------------------------
-----------------------------------------------------
-- users informations who are following specific person
-----------------------------------------------------
select user_id as id, user_nickname as nickname,
        (select class_num ||' - ' || class_room from class where class_id=users.class_id) as department,
        nvl(user_pic,'default') as profile,
        (select count(*) from follow where follower = 'psh40963@naver.com' and followee = users.user_id) as followback
from users
where user_id in (select follower
                from follow
                where followee = 'psh40963@naver.com');
-----------------------------------------------------
-----------------------------------------------------
-- users list someone is following
select user_id as id, user_nickname as nickname,
        (select class_num ||' - ' || class_room from class where class_id=users.class_id) as department,
        nvl(user_pic,'default') as profile,
        (select count(*) from follow where follower = 'psh40963@naver.com' and followee = users.user_id) as followback
from users
where user_id in (select followee
                from follow
                where follower = 'psh40963@naver.com');
-----------------------------------------------------
-- insert following data
insert into follow 
(follow_no, follower, followee)
values(follow_no_seq.nextval, 'psh40963@naver.com', 'bomik0614@gmail.com');

-- delete following data
delete from follow
where follower = 'psh40963@naver.com'
and followee = 'bomik0614@gmail.com';

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
select user_id, user_nickname,class_id,
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

-- load people who i message with order by recent msg_no

select case when b.user_id='psh40963@naver.com' then c.user_id
            else b.user_id end as audience_id,
            a.msg_content, a.msg_senddate
from message a, users b, users c
where (msg_sender = 'psh40963@naver.com' or msg_target_id = 'psh40963@naver.com')
and a.msg_target_id = b.user_id
and a.msg_sender = c.user_id
order by msg_no desc;

-----------------------------------------------------
-- distinct by user_nickname 

select audience as user_nickname, (select user_id from users where user_nickname=audience) as user_id
from
(select case when (select user_nickname
                    from users
                    where user_id='psh40963@naver.com') = b.user_nickname then c.user_nickname
            else b.user_nickname end as audience, a.msg_content, a.msg_senddate
from message a, users b, users c
where (msg_sender = 'psh40963@naver.com' or msg_target_id = 'psh40963@naver.com')
and a.msg_target_id = b.user_id
and a.msg_sender = c.user_id
order by msg_no desc)
group by audience;
-----------------------------------------------------
-- send message 'c' from a to b . in here a is psh40963@naver.com b is exp...
insert into message 
(MSG_NO, MSG_TARGET_ID, MSG_SENDER, MSG_CONTENT, MSG_SENDDATE)
values(msg_no_seq.nextval,  'psh40963@naver.com','expedition1205@gmail.com', '과연 그럴까?', sysdate);
-----------------------------------------------------
-- getMessage(from specific group or class)
select class_msg.class_id as receiver, user_nickname as sender, msg_cont as content, msg_senddate as sentdate
from class_msg, users
where class_msg.class_id = 'C202011302'
and msg_sender = user_id
order by class_msg.cmsg_no;
-----------------------------------------------------
-- send message 'c' from a to b . AND B is not a person but a group
insert into class_msg 
(cMSG_NO, class_id, MSG_SENDER, MSG_CONT, MSG_SENDDATE)
values(cmsg_no_seq.nextval,'C202011302', 'psh40963@naver.com', '학급에 메시지 보내는 쿼리테스트.', sysdate);
-----------------------------------------------------

-----------------------------------------------------
--  ALL the queries about ALARM 
-----------------------------------------------------

-----------------------------------------------------
-- Get alarm list
select alarm_cont as cont, alarm_type as type, alarm_chk as chk
from alarm
where user_id = 'psh40963@naver.com'
order by alarm_no desc;
-----------------------------------------------------
-- insert new message alarm 
insert into alarm 
(alarm_no, user_id, alarm_cont, alarm_type, alarm_date, alarm_chk)
values(alarm_no_seq.nextval,'psh40963@naver.com', '스칼렛', 12, sysdate, 0);
-----------------------------------------------------
-- delete same message alarm before insert
delete from alarm 
where user_id = 'psh40963@naver.com' and alarm_cont = '스칼렛' and alarm_type = 12;
-----------------------------------------------------

commit;







