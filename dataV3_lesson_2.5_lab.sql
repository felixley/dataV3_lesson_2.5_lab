
-- Select all the actors with the first name ‘Scarlett’.
select * 
from sakila.actor
where first_name = 'Scarlett';

-- How many films (movies) are available for rent and how many films have been rented?
select count(film_id) as films_available from sakila.film; -- films available
select count(rental_id) as films_rented from sakila.rental; -- 16044 films rented


-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration,  max(length) as max_duration from sakila.film; -- min: 46min max:185min

-- What's the average movie duration expressed in format (hours, minutes)?
select round(avg(length), 2) from sakila.film; -- 15.27min

-- How many distinct (different) actors' last names are there?
select count(distinct last_name) from sakila.actor; -- 121 actors

-- Since how many days has the company been operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from sakila.rental; -- 266 days

-- Show rental info with additional columns month and weekday. Get 20 results.
select *, date_format(rental_date, '%M') as 'month', date_format(rental_date, '%a') as 'weekday' from sakila.rental limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case 
	when date_format(rental_date, '%a') in ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') then 'workday'
    when date_format(rental_date, '%a') in ('Sat', 'Sun') then 'weekend'
    
end as day_type
from sakila.rental;

-- How many rentals were in the last month of activity?
select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date)) -- checking dates
from sakila.rental;

select count(rental_id) from sakila.rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14"); -- 182 rentals last month
