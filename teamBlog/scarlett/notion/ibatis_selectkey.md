# ibatis - selectkey 사용법

강의 번호: 웹프로그래밍
복습: No
작성일시: 2021년 2월 9일 오후 3:48

# ibatis - selectkey

## selectkey 사용

- SQL 수행 작업 중 insert된 이후에 알 수 있는 값 또는 생성된 값을 바로 가져와서 select 쿼리를 보내야 하는 경우
- 주로 생성하고 난 후의 인덱스(번호)를 가져와 작업해야 하는 상황에서 많이 사용한다.
- 마이바티스, 아이바티스 모두 적용 가능

→ selectkey는 DB에 명령을 한번만 보내며, 우선 입력한 값의 결과값을 **다음 쿼리로 바로 return** 시켜준다.

---

## selectkey 속성

1. **keyProperty** : selectkey 구문의 결과가 세팅 될 대상
2. **keyColumn** : 리턴되는 결과의 컬럼명은 프로퍼티에 일치한다. 여러개의 컬럼을 사용한다면 컬럼명의 목록은 콤마를 사용해서 구분
3. **resultType** : 결과의 타입, 마이바티스는 String을 포함하여 키로 사용될 수 있는 간단한 타입을 허용
4. **order** : before 또는 after를 세팅할 수 있다.

→ before로 설정하면 키를 먼저 조회하고 그 값을 keyProperty에 세팅한 뒤 insert 구문을 실행한다.

→ after로 설정하면 insert 구문을 실행한 뒤 selectkey 구문을 실행한다. 오라클과 같은 데이터베이스에서는 insert 구문 내부에서 일관된 호출형태로 처리한다.

  5. statementType : 위 내용과 같다. 마이바티스는  Statement, PerparedStatement 그리고 CallableStatement을 매핑하기 위해 STATEMENT, PERPARED 그리고 CALLABLE 구문타입을 지원한다.

---

## selectkey를 사용하는 주목적

- java에서 insert 쿼리를 실행하고 값을 받은 후 값을 가지고 다시 쿼리를 DB에 전송하는 방법이 있다. 하지만, 불필요한 여러 번의 DB 입출력은 시간이 느려진다는 단점이 있다. 이 경우에 selectKey를 사용하여 바로 적용할 수 있다.