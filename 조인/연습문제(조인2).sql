-- JOIN 연습문제
-- sakila 데이터베이스에서 조회하세요.

-- 문제 1: 고객(customer)의 이름과 그들이 대여(rental)한 영화(film)의 제목을 조회하세요.
-- 사용 테이블: customer(customer_id, first_name, last_name), rental(rental_id, customer_id, inventory_id), film(film_id, title), inventory(inventory_id, film_id)
select concat(first_name, " ", last_name) as fullname, title 
from customer c join rental r on c.customer_id = r.customer_id 
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id;


-- 문제 2: 각 영화(film)의 제목과 해당 영화가 속한 카테고리(category)의 이름을 조회하세요.
-- 사용 테이블: film(film_id, title), film_category(film_id, category_id), category(category_id, name)
SELECT f.title, c.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;


-- 문제 3: 각 영화(film)에 대해 몇 명의 배우(actor)가 출연했는지, 영화 제목과 함께 조회하세요.
-- 사용 테이블: film(film_id, title), film_actor(film_id, actor_id), actor(actor_id, first_name, last_name)
SELECT f.title, COUNT(a.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id;


-- 문제 4: 모든 대여(rental) 정보에 대해, 해당 대여가 이루어진 스토어(store)의 ID와 직원(staff)의 이름을 조회하세요.
-- 사용 테이블: rental(rental_id, staff_id), store(store_id), staff(staff_id, first_name, last_name, store_id)
SELECT r.rental_id, s.store_id, CONCAT(st.first_name, ' ', st.last_name) AS staff_name
FROM rental r
JOIN staff st ON r.staff_id = st.staff_id
JOIN store s ON st.store_id = s.store_id;


-- 문제 5: 가장 많이 대여된 영화 5개의 제목과 대여 횟수를 조회하세요.
-- 사용 테이블: film(film_id, title), inventory(inventory_id, film_id), rental(rental_id, inventory_id)
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;


-- 문제 6: 각 고객(customer)별로 그들이 지불한 총 금액(payment)을 조회하세요.
-- 사용 테이블: customer(customer_id, first_name, last_name), payment(payment_id, customer_id, amount)
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;



-- 문제 7: 각 카테고리(category)별로 대여된 영화의 총 수를 조회하세요.
-- 사용 테이블: category(category_id, name), film_category(film_id, category_id), inventory(inventory_id, film_id), rental(rental_id, inventory_id)
SELECT cat.name, COUNT(rent.rental_id) AS total_rentals
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory inv ON f.film_id = inv.film_id
JOIN rental rent ON inv.inventory_id = rent.inventory_id
GROUP BY cat.category_id;

-- 문제 8: 2005년 7월에 대여된 모든 영화의 제목과 대여 날짜를 조회하세요.
-- 사용 테이블: rental(rental_id, rental_date, inventory_id), inventory(inventory_id, film_id), film(film_id, title)
SELECT f.title, r.rental_date
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE YEAR(r.rental_date) = 2005 AND MONTH(r.rental_date) = 7;


-- 문제 9: 'Comedy' 카테고리에 속하는 영화들의 평균 대여 기간(rental_duration)을 조회하세요.
-- 사용 테이블: category(category_id, name), film_category(film_id, category_id), film(film_id, title, rental_duration)
SELECT AVG(f.rental_duration) AS average_rental_duration
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy';

-- 문제 10: 모든 배우(actor)의 이름과 그들이 출연한 영화(film)의 수를 조회하세요. (LEFT JOIN 사용)
-- 사용 테이블: actor(actor_id, first_name, last_name), film_actor(actor_id, film_id), film(film_id)
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;
