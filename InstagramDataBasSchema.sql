-- Project Instagram DataBase Clone 
create schema Ig_clone;
use Ig_clone;
-- Create First Table Users In instagram Database
create table Users
     (
     Id integer primary key auto_increment,
     Username varchar(255) Unique Not null,
     Created_at timestamp default Now()
     );
-- Create Second Table Photos In Instagram Database
 create table Photos
     (
     Id integer primary key auto_increment,
     Image_Url varchar(255) not null,
     User_Id Integer not null,
     Created_at timestamp default now(),
     foreign key(user_id) references users(id)
     );    
 -- Create Third Table Comments In Instagram Database    
create table Comments
     (
     Id integer Auto_Increment primary key,
     Comment_Text varchar(255) not null,
     Photo_id integer not null,
     User_id integer not null,
     Created_At timestamp default Current_timestamp,
     foreign key(Photo_id) references Photos(id),
     foreign key(User_id) references users(id)
     );	
-- Create Fourth Table Likes In Instagram Database
create table Likes
(
User_id integer not null,
Photo_id integer not null,
Created_At timestamp default Now(),
Foreign key(User_id) references Users(id),
Foreign key(Photo_id) references Photos(id),
primary key(User_id,Photo_id)
); 

-- Create Fifth Table Follows In Instagram Database
create table follows
(
Follower_id Integer Not null,
Followee_id Integer Not null,
Created_At Timestamp default now(),
Foreign key(Follower_id) references Users(id),
Foreign key(Followee_id) references Users(id),
Primary key(Follower_id,Followee_id)
);
-- Create Sixth Table Hastags In Instagram Database

-- create table Tags

create table tags
(
Id Integer Auto_Increment primary key,
Tag_Name varchar(255) Unique,
created_at timestamp default now()
);
-- create table Photo_tags
create table photo_tags
(
Photo_id Integer not null,
Tag_id Integer not null,
foreign key(Photo_id) references Photos(id),
foreign key(tag_id) references tags(id),
primary key(photo_id,tag_id)
);



    
