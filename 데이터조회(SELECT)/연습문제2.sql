-- world 데이터베이스에서 문제를 풀어보세요(select문)
use world;

-- 문제 1: Country 테이블에서 모든 국가의 이름(Name)과 대륙(Continent)을 조회하세요.
select name, continent from country;

-- 문제 2: City 테이블에서 도시 이름(Name)이 'Seoul', 'Tokyo', 'New York'인 도시의 모든 정보를 조회하세요.
select * from city
where name in ('seoul', 'tokyo', 'new york');

-- 문제 3: Country 테이블에서 인구(Population)가 100000000 이상인 국가의 이름(Name), 대륙(Continent), 인구(Population)를 조회하세요.
select name, continent, population from country
where population >= 100000000;

-- 문제 4: Country 테이블에서 국가의 독립 연도(IndepYear)가 1900년 이후인 국가의 이름(Name)과 독립 연도(IndepYear)를 조회하세요.
select name, indepyear from country
where indepyear >= 1900;

-- 문제 5: CountryLanguage 테이블에서 'French'를 공식 언어(Official Language)로 사용하는 국가의 국가 코드(CountryCode)와 언어(Language)를 조회하세요. 공식 언어 여부는 'IsOfficial' 열을 참조하세요.
select countrycode, language from countrylanguage
where isoffical = 'french';

-- 문제 6: Country 테이블에서 'Europe' 대륙에 속하며 인구가 50000000 이상인 국가의 이름(Name)과 인구(Population)를 조회하세요.
select name, population from country
where population >= 50000000;

-- 문제 7: City 테이블에서 인구(Population)가 8000000 이상인 도시의 이름(Name), 국가 코드(CountryCode), 인구(Population)를 조회하세요.
select name, countrycode, population from city
where population >= 8000000;

-- 문제 8: CountryLanguage 테이블에서 'English'를 공식 언어로 사용하지 않는 국가의 국가 코드(CountryCode)와 언어(Language)를 조회하세요. 단, 언어 사용 비율(Percentage)이 50% 이상인 경우만 포함하세요.
select coutrycode, language from countrylanguage
where isofficial not in ('english') and percentage >= 50;

-- 문제 9: Country 테이블에서 GNP가 200000 이상이며 생명 기대치(LifeExpectancy)가 75 이상인 국가의 이름(Name), GNP, 생명 기대치(LifeExpectancy)를 조회하세요.
select name, gnp, lifeexpectancy from country
where gnp >= 200000 and lifeexpectancy >= 75;

-- 문제 10: Country 테이블에서 정부 형태(GovernmentForm)가 'Republic'을 포함하며, 독립 연도(IndepYear)가 1900년 이전인 국가의 이름(Name)과 정부 형태(GovernmentForm), 독립 연도(IndepYear)를 조회하세요.
select name, governmentfrom, IndepYear from country
where governmentform like '%republic%' and indepyear > 1900;

-- 문제 11: Country 테이블에서 'Asia', 'Africa', 'Europe' 대륙에 속하는 국가의 이름(Name), 대륙(Continent), 인구(Population)를 조회하세요.
select name, continent, population from country
where continent in ('asia', 'africa', 'europe');

-- 문제 12: City 테이블에서 도시 이름(Name)이 'S'로 시작하고, 인구(Population)가 1000000 이상인 도시의 이름(Name), 국가 코드(CountryCode), 인구(Population)를 조회하세요.
select name, countrycode, population from city
where name like 'S%' and population >= 1000000;
