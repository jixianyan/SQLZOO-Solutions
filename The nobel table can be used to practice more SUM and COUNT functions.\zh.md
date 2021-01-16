1.
找出總共有多少個獎頒發了。 

```sql
SELECT COUNT(winner) FROM nobel
```
2.
列出每一個獎項(subject), 只列一次

```sql
SELECT DISTINCT subject
  FROM nobel
```
3.
找出物理獎的總頒發次數。

```sql
SELECT COUNT(winner)
  FROM nobel
 WHERE subject='physics'
```
4.
對每一個獎項(Subject),列出頒發數目。

```sql
SELECT subject,COUNT(winner)
  FROM nobel
 GROUP BY subject
```
5.
對每一個獎項(Subject),列出首次頒發的年份。

```sql
SELECT subject,MIN(yr)
  FROM nobel
 GROUP BY subject
```
6.
對每一個獎項(Subject),列出2000年頒發的數目。 

```sql
SELECT subject,COUNT(winner)
  FROM nobel
 WHERE yr=2000
 GROUP BY subject
```
7.
對每一個獎項(Subject),列出有多少個不同的得獎者。

```sql
SELECT subject,COUNT(DISTINCT winner)
  FROM nobel
 GROUP BY subject
```
8.
對每一個獎項(Subject),列出有多少年曾頒發過。

```sql
SELECT subject,COUNT(DISTINCT yr)
  FROM nobel
 GROUP BY subject
```
9.
列出哪年曾同年有3個物理獎Physics得獎者。

```sql
SELECT yr
  FROM nobel
 WHERE subject='physics'
 GROUP BY yr
HAVING COUNT(winner)=3
```
10.
列出誰得獎多於一次。

```sql
SELECT winner
  FROM nobel
 GROUP BY winner
HAVING COUNT(winner)>1
```
11.
列出誰獲得多於一個獎項(Subject) 

```sql
SELECT winner
  FROM nobel
 GROUP BY winner
HAVING COUNT(DISTINCT subject)>1
```
12.
哪年哪獎項，是同一獎項(subject)頒發給3個人。只列出2000年及之後的資料。

```sql
SELECT yr,subject
  FROM nobel
 WHERE yr>=2000
 GROUP BY yr,subject
HAVING COUNT(DISTINCT winner)=3
```
