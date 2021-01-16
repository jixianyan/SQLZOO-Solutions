1. 
這個例子顯示’France法國’的人口。字串應該在'單引號'中。
**修改此例子,以顯示德國 Germany 的人口。**

```sql
SELECT population FROM world
 WHERE name = 'Germany'
```
2.
查詢顯示面積為 5,000,000 以上平方公里的國家,該國家的人口密度(population/area)。人口密度並不是 WORLD 表格中的欄,但我們可用公式(population/area)計算出來。
**修改此例子,查詢面積為 5,000,000 以上平方公里的國家,對每個國家顯示她的名字和人均國內生產總值(gdp/population)。** 

```sql
SELECT name, gdp/population 
  FROM world
 WHERE area > 5000000
```
3.
檢查列表:單詞“IN”可以讓我們檢查一個項目是否在列表中。
此示例顯示了“Luxembourg 盧森堡”,“Mauritius 毛里求斯”和“Samoa 薩摩亞”的國家名稱和人口。
**顯示“Ireland 愛爾蘭”,“Iceland 冰島”,“Denmark 丹麥”的國家名稱和人口。**

```sql
SELECT name, population 
  FROM world
 WHERE name IN ('Ireland', 'Iceland', 'Denmark');
```
4.
哪些國家是不是太小,又不是太大?
BETWEEN 允許範圍檢查 - 注意,這是包含性的。 此例子顯示面積為 250,000 及 300,000 之間的國家名稱和該國面積。
**修改此例子,以顯示面積為 200,000 及 250,000 之間的國家名稱和該國面積。**

```sql
SELECT name, area 
  FROM world
 WHERE area BETWEEN 200000 AND 250000
```
