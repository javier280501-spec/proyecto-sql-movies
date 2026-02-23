2.Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ.
SELECT
	f.title AS"Título",
	f.rating AS "Clasificación"
FROM film f
WHERE
	f.rating = 'R';

3.	Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.
SELECT
	a.actor_id AS "ID del actor",
	a.first_name AS "Nombre"
FROM
	actor a
WHERE
	a.actor_id BETWEEN 30 AND 40;

4.	Obtén las películas cuyo idioma coincide con el idioma original.
SELECT
    f.title,
    f.language_id,
    f.original_language_id
FROM
    film f
WHERE
    f.original_language_id IS NULL
    OR f.language_id = f.original_language_id;

5.	Ordena las películas por duración de forma ascendente.
SELECT
	f.title AS "Título",
	f.length AS "Duración"
FROM
	film f
ORDER BY
	f.length ASC;

6.	Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.
SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	actor a
WHERE
	a.last_name = 'ALLEN';

7.	Encuentra la cantidad total de películas en cada clasificación de la tabla “filmˮ y muestra la clasificación junto con el recuento.
SELECT
	f.rating AS "Clasificación",
	count(*) AS "Total clasificación"
FROM
	film f
group BY
	rating;

8.	Encuentra el título de todas las películas que son ‘PG-13ʼ o tienen una duración mayor a 3 horas en la tabla film.
SELECT
	f.title AS "título",
	f.length AS "duración",
	f.rating AS "Clasificación"
FROM
	film f
WHERE
	f.length > 180
	OR f.rating = 'PG-13';

9.	Encuentra la variabilidad de lo que costaría reemplazar las películas.
SELECT
	avg(f.replacement_cost) AS "Promedio",
	stddev(f.replacement_cost) AS "Desviación",
	variance(f.replacement_cost) AS "Varianza"
FROM
	film f;

10.	Encuentra la mayor y menor duración de una película de nuestra BBDD.
SELECT
	MIN(f.length) AS "Duración mínima",
	MAX(f.length) AS "Duración máxima"
FROM
	film f;

11.	Encuentra lo que costó el antepenúltimo alquiler ordenado por día
SELECT
	p.amount AS "Precio",
	p.payment_date AS "Día de pago"
FROM
	payment p
order BY
	p.payment_date DESC
LIMIT 1 OFFSET 2;

12.	Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC- 17ʼ ni ‘Gʼ en cuanto a su clasificación.
SELECT
	f.rating AS "clasificación",
	f.title AS "Título"
FROM
	film f
WHERE
	f.rating NOT IN ('NC-17', 'G');

13.	Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT
	round(avg(f.length), 2) AS "Duración",
	f.rating AS "Clasificación"
FROM
	film f
GROUP BY
	f.rating;

14.	Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
SELECT
	f.title AS "título",
	f.length AS "Duración"
FROM
	film f
WHERE
	f.length > 180;

15.	¿Cuánto dinero ha generado en total la empresa?
SELECT
	sum(p.amount) AS "Total generado"
FROM
	payment p;

16.	Muestra los 10 clientes con mayor valor de id.
SELECT
	c.customer_id,
	c.first_name AS "Nombre"
FROM
	customer c
ORDER BY
	c.customer_id DESC
LIMIT 10;

17.	Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igbyʼ
SELECT 
	concat(a.first_name , ' ' , a.last_name ) as "Nombre Completo"
FROM
	film f
INNER JOIN film_actor fa ON
	f.film_id = fa.film_id
INNER JOIN actor a ON
	a.actor_id = fa.actor_id
WHERE
	f.title = 'EGG IGBY';

18.	Selecciona todos los nombres de las películas únicos.
SELECT
	distinct(f.title) AS "Título"
FROM
	film f;

19.	Encuentra las categorías de películas que tienen un promedio de duración superior a 110 Encuentra el título de las p
SELECT
    c.name AS "Categoría",
    AVG(f.length) AS "Duración media"
FROM
    film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
GROUP BY
    c.name
HAVING
    AVG(f.length) > 110;

20.	minutos y muestra el nombre de la categoría junto con el promedio de duración.
SELECT
	c.name AS "Nombre",
	ROUND(AVG(f.length), 2) AS "Duración media"
	FROM
	film f
INNER JOIN film_category fc ON
	f.film_id = fc.film_id
INNER JOIN category c ON
	c.category_id = fc.category_id
GROUP BY
	c.name
HAVING
	AVG(f.length) > 110;

21.	¿Cuál es la media de duración del alquiler de las películas
SELECT
	AVG(r.return_date - r.rental_date) AS media_duracion
FROM
	rental r
WHERE
	r.return_date is not NULL;

22.	Crea una columna con el nombre y apellidos de todos los actores y actrices.
SELECT
	concat(a.first_name , ' ', a.last_name) "Nombre y Apellido"
FROM
	actor a 

23.	Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente	
SELECT
    DATE(rental_date) AS "Día de alquiler",
    COUNT(*) AS "Número de alquileres"
FROM
    rental
GROUP BY
    DATE(rental_date)
ORDER BY
    COUNT(*) DESC;

24.	Encuentra las películas con una duración superior al promedio.
SELECT
    f.title,
    f.length
FROM
    film f
WHERE
    f.length > (
        SELECT
            AVG(length)
        FROM
            film
    );

25.	Averigua el número de alquileres registrados por mes
SELECT
	EXTRACT(month from rental_date) AS mes,
	COUNT(*) AS "Número de alquileres"
FROM
	rental r
GROUP BY
	EXTRACT(month from rental_date)
ORDER by
	mes;

26.	Encuentra el promedio, la desviación estándar y varianza del total pagado.
SELECT
	ROUND(avg(p.amount), 2)AS "Media",
	ROUND(stddev(p.amount), 2) AS "Desvicación Estándar",
	ROUND(variance(p.amount), 2) AS "Varianza"
from payment p;

27.	¿Qué películas se alquilan por encima del precio medio?
	SELECT
	f.title AS "título",
	f.replacement_cost AS "Precio"
FROM
	film f
WHERE
	f.replacement_cost > (
	SELECT
		avg (f.replacement_cost)
	FROM
		film f);

28.	Muestra el id de los actores que hayan participado en más de 40 películas.
SELECT
	fa.actor_id AS "Actor id"
FROM
	film_actor fa
GROUP BY
	fa.actor_id
HAVING
	COUNT(fa.film_id) > 40;

29.	Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible
SELECT
	f.title AS "Título",
	count(i.inventory_id) AS "Cantidad en inventario"
FROM
	film f
LEFT JOIN inventory i ON
	f.film_id = i.film_id
GROUP BY
	f.title; 

30.	Obtener los actores y el número de películas en las que ha actuado.
SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS "Número de películas"
FROM
    film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    a.actor_id;

31.	Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados
SELECT
	f.title AS "Título",
	a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	film f
LEFT JOIN film_actor fa on
	f.film_id = fa.film_id
LEFT JOIN actor a on
	a.actor_id = fa.actor_id
ORDER BY
	f.title; 

32.	Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película
SELECT
    a.first_name AS "Nombre",
    a.last_name AS "Apellido",
    f.title AS "Título"
FROM
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON f.film_id = fa.film_id
ORDER BY
    f.title;

33.	Obtener todas las películas que tenemos y todos los registros de alquiler.
SELECT
	f.title AS "Título",
	r.rental_id AS "Alquiler"
FROM
	film f
FULL JOIN inventory i
  ON
	f.film_id = i.film_id
FULL JOIN rental r
  ON
	i.inventory_id = r.inventory_id;

34.	Encuentra los 5 clientes que más dinero se hayan gastado con nosotros
SELECT
    c.customer_id AS "Customer id",
    c.first_name AS "Nombre",
    c.last_name AS "Apellido",
    SUM(p.amount) AS "Total gastado"
FROM
    customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    SUM(p.amount) DESC
LIMIT 5;


35.	Selecciona todos los actores cuyo primer nombre es 'Johnny'
SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	actor a
WHERE
	a.first_name = 'JOHNNY';


36.	Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como Apellido.
SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	actor a; 


37.	Encuentra el ID del actor más bajo y más alto en la tabla actor.
SELECT
	MIN(a.actor_id),
	MAX(a.actor_id)
FROM
	actor a;

38.	Cuenta cuántos actores hay en la tabla “actorˮ.
SELECT
	count(*) AS "Actores en total"
FROM
	actor a; 

39.	Selecciona todos los actores y ordénalos por apellido en orden ascendente.

SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	actor a
ORDER BY
	a.last_name asc;


40.	Selecciona las primeras 5 películas de la tabla “filmˮ.
SELECT
	f.title AS "Título"
FROM
	film f
ORDER BY
	f.title ASC
LIMIT 5

41.	Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?
SELECT
	first_name,
	COUNT(*) AS cantidad
FROM
	actor
GROUP BY
	first_name
ORDER BY
	cantidad DESC;

42.	Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
SELECT
	c.first_name AS "Nombre",
	c.last_name AS "Apellido",
	r.rental_date AS "Día de Alquiler"
FROM
	customer c
INNER JOIN rental r ON
	c.customer_id = r.customer_id;

43.Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres
SELECT
    c.first_name AS "Nombre",
    c.last_name AS "Apellido",
    r.rental_date
FROM
    customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id; 

44.	Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.
select *
FROM
	film f
CROSS JOIN category c; 

no,
	no aporta ningún tipo de valor al modelo de datos. 
las tablas no están relacionadas entre sí necesitan la 
unión de una tabla intermedia como film_category. 
Este cross,
	ignora esa relación,
	crea combinaciones falsas 
y no refleja la realidad del negocio.

45.	Encuentra los actores que han participado en películas de la categoría 'Action'.

SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido",
	c."name" AS "Género"
FROM
	actor a
INNER JOIN film_actor fa ON
	a.actor_id = fa.actor_id
inner  JOIN film ON
	fa.film_id = film.film_id
INNER JOIN film_category fc ON
	fa.film_id = fc.film_id
INNER JOIN category c ON
	c.category_id = fc.category_id
WHERE
	c."name" = 'Action';

46.	Encuentra todos los actores que no han participado en películas
SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	actor a
LEFT JOIN film_actor fa ON
	a.actor_id = fa.actor_id
LEFT JOIN film ON
	fa.film_id = film.film_id
WHERE
	fa.film_id is null;

47.	Selecciona el nombre de los actores y la cantidad de películas en las que han participado
SELECT
	a.first_name AS "Nombre",
	a.last_name AS "Apellido",
	count(fa.film_id) AS "Total de películas"
FROM
	actor a
INNER JOIN film_actor fa ON
	a.actor_id = fa.actor_id
INNER  JOIN film f ON
	f.film_id = fa.film_id
GROUP by
	a.first_name ,
	a.last_name ,
	a.actor_id;

48.	Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres de los actores
y el número de películas en las que han participado.

CREATE VIEW actor_num_peliculas AS
SELECT
    a.first_name AS "Nombre",
    a.last_name AS "Apellido",
    COUNT(f.film_id) AS "Numero_peliculas"
FROM
    film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY
    a.first_name,
    a.last_name;


 49.	Calcula el número total de alquileres realizados por cada cliente.
SELECT
	c.customer_id AS "Id del cliente",
	c.first_name AS "Nombre",
	c.last_name AS "Apellido",
	count (r.rental_id) AS "Número total alquileres"
FROM
	rental r
LEFT JOIN customer c ON
	c.customer_id = r.customer_id
GROUP BY
	c.customer_id,
	c.first_name ,
	c.last_name ;

50.	Calcula la duración total de las películas en la categoría 'Action'.
SELECT
    SUM(f.length) AS "Duración total Action"
FROM
    film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE
    c.name = 'Action';
51.	Crea una tabla temporal llamada “cliente_rentas_temporalˮ
para almacenar el total de alquileres por cliente.

CREATE TEMP TABLE cliente_rentas_temporal AS
SELECT 
    c.customer_id,
    COUNT(r.rental_date) AS total_alquileres
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

52.Crea una tabla temporal llamada “peliculas_alquiladasˮ
que almacene las películas que han sido alquiladas al menos 10 veces.

CREATE TEMP table peliculas_alquiladas AS
SELECT f.title AS "Título",
COUNT(r.rental_id) AS "Total de alquileres"
FROM film f 
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
HAVING count(r.rental_id) >= 10
ORDER BY f.title;



53.	Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto.
Ordena los resultados alfabéticamente por título de película.
SELECT
	DISTINCT f.title AS "Título"
FROM
	film f
INNER JOIN inventory i 
    ON
	f.film_id = i.film_id
INNER JOIN rental r 
    on
	i.inventory_id = r.inventory_id
INNER JOIN customer c 
    ON
	c.customer_id = r.customer_id
WHERE
	c.first_name = 'TAMMY'
	AND c.last_name = 'SANDERS'
	AND r.return_date is null
ORDER BY
	f.title;
 
 54.	Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados
alfabéticamente por apellido.

SELECT
	DISTINCT
    a.first_name AS "Nombre",
	a.last_name AS "Apellido"
FROM
	category c
INNER JOIN film_category fc 
    ON
	c.category_id = fc.category_id
INNER JOIN film f 
    ON
	f.film_id = fc.film_id
INNER JOIN film_actor fa 
    ON
	f.film_id = fa.film_id
INNER JOIN actor a 
    ON
	a.actor_id = fa.actor_id
WHERE
	c."name" = 'Sci-Fi'
ORDER BY
	a.last_name;


55.	Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaperʼ se alquilara por primera vez. Ordena los resultados
alfabéticamente por apellido.

SELECT DISTINCT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date >
(
  SELECT MIN(r2.rental_date)
  FROM film f2
  INNER JOIN inventory i2 ON f2.film_id = i2.film_id
  INNER JOIN rental r2 ON i2.inventory_id = r2.inventory_id
  WHERE f2.title = 'Spartacus Cheaper'
)
ORDER BY a.last_name, a.first_name;


56.	Encuentra el nombre y apellido de los actores
que no han actuado en ninguna película de la categoría ‘Musicʼ.

SELECT a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    INNER JOIN film_category fc ON fa.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Music'
)
ORDER BY a.last_name, a.first_name;


57.	Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.

SELECT title AS "Título"
FROM film
INNER JOIN inventory i ON film.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE (r.return_date - r.rental_date) > INTERVAL '8 days'
ORDER BY title;

58.	Encuentra el título de todas las películas que son de la misma categoría que ‘Animationʼ.

SELECT DISTINCT f.title
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Animation'
ORDER BY f.title;

59.	Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Feverʼ. Ordena los resultados
alfabéticamente por título de película.
SELECT f.title
FROM film f
WHERE f.length = (
    SELECT f2.length
    FROM film f2
    WHERE f2.title = 'Dancing Fever'
)
ORDER BY f.title;

60.	Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. 
Ordena los resultados alfabéticamente por apellido.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT i.film_id) AS total_peliculas
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.film_id) >= 7
ORDER BY c.last_name, c.first_name;


61.	Encuentra la cantidad total de películas alquiladas por categoría y
muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT 
    c.name AS categoria,
    COUNT(r.rental_id) AS total_alquileres
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN inventory i ON fc.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY c.name;

62.	Encuentra el número de películas por categoría estrenadas en 2006.
SELECT 
    c.name AS categoria,
    COUNT(f.film_id) AS total_peliculas
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
WHERE f.release_year = 2006
GROUP BY c.name
ORDER BY c.name;


63.	Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.
SELECT 
    s.staff_id,
    s.first_name,
    s.last_name,
    st.store_id
FROM staff s
CROSS JOIN store st
ORDER BY s.staff_id, st.store_id;


64.	Encuentra la cantidad total de películas alquiladas por cada cliente
y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT
	c.customer_id AS "Id del cliente",
	c.first_name AS "Nombre",
	c.last_name AS "Apellido",
	COUNT(r.rental_date) AS "Cantidad total pelis alquiladas"
FROM
	customer c
INNER JOIN rental r ON
	c.customer_id = r.customer_id
GROUP BY
	c.customer_id ,
	c.first_name ,
	c.last_name ;
