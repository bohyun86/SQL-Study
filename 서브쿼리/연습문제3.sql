-- 서브쿼리 문제
-- sakila 데이터베이스 사용
use sakila;
desc payment;

-- 문제1. 총 결제 금액이 $100을 초과하는 모든 고객의 이름과 성을 조회하세요.
-- 사용 테이블: customer (customer_id, first_name, last_name), payment (payment_id, customer_id, amount)
select first_name, last_name from customer c
where c.customer_id in (select customer_id from payment group by customer_id having sum(amount) > 100);

-- 문제2. 5개 이상의 영화를 대여한 모든 고객의 이름과 성을 조회하세요.
-- 사용 테이블: customer (customer_id, first_name, last_name), rental (rental_id, customer_id)
select first_name, last_name from customer c
where customer_id in (select customer_id from rental group by customer_id having count(rental_id) >= 5);

-- 문제3. 5편 이상의 영화에 출연한 모든 배우의 이름과 성을 조회하세요.
-- 사용 테이블: actor (actor_id, first_name, last_name), film_actor (actor_id, film_id)
SELECT first_name, last_name 
FROM actor 
WHERE actor_id IN (
    SELECT actor_id 
    FROM film_actor 
    GROUP BY actor_id 
    HAVING COUNT(film_id) >= 5
);


-- 문제4. 평균 영화 길이보다 긴 모든 영화의 제목을 조회하세요.
-- 사용 테이블: film (film_id, title, length)
SELECT title 
FROM film 
WHERE length > (
    SELECT AVG(length) 
    FROM film
);


-- 문제5. 평균 대여 비용보다 높은 대여 비용을 가진 모든 영화의 제목과 대여 비용을 조회하세요.
-- 사용 테이블: film (film_id, title, rental_rate)
SELECT title, rental_rate 
FROM film 
WHERE rental_rate > (
    SELECT AVG(rental_rate) 
    FROM film
);


-- 문제6. 각 영화에 출연한 배우의 수와 함께 영화 제목을 조회하세요. (SELECT절 사용)
-- 사용 테이블: film (film_id, title), film_actor (actor_id, film_id)
SELECT 
  f.title, 
  (
    SELECT COUNT(*) 
    FROM film_actor fa 
    WHERE fa.film_id = f.film_id
  ) AS actor_count 
FROM film f;



-- 문제7. 단일 고객이 가장 많이 대여한 영화 수를 조회하세요. (FROM절 사용)
-- 사용 테이블: rental (rental_id, customer_id)
SELECT MAX(rental_count) 
FROM (
    SELECT customer_id, COUNT(rental_id) AS rental_count 
    FROM rental 
    GROUP BY customer_id
) AS rental_counts;
