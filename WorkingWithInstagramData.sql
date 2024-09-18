-- Ask Some Question On Instagram Clone Database
use Ig_clone;
show tables;
desc users;

-- Finding the 5 oldest user
SELECT 
    *
FROM
    users
ORDER BY created_at ASC
LIMIT 5;

-- Find the most Popular registration Date 
-- Using Dayname() function to extract the Day from the timestamp
-- And then grouping the Day and Count Highest One
-- Day and Total Is Alias Here not real column name 

SELECT 
    DAYNAME(created_at) AS Day, COUNT(*) AS Total
FROM
    users
GROUP BY Day
ORDER BY Total DESC
LIMIT 1; 

-- Find the user who have never posted a photo
-- For this purpose we use Left join and is NULL 
SELECT 
    username
FROM
    photos
        Right JOIN
    users ON users.id = Photos.user_id
WHERE
    photos.id is NULL;
    
-- To see who can get the most Likes on a Single photo
-- Two Joins Perform  we unique Photo.id
  SELECT 
    username, photos.id, image_url, COUNT(*) AS total
FROM
    photos
        INNER JOIN
    likes ON likes.photo_id = photos.id
        INNER JOIN
    users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;
    
-- Calculate the average number of photos per user.
-- To solve this we use to approach 
-- total Number of Photos / Total Number of Users

SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS Average; 
            
 --  What are the top 5 Most Commonly used Hashtags?
 SELECT 
    tags.tag_name, COUNT(*) AS Total
FROM
    photo_tags
        INNER JOIN
    tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY Total DESC
LIMIT 5; 
       
-- Find users who have liked every single photos on the site.
  SELECT 
    username, COUNT(*) AS nums_like
FROM
    Likes
        INNER JOIN
    users ON likes.user_id = users.id
GROUP BY users.id
HAVING nums_like = (SELECT 
        COUNT(*)
    FROM
        photos);
     
  
       
    
    
    






