1.
展示世界的總人口。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200305170100544.png)

```sql
SELECT SUM(population)
FROM world
```
2.
列出所有的洲份, 每個只有一次。

```sql
SELECT DISTINCT continent
  FROM world 
```
3.
找出非洲(Africa)的GDP總和。

```sql
SELECT SUM(GDP)
  FROM world
 WHERE continent='Africa'
```
4.
有多少個國家具有至少百萬(1000000)的面積。 

```sql
SELECT COUNT(name)
  FROM world
 WHERE area >= 1000000
```
5.
('France','Germany','Spain')（“法國”，“德國”，“西班牙”）的總人口是多少？

```sql
SELECT SUM(population)
  FROM world
 WHERE name IN('France','Germany','Spain')
```
6.
對於每一個洲份，顯示洲份和國家的數量。

```sql
SELECT continent,COUNT(name)
  FROM world
GROUP BY continent
```
7.
對於每一個洲份，顯示洲份和至少有1000萬人(10,000,000)口國家的數目。

```sql
SELECT continent,COUNT(name)
  FROM world
 WHERE population>=10000000
 GROUP BY continent
```
8.
列出有至少100百萬(1億)(100,000,000)人口的洲份。

```sql
SELECT continent
  FROM world
 GROUP BY continent
HAVING SUM(population)>=100000000
```
