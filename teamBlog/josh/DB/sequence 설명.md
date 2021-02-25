## sequence 설명

- sequence 생성

알림 테이블의 alarm_no 컬럼의 숫자 자동증가를 위한 sequence 생성을 예시로 들겠습니다.

1. 먼저 알림 테이블 alarm table 을 생성해줍니다.

CREATE TABLE ALARM (
	ALARM_NO NUMBER NOT NULL, /* 알림번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	ALARM_CONT VARCHAR2(200) NOT NULL, /* 알림내용 */
	ALARM_TYPE NUMBER NOT NULL, /* 알림유형 */
	ALARM_DATE DATE NOT NULL, /* 알림시간 */
	ALARM_CHK NUMBER, /* 알림확인여부 */
	ALARM_CHK_DATE DATE /* 알림확인시간 */
);


2. 그다음 alarm_no 를 위한 seq 를 생성해줍니다.


create sequence alarm_no_seq
start with 1
increment by 1;

시작값을 1로 증가값을 1로 정한다는 쿼리문입니다.


create sequence alarm_no_seq
start with 1
increment by 1


에 maxvalue 최대값 ,minvalue 최소값, cycle|nocycle 순환 , cache|nocache 시퀀스값 메모리 할당 을 추가 할 수 있습니다.

기본값으론 nocycle , cache20(오라클의 기본값) 으로 설정 됩니다.



3. 데이터 입력시 values 값에 alarm_no_seq를 넣어줍니다.


ex) insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk,alarm_chk_date) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'summer 가 새글을 등록했습니다.', '1',sysdate,'1',sysdate);

values 값 입력시 시퀀스이름.nextval 을 써주는게 중요합니다.

4. alarm_no가 자동증가합니다.

5. 결과값
![ING](ALARM_SEQ.png)

궁금하신 사항 남겨주세요. :)
