/* 
https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
학생테이블의 성적과 성적 테이블의 최하점수, 최고점수를 이용해 등급을 구한다.
ON 대신 WHERE를 써줘도 된다. (INNER JOIN에서 on과 where는 같은 결과가 나오기 때문에)

참고링크
https://developyo.tistory.com/121
https://stackoverflow.com/questions/1018822/inner-join-on-vs-where-clause

문제는 해당 문제의 테스트케이스가 부실해서 S.marks를 해주지 않아도 통과된다;;

테스트케이스: https://hr-testcases-us-east-1.s3.amazonaws.com/12891/output000.txt?AWSAccessKeyId=AKIAR6O7GJNX5DNFO3PV&Expires=1669867181&Signature=20IQTv04%2F6T11dDHkeNq4QhnYAE%3D&response-content-type=text%2Fplain
Britney 10 95 
Heraldo 10 94 
Julia 10 96 
Kristeen 10 100 
Stuart 10 99 
Amina 9 89 
Christene 9 88 
Salma 9 81 
Samantha 9 87 
Scarlet 9 80
Vivek 9 84 
Aamina 8 77 
Belvet 8 78 
Paige 8 74 
Priya 8 76 
Priyanka 8 77  
NULL 7 64 
NULL 7 66 
NULL 6 55 
NULL 4 34 
NULL 3 24

등급이 1~7인 경우, 등급이 같고, 이름도 NULL로 같으면 성적을 오름차순 정렬해야 하라는 조건이 있어서
S.marks를 정렬할 때 꼭 추가해줘야 하는데 문제의 테스트 케이스는 7 등급일 때 이미 성적이 64, 66으로 오름차순 정렬돼있어서 그냥 통과 되는듯 하다.
*/

SELECT IF(G.grade < 8, NULL, S.name), G.grade, S.marks
FROM students S
JOIN grades G
ON S.marks BETWEEN G.min_mark and g.max_mark
ORDER BY G.grade DESC, S.name, S.marks
