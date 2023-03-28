--Micro desafio ( 1 )

select movies_db.series.title  as "Series" , movies_db.genres.name as "Nombres"
from movies_db.series 
inner join movies_db.genres on movies_db.genres.id  = movies_db.series.id ; 

select movies_db.episodes.title, concat(movies_db.actors.first_name, " " ,movies_db.actors.last_name) 
from actor_episode
inner join movies_db.actors on movies_db.actor_episode.id  = movies_db.actors.id
inner join movies_db.episodes on movies_db.actor_episode.id  = movies_db.episodes.id; 

--Micro desafio ( 2 )

select distinct concat(movies_db.actors.first_name, " " ,movies_db.actors.last_name) as "Nombre y Apellido", movies_db.movies.title as "Pelicula"
from movies_db.actor_movie 
inner join movies_db.actors on movies_db.actor_movie.id = movies_db.actors.id
inner join movies_db.movies on movies_db.actor_movie.movie_id = movies_db.movies.id 
where movies_db.movies.title like "%La Guerra de las galaxias%"
; 

select * from movies_db.movies
where movies_db.movies.title like "%La Guerra de las galaxias%";


--Micro desafio ( 3 )

select movies_db.movies.title, coalesce(movies_db.genres.name, "No tiene genero") as "Generos" 
from movies_db.movies 
left join movies_db.genres on movies_db.movies.genre_id  = movies_db.genres.id
order by movies_db.movies.genre_id  ;


--Micro desafio ( 4 )

select movies_db.series.title, datediff(movies_db.series.end_date, movies_db.series.release_date)
from movies_db.series;

select movies_db.series.title, movies_db.series.end_date, movies_db.series.release_date
from movies_db.series;

--Micro desafio ( 5 )

Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 caracteres.

select  concat(movies_db.actors.first_name, " " ,movies_db.actors.last_name) as "Nombre y apellido"
from movies_db.actors
where length(movies_db.actors.first_name) > 6
order by movies_db.actors.last_name 
;

Debemos mostrar la cantidad total de los episodios guardados en la base de datos.

select count(movies_db.episodes.id) from movies_db.episodes;

Obtengamos el título de todas las series y el total
de temporadas que tiene cada una de ellas. 

select movies_db.series.title as "TITULO", count(movies_db.seasons.serie_id) as "TOTAL DE TEMPORADA"
from movies_db.series
inner join movies_db.seasons on movies_db.series.id = movies_db.seasons.serie_id 
group by movies_db.series.title;

Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor
o igual a 3.


select distinct  movies_db.genres.name  as "GENERO", count(movies_db.movies.id) as  "CANTIDADdePeliculas"
from movies_db.genres
inner join movies_db.movies on movies_db.genres.id = movies_db.movies.genre_id 
group by movies_db.genres.name
having count(movies_db.movies.id) >= 3 
;


select movies_db.movies.title, movies_db.genres.name 
from movies_db.movies
inner join movies_db.genres on movies_db.movies.genre_id = movies_db.genres.id 
;