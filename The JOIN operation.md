1.
第一個例子列出球員姓氏為'Bender'的入球數據。 * 表示列出表格的全部欄位，簡化了寫matchid, teamid, player, gtime語句。

修改此SQL以列出 賽事編號matchid 和球員名 player ,該球員代表德國隊Germany入球的。要找出德國隊球員，要檢查: teamid = 'GER'

```sql
SELECT matchid,player FROM goal 
 WHERE teamid = 'GER'
```
2.
由以上查詢，你可見Lars Bender's 於賽事 1012入球。.現在我們想知道此賽事的對賽隊伍是哪一隊。

留意在 goal 表格中的欄位 matchid ，是對應表格game的欄位id。我們可以在表格 game中找出賽事1012的資料。

只顯示賽事1012的 id, stadium, team1, team2

```sql
SELECT id,stadium,team1,team2
  FROM game
 WHERE id = '1012'
```
3.
我們可以利用JOIN來同時進行以上兩個步驟。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200512152724647.png)

語句FROM 表示合拼兩個表格game 和 goal的數據。語句 ON 表示如何找出 game中每一列應該配對goal中的哪一列 -- goal的 id 必須配對game的 matchid 。 簡單來說，就是
ON (game.id=goal.matchid)

以下SQL列出每個入球的球員(來自goal表格)和場館名(來自game表格)

修改它來顯示每一個德國入球的球員名，隊伍名，場館和日期。

```sql
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER'
```
4.
使用上題相同的 JOIN語句，

列出球員名字叫Mario (player LIKE 'Mario%')有入球的 隊伍1 team1, 隊伍2 team2 和 球員名 player

```sql
SELECT team1,team2,player
  FROM game JOIN goal ON(id=matchid)
 WHERE player LIKE 'Mario%'
```
5.
格eteam 貯存了每一國家隊的資料，包括教練。你可以使用語句 goal JOIN eteam on teamid=id來合拼 JOIN 表格goal 到 表格eteam。

列出每場球賽中首10分鐘gtime<=10有入球的球員 player, 隊伍teamid, 教練coach, 入球時間gtime

```sql
SELECT player,teamid,coach,gtime
  FROM goal JOIN eteam ON(teamid=id)
 WHERE gtime<=10
```
6.
要合拼JOIN 表格game 和表格 eteam，你可以使用
game JOIN eteam ON (team1=eteam.id)
或
game JOIN eteam ON (team2=eteam.id)
注意欄位id同時是表格game 和表格 eteam的欄位，你要清楚指出eteam.id而不是只用id

列出'Fernando Santos'作為隊伍1 team1 的教練的賽事日期，和隊伍名。

```sql
SELECT mdate,teamname
  FROM game JOIN eteam ON(team1=eteam.id)
 WHERE coach = 'Fernando Santos'
```
7.
列出場館 'National Stadium, Warsaw'的入球球員。

```sql
SELECT player
  FROM game JOIN goal ON(id=matchid)
 WHERE stadium = 'National Stadium, Warsaw'
```
8.
以下例子找出德國-希臘Germany-Greece 的八強賽事的入球
修改它，只列出全部賽事，射入德國龍門的球員名字。

```sql
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
 WHERE teamid!= 'GER' AND (team1= 'GER' OR team2= 'GER')
```
9.
列出隊伍名稱 teamname 和該隊入球總數

```sql
SELECT teamname,COUNT(*)
  FROM eteam JOIN goal ON(id=teamid)
 GROUP BY teamname
```
10.
列出場館名和在該場館的入球數字。

```sql
SELECT stadium,COUNT(*)
  FROM game JOIN goal ON(id=matchid)
 GROUP BY stadium
```
11.
每一場波蘭'POL'有參與的賽事中，列出賽事編號 matchid, 日期date 和入球數字。

```sql
SELECT matchid,mdate,COUNT(*)
  FROM game JOIN goal ON matchid = id 
 WHERE team1 = 'POL' OR team2 = 'POL'
 GROUP BY matchid,mdate
```
12.
每一場德國'GER'有參與的賽事中，列出賽事編號 matchid, 日期date 和德國的入球數字。
```sql
SELECT matchid,mdate,COUNT(*)
  FROM game JOIN goal ON(matchid = id)
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER' 
 GROUP BY matchid,mdate 
```
13.
List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200512193029364.png)

Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.

```sql
SELECT mdate,team1,
       SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
       team2,
       SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
 GROUP BY mdate,matchid,team1,team2

```
