# 전체적인 흐름 이해하기

1. 쿼리생성
데이터베이스에서 필요한 데이터를 가져오기 위해 sql문을 작성해서 테스트해보고 
문제없이 실행되면 ok

2. html파일에 출력할 형식을 작성

3. 사용할 pacakge를 생성(main, dao, service, vo)

4. dao 패키지에 Dao Interface를 만들어서 사용할 함수이름을 설정(throws SQLException을 해줌)

5. service패키지에  Service Interface만들어서 Dao Interface에서 작성한 함수이름 그대로 붙이기

6. Dao Interface를 상속하는 DaoImpl 생성

7. xml을 작성
쿼리문의 id는 생성했던 함수이름을 사용하고 resulstClass에는 반환값을
ParameterClass에는 파라미터로 받을 값을 넣어줌

8. 지금까지 작성한 내용이 문제없는지 확인
test파일을 하나 만들어서 (.class에 main포함) test를 실행해본다.
만든 dao를 test해보고싶다면 사용할 객체를 불러오고
'필요한 값'을 선언해주고 만약 리턴값 형식이 List라면 List를 생성하고
생성한 list값에 사용할 객체에서 함수를 불러와서 넣어준다. 파라미터로 선언한 '필요한 값'을
넣어준다. 그리고 출력해본다. 
출력이 잘 된다면 여기까지는 문제없이 코딩한 것이다.

9. Service Interface를 상속하는 ServiceImpl생성
=⇒ 8번과 마찬가지로 test해본다.

10. Servlet 을 만들기 전에 js에서 함수먼저 작성
$.ajax에서 url경로도 먼저 설정해줘서 헷갈리지 않게
그 외에 type, 파라미터가 있다면  data, success, error, dataType까지 적어준다.

* data 형식에서 {'a' : b} 
→ 'a' 는 내가 설정해주는 값이고, b는 파라미터 값이다.

11. mapping 
$.ajax에서 설정한 url경로를 사용해  mapping한다.

12. Servlet 생성
생성하고 Servlet까지 넘어오는지 실행해본다

    ![%E1%84%8C%E1%85%A5%E1%86%AB%E1%84%8E%E1%85%A6%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%8B%E1%85%B5%E1%86%AB%20%E1%84%92%E1%85%B3%E1%84%85%E1%85%B3%E1%86%B7%20%E1%84%8B%E1%85%B5%E1%84%92%E1%85%A2%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%2088c12bec90594ea7bf008c190e2967eb.png](%E1%84%8C%E1%85%A5%E1%86%AB%E1%84%8E%E1%85%A6%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%8B%E1%85%B5%E1%86%AB%20%E1%84%92%E1%85%B3%E1%84%85%E1%85%B3%E1%86%B7%20%E1%84%8B%E1%85%B5%E1%84%92%E1%85%A2%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%2088c12bec90594ea7bf008c190e2967eb.png)

13. 흐름을 살펴보면 위의 그림과 같다
DB로 갈때는 Servlet에서 보낸 data를 가지고 가고 sql문을 실행해서 return 값을 가지고 다시 돌아간다.
Servlet에서 보낸 data가 String 형식이라면 갈때는 String형식의 data를
sql문 실행결과 return값이 List라면 List를 전달해준다.

14. Servlet을 작성
return을 jsp로 해준다. 
* 여기서 반환값을 json으로 바꿔서 보낼 수 있다.
  String listJson = new Gson().toJson(반환값);

15. jsp파일 생성
위에서 말한 반환값을 json으로 바꿔서 보내면 jsp파일 작성이 간단해진다.

16. $.ajax부분의 success부분을 완성해 마무리
* 출력할 때 넘어온 데이터는 vo에서 설정해준 이름과 동일하다
헷갈리지 않기 위해 db에서 작성한 컬럼명 그대로 가져오는 것이 편하다.
