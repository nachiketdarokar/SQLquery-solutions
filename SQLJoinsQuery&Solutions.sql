use joins;
select * from album;
select * from song;
select * from record_label;
select * from artist;

---Q1 List all artists for each record label sorted by artist name
select ar.name as 'artist name',r.name as 'record label name'
from artist ar
join record_label r on ar.record_label_id=r.id
group by ar.name,r.name;

---Q2.Which record labels have no artists?
select r.name as 'record name'
from record_label r
where r.name not in 
(SELECT distinct r.name
FROM record_label r
right join artist a on a.record_label_id=r.id);

---Q3. List the number of songs per artist in descending order
select ar.name,count(s.id) as 'no. of songs'
from artist ar
join album al on ar.id=al.artist_id
join song s on s.album_id=al.id
group by ar.name
order by [no. of songs] desc;

---Q4. Which artist or artists have recorded the most number of songs?
select top (1) ar.name,count(s.id) as 'no. of songs'
from artist ar
join album al on ar.id=al.artist_id
join song s on s.album_id=al.id
group by ar.name
order by [no. of songs] desc;

---Q5.Which artist or artists have recorded the least number of songs?
select top (5) ar.name,count(s.id) as 'no. of songs'
from artist ar
join album al on ar.id=al.artist_id
join song s on s.album_id=al.id
group by ar.name
order by count(s.id);

---Q6.which artists have recorded songs longer than 5 minutes, and how many songs was that?
select ar.name,count(s.id) as 'no. of songs'
from song s
left join album al on s.album_id=al.id
left join artist ar on al.artist_id=ar.id
where s.duration>5.00
group by ar.name;

---Q7.for each artist and album how many songs were less than 5 minutes long?
select ar.name,al.name,count(s.id) as 'no. of songs'
from song s
left join album al on s.album_id=al.id
left join artist ar on al.artist_id=ar.id
where s.duration<5.00
group by ar.name,al.name;

---Q8.In which year or years were the most songs recorded?
select top(1) al.year,count(s.id) as 'no. of songs'
from album al
left join song s on al.id=s.album_id
group by al.year
order by [no. of songs] desc;

---Q9. list the artist, song and year of the top 5 longest recorded songs
select top(5) ar.name as 'artist',al.name as 'album',s.name as 'song',al.year,s.duration
from song s
left join album al on s.album_id=al.id
left join artist ar on al.artist_id=ar.id
order by s.duration desc; 

---Q10.Number of albums recorded for each year
select year,count(id) as 'no. of albums'
from album 
group by year;

---Q11.What is the max number of recorded albums across all the years?
select count(id) as 'max no. of albums'
from album 
group by year
having count(id)=(select max(alb) from (select year,count(id) as 'alb'
from album group by year)as temp);

---Q12. In which year (or years) were the most (max) number of albums recorded, and how many were recorded?
select year,count(id) as 'max no. of albums'
from album 
group by year
having count(id)=(select max(alb) from (select year,count(id) as 'alb'
from album group by year)as temp);

---Q13.total duration of all songs recorded by each artist in descending order
select ar.name as 'artist name',sum(s.duration) as 'total duration of songs'
from song s
left join album al on s.album_id=al.id
left join artist ar on al.artist_id=ar.id
group by ar.name
order by [total duration of songs]desc;

---Q14.for which artist and album are there no songs less than 5 minutes long?
select ar.name as 'artist name',al.name as 'album name'
from album al
join song s on s.album_id=al.id
join artist ar on al.artist_id=ar.id
group by ar.name,al.name
having min(s.duration)>=5.00;

---Q15. Display a table of all artists, albums, songs and song duration -- all ordered in ascending order by artist, album and song
select ar.name as 'artist',al.name as 'album',s.name as 'song',s.duration
from song s
left join album al on s.album_id=al.id
left join artist ar on al.artist_id=ar.id
order by ar.name,al.name,s.name; 

---Q16. Total album length for all songs on the Greatest hits album - in minutes and seconds
select al.name as 'album name',
cast(sum(s.duration)as int) as 'minute',
round((sum(s.duration)-cast(sum(s.duration) as int)),2)*60
as 'seconds'
from album al
join song s on al.id=s.album_id
where al.name='Greatest Hits'
group by al.name;

---Q17. Which artists did not release an album during the decades of the 1980's and the 1990's?
select distinct ar.name,al.year
from artist ar
left join album al on al.artist_id=ar.id and al.year>=1980 and al.year<2000
where al.year is null;

---Q18.Which artists did release an album during the decades of the 1980's and the 1990's?
select distinct ar.name,al.year
from artist ar
left join album al on al.artist_id=ar.id and al.year>=1980 and al.year<2000
where al.year is NOT null;

---Q19.Make a list of artist name starting with 'A'.
select name from  artist
where name like 'A%';



















