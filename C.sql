/*Question 1*/

select * 
from restaurant
where CUISINE='Indian';

/*Question 2*/

select res.NAME, rt.stars
from restaurant res, rating rt
where rt.rid = res.RID
group by res.name, rt.stars 
having rt.stars=5 or rt.stars=4
order by rt.stars ASC;


/*Question 3*/

select rid, name 
from restaurant
where rid not in (select rid from rating);


/*Question 4*/

select res.rid, res.name, rt.ratingdate
from restaurant res, rating rt
where res.rid=rt.RID and rt.ratingdate is null; 

/*Question 5*/

select rev.name, res.NAME
from reviewer rev, restaurant res, 
                ( select rid,vid, count(stars) as count
                 from rating
                 group by rID, vid ) rt_count
where res.rid=rt_count.rid and rt_count.count>=2 and rev.vid=rt_count.vid;

/*Question 6*/

select res.NAME,MAX(rt_max.max_stars) as Max_Rating
from reviewer rev, restaurant res, 
                ( select rid,vid, Max(stars) as max_stars
                 from rating
                 group by rID,vid ) rt_max
where res.rid=rt_max.rid and res.rid=rt_max.rid and rev.vid=rt_max.vid
group by res.Name;