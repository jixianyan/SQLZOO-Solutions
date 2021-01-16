1.
列出1962年首影的電影， [顯示 id, title]

```sql
SELECT id,title
  FROM movie
 WHERE yr = 1962
```

2.
電影大國民 'Citizen Kane' 的首影年份。

```sql
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane'
```

3.
列出全部Star Trek星空奇遇記系列的電影，包括id, title 和 yr(此系統電影都以Star Trek為電影名稱的開首)。按年份順序排列。

```sql
SELECT id,title,yr
  FROM movie
 WHERE title LIKE 'Star Trek%'
 ORDER BY yr
```

4.
id是 11768, 11955, 21191 的電影是什麼名稱?

```sql
SELECT title
  FROM movie
 WHERE id IN (11768,11955,21191)
```

5.
女演員'Glenn Close'的編號 id是什麼?

```sql
SELECT id
  FROM actor
 WHERE name = 'Glenn Close'
```

6.
電影北非諜影'Casablanca' 的編號 id是什麼?

```sql
SELECT id
  FROM movie
 WHERE title = 'Casablanca'
```
7.
列出電影北非諜影 'Casablanca'的演員名單。

什麼是演員名單?
演員名單,即是電影中各演員的真實姓名清單。

使用 movieid=11768, 這是你上一題得到的結果。

```sql
SELECT actor.name
  FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE movieid = 11768
```

8.
顯示電影異型'Alien' 的演員清單。

```sql
SELECT actor.name
  FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')
```

9.
列出演員夏里遜福 'Harrison Ford' 曾演出的電影。

```sql
SELECT movie.title
  FROM movie JOIN casting ON movie.id = casting.movieid
 WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') 
```

10.
列出演員夏里遜福 'Harrison Ford' 曾演出的電影，但他不是第1主角。

```sql
SELECT movie.title
  FROM movie JOIN casting ON movie.id = casting.movieid
 WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') 
   AND casting.ord <> 1
```

11.
列出1962年首影的電影及它的第1主角。

```sql
SELECT movie.title,actor.name
  FROM movie JOIN casting ON movie.id = casting.movieid 
             JOIN actor ON actor.id = casting.actorid
 WHERE movie.yr = 1962 AND casting.ord = 1
```

12.
尊·特拉華達'John Travolta'最忙是哪一年? 顯示年份和該年的電影數目。

```sql
SELECT yr,COUNT(title)
  FROM movie JOIN casting ON movie.id = movieid 
             JOIN actor ON actorid = actor.id
 WHERE name = 'John Travolta'
GROUP BY yr
HAVING COUNT(title) = (SELECT MAX(c) 
                         FROM (SELECT yr,COUNT(title) AS c       
                                 FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id
                                WHERE name='John Travolta'
                               GROUP BY yr) AS t
                      )
```

13.
列出演員茱莉·安德絲'Julie Andrews'曾參與的電影名稱及其第1主角。

```sql
SELECT title,name
  FROM movie JOIN casting ON movie.id = movieid 
             JOIN actor ON actorid = actor.id
 WHERE ord = 1
   AND movie.id IN (SELECT movie.id 
                      FROM movie JOIN casting ON movie.id = movieid 
                                 JOIN actor ON actorid = actor.id
                     WHERE name = 'Julie Andrews')
```

14.
列出按字母順序，列出哪一演員曾作30次第1主角。

```sql
SELECT name
  FROM casting JOIN actor ON actorid = actor.id
 WHERE ord = 1
GROUP BY name
HAVING COUNT(movieid) >= 30
```

15.
列出1978年首影的電影名稱及角色數目，按此數目由多至少排列。

```sql
SELECT title, COUNT(actorid) AS count
FROM movie JOIN casting on id=movieid
 WHERE yr = 1978
GROUP BY title
ORDER BY count DESC
```

这题已发现三处会影响提交的结果：
	1. FROM前不可以有空格
	2. id=movieid等号两旁不可以有空格
	3. COUNT(actorid)后必须AS...

16.
列出曾與演員亞特·葛芬柯'Art Garfunkel'合作過的演員姓名。

```sql
SELECT name
  FROM actor JOIN casting ON actor.id = actorid
 WHERE movieid IN (SELECT movieid
                     FROM casting JOIN actor ON actor.id = actorid
                    WHERE name = 'Art Garfunkel')
   AND name != 'Art Garfunkel'
```
