1.
Select the code which uses an outer join correctly.

> ![这里是引用](https://img-blog.csdnimg.cn/2021011518423934.png)

2.
Select the correct statement that shows the name of department which employs Cutflower -

> ![这里是引用](https://img-blog.csdnimg.cn/20210115184309189.png)

3.
Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers

> ![这里是引用](https://img-blog.csdnimg.cn/20210115184434415.png)

4.
Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:

> ![这里是引用](https://img-blog.csdnimg.cn/20210115184459302.png)

5.
Query:
SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher
  

> ![这里是引用](https://img-blog.csdnimg.cn/2021011518453885.png)

6.
Select the result that would be obtained from the following code:
 SELECT name, 
      CASE 
       WHEN dept 
        IN (1) 
        THEN 'Computing' 
       ELSE 'Other' 
      END 
  FROM teacher
  

> ![这里是引用](https://img-blog.csdnimg.cn/20210115184559280.png)
