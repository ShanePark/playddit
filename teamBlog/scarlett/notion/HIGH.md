# HIGH JAVA DAY5 - Set

강의 번호: 고급 JAVA
복습: No
유형: 강의
작성일시: 2021년 1월 19일 오후 8:16

## List와 Set의 차이점

1. List
- 데이터의 순서(index)가 있다.
- 중복되는 데이터를 저장할 수 있다.

2. Set

- 데이터의 순서(index)가 없다.
- 중복되는 데이터를 저장할 수 없다.

---

### 데이터 추가 - add( )

- Set에 데이터를 추가할 때도 add( ) 메서드를 사용한다.
- add( ) 메서드는 데이터 추가에 성공하면 true, 그렇지 않으면 false를 반환한다.

```java
HashSet hs1 = new HashSet();

hs1.add("DD");
hs1.add("AA");
hs1.add(2);
hs1.add("CC");
hs1.add("BB");
hs1.add(1);
hs1.add(3);

System.out.println("Set의 개수 : " + hs1.size());
System.out.println("Set데이터 : " + hs1);

//Set의 개수 : 7
//Set데이터 : [1, 2, AA, 3, BB, CC, DD] //순서가 없다
```

Set에 데이터를 추가할 때 중복되면 false를 반환하고 데이터 추가에 실패한다.

```java
boolean isAdd = hs1.add("FF");
System.out.println("중복되지 않을 때 : " + isAdd);
System.out.println("Set데이터 : " + hs1 );
//중복되지 않을 때 : true
//Set데이터 : [1, 2, AA, 3, BB, CC, DD, FF]

isAdd = hs1.add("CC");
System.out.println("중복될 때 : " + isAdd);
System.out.println("Set데이터 : " + hs1 );
//중복될 때 : false
//Set데이터 : [1, 2, AA, 3, BB, CC, DD, FF]
```

---

### 데이터 수정 및 삭제 - remove( ), clear( )

- Set의 데이터를 수정하려면 수정하는 명령이 따로 없기 때문에 해당 자료를 삭제한 후 추가해 주어야 한다.
- 자료 삭제 : remove(삭제할 데이터) ⇒ 반환값 : 삭제성공(true), 삭제실패(false)
- 전체 자료 삭제 : clear( )

```java
//"FF"데이터를 "EE"로 변경하기
hs1.remove("FF");
System.out.println("삭제 후 : " + hs1);
//삭제 후 : [1, 2, AA, 3, BB, CC, DD]

hs1.add("EE");
System.out.println("Set데이터 : " + hs1 );
//Set데이터 : [1, 2, AA, 3, BB, CC, DD, EE]

hs1.clear();
System.out.println("Set데이터 : " + hs1 );
//Set데이터 : []
```

---

### 데이터 불러오기 - Iterator형 객체

- Set의 데이터는 순서(index)가 없기 때문에 List처럼 index로 데이터를 하나씩 불러올 수 없다. 그래서 데이터를 하나씩 얻기 위해서 Iterator형 객체로 변환해야 한다.
- Iterator( ) : Set형의 데이터를 Iterator형 객체로 변환하는 메서드

```java
//Set데이터를 Iterator로 변환하기
Iterator it = hs1.iterator();

//Iterator의 hasNext()메서드
```