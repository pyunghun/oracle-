-- EMPLOYEE 테이블에서 EMP_ID, EMP_NAME, EMAIL 정보를 찾아라
SELECT
       EMP_ID
     , EMP_NAME
     , EMAIL
  FROM EMPLOYEE;  

-- EMPLOYEE 테이블에서 *(ALL) 정보를 찾아라
SELECT
       *
  FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 사번 이름 조회
SELECT
       EMP_ID
     , EMP_NAME
  FROM EMPLOYEE;
  
-- 원하는 행 조회
-- WHERE 절을 이용하여 원하는 행을 조회한다.
-- EMPLOYEE 테이블에서 DEPT_CODE가 D9인 사람의 *(ALL) 정보를 조회하라
SELECT
       *
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D9'; 

-- EMPLOYEE 테이블에서 직급코드가 J1인 사원을 조회
SELECT
       *
  FROM EMPLOYEE
 WHERE JOB_CODE = 'J1'; 

-- 원하는 행과 컬럼을 조회
-- EMPLOYEE 테이블에서 급여가 300만원 이상인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하세요
-- WHERE문은 조건을 의미한다.

SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY >= 3000000; 

-- 컬럼에 별칭 짓기
-- 컬럼명에 산술연산을 처리할 수 있다.
SELECT
       EMP_NAME 이름
     , SALARY * 12 "1년급여"
     , (SALARY + (SALARY * NVL(BONUS,0))) * 12 "보너스포함연봉"
  FROM EMPLOYEE;   

-- 임의로 지정한 문자열을 SELECT 절에서 사용
SELECT
       EMP_ID
     , EMP_NAME
     , SALARY
     , '원' 단위
  FROM EMPLOYEE;

-- 중복을 제외 DISTINCT
SELECT
       DISTINCT(JOB_CODE)
  FROM EMPLOYEE;     

-- DISTINCT 는 1번만 사용 가능하다.
-- 2개의 값 OR 그 이상의 값을 묶고나서 중복을 판단한다.
SELECT
       DISTINCT(JOB_CODE)
     , /*DISTINCT*/(DEPT_CODE)
  FROM EMPLOYEE;   

-- WHERE 절
-- 테이블에서 조건을 만족하는 행을 골라낼 때 사용
-- 조건이 다중인 경우 AND 혹은 OR를 사용할 수 있다.

-- 부서코드가 D6이고 급여를 200만원 보다 많이 받는 직원의
-- 이름, 부서코드, 급여를 조회하라
SELECT
       EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D6'
   AND SALARY > 2000000;


-- 보너스를 지급받지 않는 사원의
-- 사번, 이름, 급여, 보너스를 조회하세요
-- NULL 값은 값을 가지지 않는다는 의미 이므로 = NULL 형식이 불가능 
SELECT
       EMP_ID
     , EMP_NAME
     , SALARY
     , BONUS
  FROM EMPLOYEE
 WHERE BONUS IS NOT NULL; 
 
-- 연결 연산자를 이용하여 여러 컬럼의 값을 하나의 컬럼의 값인 것 처럼 연결
SELECT
       EMP_ID || EMP_NAME || SALARY
  FROM EMPLOYEE;     

SELECT
       EMP_NAME || '의 월급은' || SALARY || '원 입니다'
  FROM EMPLOYEE;

-- 비교연산자 
-- = 같냐? , > 크냐? , < 작냐?, >= 크거나 같냐? , <= 작거나 같냐?
-- !=, ^=, <> 같지 않냐?
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
  FROM EMPLOYEE
 WHERE DEPT_CODE <> 'D9'; 
 
-- EMPLOYEE 테이블에서 퇴사여부가 N인 직원(퇴사하지 않은 직원)을 조회하고
-- 근무여부를 별칭으로 하여 재직중 이라는 문자열을 결과집합에 포함하여 조회
-- 사번, 이름, 입사일, 근무여부 를 조회하세요
SELECT
       EMP_ID
     , EMP_NAME
     , HIRE_DATE
     , '재직중' 근무여부
  FROM EMPLOYEE
 WHERE ENT_YN = 'N';
 
-- EMPLOYEE 테이블에서 급여를 350 만원 이상
-- 550 만원 이하를 받는
-- 직원의 사번, 이름, 급여, 부서코드, 직급코드를 조회하세요
-- BETWEEN AND 연산자
-- 컬럼명 BETWEEN 하한값 AND 상한값
-- NOT을 붙여도 된다.
SELECT  
       EMP_ID
     , EMP_NAME
     , SALARY
     , DEPT_CODE
     , JOB_CODE
  FROM EMPLOYEE
 WHERE SALARY BETWEEN 3500000 AND 5500000;
-- WHERE SALARY NOT BETWEEN 3500000 AND 5500000;
-- WHERE SALARY > 5500000
--    OR SALARY < 3500000

-- LIKE 연산자 : 문자 패턴이 일치하는 값을 조회할 때 사용
-- 컬럼명 LIKE '문자패턴'
-- 문자패턴 : '문자%' (문자로 시작하는 값)
--           '%문자%' (문자를 포함하는 값)
--           '%문자' (문자로 끝나는 값)


-- EMPLOYEE  테이블에서 성이 김씨인 직원의
-- 사번, 이름, 입사일 조회
SELECT
       EMP_ID
     , EMP_NAME
     , HIRE_DATE
  FROM EMPLOYEE
 WHERE EMP_NAME LIKE '김%'; 
-- WHERE EMP_NAME NOT LIKE '김%'; 김씨를 제외한 모두를 조회

-- EMPLOYEE 테이블에서 '하'가 이름에 포함된 직원의
-- 이름, 주민번호, 부서코드 조회
SELECT
       EMP_NAME
     , EMP_NO
     , DEPT_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME LIKE '%하%'; 

-- %( 0개 이상의 글자), _(글자 한 자리)

-- EMPLOYEE 테이블에서 전화번호 국번이 9로 시작하는 직원의
-- 사번, 이름, 전화번호를 조회하세요
SELECT
       EMP_ID
     , EMP_NAME
     , PHONE
  FROM EMPLOYEE
 WHERE PHONE LIKE '___9%';

-- EMPLOYEE 테이블에서 전화번호 국번이 4자리 이면서
-- 9로 시작하는 직원의 사번, 이름, 전화번호를 조회
-- 국번이 4자리가 되려면 뒷자리가 7자리이면 충족
SELECT
       EMP_ID
     , EMP_NAME
     , PHONE
  FROM EMPLOYEE
 WHERE PHONE LIKE '___9_______'; 


-- EMPLOYEE 테이블에서 이메일 주소의 _ 앞글자가 3자리인 이메일 주소를 가진
-- 사원의 사번, 이름, 이메일 주소 조회
SELECT
       EMP_ID
     , EMP_NAME
     , EMAIL
  FROM EMPLOYEE
 WHERE EMAIL LIKE '___/_%' ESCAPE '/' ;

-- 부서코드가 'D6'이거나 'D8'인 직원의 
-- 이름, 부서, 급여를 조회하세요
-- IN 연산자 : 비교하려는 값 목록에 일치하는 값이 있는 지 확인
SELECT
       EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE IN ('D6' , 'D8');

-- 연산자 우선순위
/*
1. 산술연산자
2. 연결연산자
3. 비교연산자
4. IS NULL / IS NOT NULL, LIKE / NOT LIKE, IN / NOT IN
5. BETWEEN AND / NOT BETWEEN AND
6. NOT
7. AND
8. OR
*/

-- J7 지급이거나 J2 직급인 직원들 중
-- 급여가 200만원 이상인 직원의
-- 이름, 급여, 직급코드를 조회
SELECT
       EMP_NAME
     , SALARY
     , JOB_CODE
  FROM EMPLOYEE
 WHERE JOB_CODE IN ('J7','J2')
   AND SALARY >= 2000000;















