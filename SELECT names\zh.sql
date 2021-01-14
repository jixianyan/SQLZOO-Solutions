--1
/*
你可以用WHERE name LIKE 'B%'來找出以 B 為開首的國家。
%是萬用字元,可以用代表任何字完。
找出以 Y 為開首的國家。
*/
SELECT name FROM world
 WHERE name LIKE 'Y%'

--2
/*
找出以 Y 為結尾的國家。
*/
SELECT name FROM world
 WHERE name LIKE '%Y'

--3
/*
“Luxembourg 盧森堡”中有一個x字母,還有一個國家的名字中有x。列出這兩個國家。
找出所有國家,其名字包括字母x。
*/
SELECT name FROM world
 WHERE name LIKE '%x%'

--4
/*
“Iceland 冰島”和“Switzerland 瑞士”的名字都是以”land”作結束的。還有其他嗎?
找出所有國家,其名字以 land 作結尾。
*/
SELECT name FROM world
 WHERE name LIKE '%land'

--5
/*
“Columbia 哥倫比亞”是以 C 作開始,ia 作結尾的。還有兩個國家相同。
找出所有國家,其名字以 C 作開始,ia 作結尾。
*/
SELECT name FROM world
 WHERE name LIKE 'C%ia'

--6
/*
“Greece 希臘”中有雙 e 字。哪個國家有雙 o 字呢?
找出所有國家,其名字包括字母oo。
*/
SELECT name FROM world
 WHERE name LIKE '%oo%'

--7
/*
“Bahamas 巴哈馬”中有三個 a,還有嗎?
找出所有國家,其名字包括三個或以上的a。
*/
SELECT name FROM world
 WHERE name LIKE '%a%a%a%'

--8
/*
“India 印度”和”Angola 安哥拉”的第二個字母都是 n。
你可以用底線符_當作單一個字母的萬用字元。
SELECT name FROM world
WHERE name LIKE ‘_n%’
ORDER BY name
找出所有國家,其名字以t作第二個字母。
*/
SELECT name FROM world
 WHERE name LIKE '_t%'
 ORDER BY name

--9
/*
“Lesotho 賴索托”和”Moldova 摩爾多瓦”都有兩個字母 o,被另外兩個字母相隔着。
找出所有國家,其名字都有兩個字母 o,被另外兩個字母相隔着。
*/
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--10
/*
“Cuba古巴”和”Togo 多哥”都是 4 個字母。
找出所有國家,其名字都是 4 個字母的。
*/
SELECT name FROM world
 WHERE name LIKE '____'

--11
/*
“Luxembourg 盧森堡”的首都 capital 都同樣叫“Luxembourg”。
顯示所有國家名字,其首都和國家名字是相同的。
*/
SELECT name
  FROM world
 WHERE name=capital

--12
/*
“Mexico 墨西哥”的首都是”Mexico City”。
顯示所有國家名字,其首都是國家名字加上”City”。
concat函數
函數concat 可以用來合拼兩個或以上的字串。
*/
SELECT name
  FROM world
 WHERE capital = concat(name,' City')

--13
/*
找出所有首都和其國家名字,而首都要有國家名字中出現。
*/
SELECT capital,name
  FROM world
 WHERE capital LIKE concat('%',name,'%')

--14
/*
找出所有首都和其國家名字,而首都是國家名字的延伸。
你應顯示 Mexico City,因它比其國家名字 Mexico 長。
你不應顯示 Luxembourg,因它的首都和國家名相是相同的。
*/
SELECT name,capital
  FROM world
 WHERE capital LIKE concat('%',name,'_%')

--15
/*
“Monaco-Ville"是合併國家名字 “Monaco” 和延伸詞”-Ville".
顯示國家名字，及其延伸詞，如首都是國家名字的延伸。
你可以使用SQL函數 REPLACE 或 MID.
*/
SELECT name,REPLACE(capital,name,'')
  FROM world
 WHERE capital LIKE concat('%',name,'%') AND REPLACE(capital,name,'') <> ''
