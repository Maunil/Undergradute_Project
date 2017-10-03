create schema Ecommerce;
use Ecommerce;
#drop schema Ecommerce;

create table Category
(
	Category_ID 			int(1)		unique		,
    Category_Name 			varchar(25)	unique		,
    
    primary key(Category_ID)
);

create table City
(
	City_ID 				int(6) 		unique		,
	City_Name 				varchar(20)	not null	,
    State_Name 				varchar(20)	not null	,
    
    primary key(City_ID)
);

create table User_Details
(
	User_ID  				int(5)		unique		,
    User_Password 			varchar(10)	not null	,
    Profile_Pic 			blob 					,
    FirstName 				varchar(10)	not null	,
    MiddleName 				varchar(20)	not null	,
    LastName 				varchar(10)	not null	,
    MobileNumber			long		check (MobileNumber = 10),
    Category_ID 			int(1) 		default'0'	,
    City_ID 				int(6) 		not null	,
    Sex 					char(1)		not null	, 
    Birth_Date				date					, # IT should be greter than 18 
    Join_date 				date 					,
    
	foreign key(Category_ID) 	references Category(Category_ID)
    on delete cascade on update cascade, 
	 
    foreign key(City_ID) references City(City_ID)
    on delete cascade on update cascade,
	 
	primary key(User_ID)
);

create table Friends_And_Relatives
(
   User_ID 					int(5) 		not null	,
   Friend_ID 				int(5) 		not null	,
   Since 					date		not null	,
   
   foreign key(User_ID) references  User_Details(User_ID)
   on delete cascade on update cascade,
   
   foreign key(Friend_ID) references  User_Details(User_ID)
   on delete cascade on update cascade,
   
   primary key(User_ID,Friend_ID)
);

create table FR_Message
(

   User_ID 					int(5) 		not null	,
   Friend_ID 				int(5) 		not null	,
   Time_of_Intereaction     Timestamp 				,
   Message_in				text					, # Further try to Analytically think on it
   Message_out				text					,
   
   foreign key(User_ID) references  User_Details(User_ID)
   on delete cascade on update cascade,
   
   foreign key(Friend_ID) references  User_Details(User_ID)
   on delete cascade on update cascade,
   
   primary key(User_ID,Friend_ID,Time_of_Intereaction)

);


create table General_status 
(
   ServiceProvider_ID		int(5) 		not null	,
   Online_Offline 			binary(1) 	default'0'	, #0-Offline, 1-Online
   Date_Online				date 		not null	,
   
   foreign key(ServiceProvider_ID) 	references  User_Details(User_ID)
   on delete cascade on update cascade,
   
   primary key(Date_Online,ServiceProvider_ID)   
);

create table Manager
(
	Manager_ID 				int(5) 		unique		,
	M_name					varchar(10) not null	,
    Sex 					char(1)		not null	,
    City_ID 				int(6) 		unique		,
    Salary 					int(8)		not null	,
	Birth_Date              date		not null	,
	Mobile_No				long		check (MobileNumber = 10),
    
	primary key(Manager_ID),
    foreign key(City_ID) references City(City_ID)
);

create table Service_Providers
(
   ServiceProvider_ID 		int(5) 		unique		,
   Qualification 			varchar(40) not null	,
   Avablity_percentage		float(3,2)	default'0'	,# This thing is calculted using third party tools
   
   foreign key(ServiceProvider_ID) references  User_Details(User_ID)
   on delete cascade on update cascade,
   
   primary key(ServiceProvider_ID)
);

create table Services
(
	Service_Name 			varchar(20) not null	,
    Service_ID 				int(5) 		unique		,
	
    primary key(Service_ID)
);

create table Service_Provided
(
    ServiceProvider_ID 		int(5) 		not null	,
    City_ID 				int(6) 		not null	,
    Service_ID 				int(5) 		not null	,
	Basic_Charges 			long  		not null	,
    Marginal_Percentage    	double(3,1)	not null	,
    
    foreign key(ServiceProvider_ID) references Service_Providers(ServiceProvider_ID)
    on delete cascade on update cascade,
	
    foreign key(City_ID) references City(City_ID)
    on delete cascade on update cascade,
	
    foreign key(Service_ID) references Services(Service_ID)
    on delete cascade on update cascade,
	
    primary key(ServiceProvider_ID,Service_ID,City_ID)
);

create table Used
(
	Customer_ID 			int(5)      not null	,
    ServiceProvider_ID 		int(5)      not null	,
    Service_ID 				int(5)      not null	,
    Address 				varchar(50) not null	,
    Order_ID 				int(5)	    unique		,
    Timing 					datetime    not null	,
    Amount_paid             long        not null	,
    
	primary key(Order_ID),
	
    foreign key(Customer_ID) references User_Details(User_ID)
    on delete cascade on update cascade,
	
    foreign key(ServiceProvider_ID) references Service_Provided(ServiceProvider_ID)
    on delete cascade on update cascade,
	
    foreign key(Service_ID) references Service_Provided(Service_ID)
	 on delete cascade on update cascade
);

create table Recommendation
(
	Recommendation_ID       int(5) 		unique		,
    Customer_ID 			int(5) 		not null	,
    ServiceProvider_ID 		int(5) 		not null	,
    Service_ID 				int(5) 		not null	,
    City_ID 				int(6) 		not null	,
    Comments 				varchar(50)				,
	Rating 					double(3,1) 			,
    
    foreign key(Customer_ID) references User_Details(User_ID)
    on delete cascade on update cascade,
    
    foreign key(City_ID) references City(City_ID)
    on delete cascade on update cascade,
	
    foreign key(ServiceProvider_ID) references Service_Provided(ServiceProvider_ID)
    on delete cascade on update cascade,
	
    foreign key(Service_ID) references Service_Provided(Service_ID)
    on delete cascade on update cascade,
	
    primary key(Recommendation_ID)
);

create table Advertisers
(
	Advertiser_ID			int(5)		unique		,
	Advertiser_Name			varchar(30) not null	,
	
	primary key(Advertiser_ID)
);

create table Advertisement_Given
(
	Advertiser_ID			   int(5)	not null	,
	Adv_Date				   date		not null	,
	Advertising_Cost		   int(8)	not null	,
	Number_of_users_interested int(8)  	default'0' not null,
	
	foreign key(Advertiser_ID) references Advertisers(Advertiser_ID),
	primary key(Advertiser_ID, Adv_Date)
);


#Calculating the Working_days
#create view availablity as select count(Date_Online) as total from General_status group by ServiceProvider_ID;

#drop view availablity; 
#drop trigger calculate_working;
    
DELIMITER $$
CREATE TRIGGER calculate_working after insert on General_Status 
FOR EACH ROW
BEGIN
        #declare first date;
		 set @second = (select DATEDIFF(now(),(select join_date from user_details where
         User_ID =new.ServiceProvider_ID)));
	 
		 set @first  =  (select count(distinct date_online) from General_status where serviceProvider_ID=
         new.serviceProvider_ID group by serviceProvider_ID);
		 
         update Service_Providers set Avablity_percentage =  ((@first/@second)*(100)) where 
         ServiceProvider_ID = new.ServiceProvider_ID;
     
END$$
DELIMITER ;

#To get the advertise profit

#Procedure
DELIMITER $$ 
CREATE PROCEDURE calculate_advertise_charge(
    in  p  int(5),
    in  p_date date,
    out profit int(8))
BEGIN
    
	set @fir=(select Number_of_users_interested from  Advertisement_Given  where Advertiser_ID = p and Adv_Date=p_date);
  
	set @sec = (select Advertising_Cost from Advertisement_Given where Advertiser_ID =p and Adv_Date=p_date);

    
    SET profit = (@fir*@sec);
    
END$$
DELIMITER ;

#drop procedure calculate_advertise_charge;

#Sample Call
#call calculate_advertise_charge(11221,str_to_date('07-15-2010', '%m-%d-%Y'),@version);
#select @version;

#Calculating the Average Rating from recommendation

#drop view totalCount; 
create view totalCount as select ServiceProvider_ID, Service_ID, City_ID, count(Recommendation_ID) as total from Recommendation group by ServiceProvider_ID, Service_ID, City_ID;

#drop view totalRating; 
create view totalRating as select ServiceProvider_ID, Service_ID, City_ID, sum(Rating) as totalRatings from Recommendation group by ServiceProvider_ID, Service_ID, City_ID;

#drop view averageRating; 
create view averageRating as select totalCount.ServiceProvider_ID, totalCount.Service_ID, totalCount.City_ID, (totalRatings/total) as avgRatings from (totalCount natural join totalRating);
#Inserting Data


insert into Category(Category_ID, Category_Name) values (0,'Customer');
insert into Category(Category_ID, Category_Name) values (1,'Service Provider');

insert into City (City_ID,City_Name,State_Name) values (382350,'Ahmedabad','Gujarat');
insert into City (City_ID,City_Name,State_Name) values (382351,'Gandhinagar','Gujarat');
insert into City (City_ID,City_Name,State_Name) values (382352,'Baroda','Gujarat');
insert into City (City_ID,City_Name,State_Name) values (382353,'Surat','Gujarat');
insert into City (City_ID,City_Name,State_Name) values (382354,'Rajkot','Gujarat');
insert into City (City_ID,City_Name,State_Name) values (382355,'Udaipur','Rajasthan');
insert into City (City_ID,City_Name,State_Name) values (382356,'Jaipur','Rajasthan');
insert into City (City_ID,City_Name,State_Name) values (382357,'Panaji','Goa');
insert into City (City_ID,City_Name,State_Name) values (382358,'Mumbai','Maharashtra');
insert into City (City_ID,City_Name,State_Name) values (382359,'Nashik','Maharashtra');
insert into City (City_ID,City_Name,State_Name) values (382360,'Bokaro','Jharkhand');
insert into City (City_ID,City_Name,State_Name) values (382361,'Ranchi','Jharkhand');
insert into City (City_ID,City_Name,State_Name) values (382362,'Panipat','Haryana');
insert into City (City_ID,City_Name,State_Name) values (382363,'Ambala','Haryana');
insert into City (City_ID,City_Name,State_Name) values (382364,'Srinagar','Jammu & Kashmir');
insert into City (City_ID,City_Name,State_Name) values (382365,'Ladahkh','Jammu & Kashmir');
insert into City (City_ID,City_Name,State_Name) values (382366,'Gaya','Bihar');
insert into City (City_ID,City_Name,State_Name) values (382367,'Bhagalpur','Bihar');
insert into City (City_ID,City_Name,State_Name) values (382368,'Patna','Bihar');
insert into City (City_ID,City_Name,State_Name) values (382369,'Kolkata','West Bengal');
insert into City (City_ID,City_Name,State_Name) values (382370,'Hooghly','West Bengal');
insert into City (City_ID,City_Name,State_Name) values (382371,'Darjeeling','West Bengal');

insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12345,'1238455834','L.png','Jay','Ashokbhai','Dangar',9898257416,0,382350,'M',str_to_date('07-15-1987', '%m-%d-%Y'), str_to_date('07-15-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12346,'3138284195','L.png','Sagar','Ganeshbhai','Patel',9838707419,1,382350,'F',str_to_date('02-01-1990', '%m-%d-%Y'), str_to_date('04-30-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12347,'4723424322','L.png','Abhishek','Jitubhai','Pandya',9438757331,1,382350,'M',str_to_date('07-12-1992', '%m-%d-%Y'), str_to_date('06-15-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12348,'3133998652','L.png','Mehul','shlokbhai','Satodiya',9538492722,0,382351,'M',str_to_date('01-15-1984', '%m-%d-%Y'), str_to_date('03-10-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12349,'313sds42','L.png','Jaydeep','Manishbhai','Rachch',8141365978,0,382351,'F',str_to_date('02-28-1982', '%m-%d-%Y'), str_to_date('01-28-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12310,'313826fbb5','L.png','Mohit','Rakeshbhai','Desai',8141365980,1,382371,'M',str_to_date('10-23-1989', '%m-%d-%Y'), str_to_date('08-25-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12311,'3138fb4195','L.png','Akash','Maheshbhai','Patel',8141365100,0,382352,'M',str_to_date('12-01-1997', '%m-%d-%Y'), str_to_date('08-25-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12312,'asdf284195','L.png','Jay','Miteshbhai','Joshi',8141586903,0,382370,'F',str_to_date('07-15-1983', '%m-%d-%Y'), str_to_date('03-10-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12313,'vmyy284195','L.png','Mihir','Mohanbhai','Gajjar',9578632140,0,382352,'M',str_to_date('03-05-1990', '%m-%d-%Y'), str_to_date('02-09-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12314,'3cgnj84195','L.png','Shreyas','Girishbhai','Patel',9578632541,0,382353,'M',str_to_date('04-19-1981', '%m-%d-%Y'), str_to_date('10-18-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12315,'313vhfdb95','L.png','Rajat','Miteshbhai','Barot',9825456787,0,382369,'F',str_to_date('07-15-1983', '%m-%d-%Y'), str_to_date('09-27-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12316,'313dbbsn95','L.png','Maunil','Rohitbhai','Vyas',9578632589,1,382353,'F',str_to_date('07-12-1992', '%m-%d-%Y'), str_to_date('08-23-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12317,'3132g4b95','L.png','Deep','Chittaranjanbhai','Patel',9578633210,1,382354,'M',str_to_date('01-05-1992', '%m-%d-%Y'), str_to_date('10-18-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12318,'313w6h195','L.png','Aatman','Jaiminbhai','Dholakiya',9678451230,1,382368,'M',str_to_date('09-12-1994', '%m-%d-%Y'), str_to_date('02-09-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12319,'3134rg5195','L.png','Shivani','Hasmukhbhai','Patel',9678451231,0,382354,'F',str_to_date('07-21-1993', '%m-%d-%Y'), str_to_date('09-27-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12320,'313e45195','L.png','Pooja','Jayeshbhai','Chavda',9678451458,0,382355,'M',str_to_date('12-01-1994', '%m-%d-%Y'), str_to_date('10-18-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12321,'3aey4195','L.png','Divya','Manojbhai','Dabhi',9098257416,0,382356,'F',str_to_date('07-15-1993', '%m-%d-%Y'), str_to_date('02-09-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12322,'31r45y4195','L.png','Dipen','Niravbhai','Akbari',9098257418,0,382357,'M',str_to_date('02-15-1979', '%m-%d-%Y'), str_to_date('09-27-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12323,'322ee4195','L.png','Abhishek','Hardikbhai','Kadivar',9098289418,0,382358,'F',str_to_date('03-12-1974', '%m-%d-%Y'), str_to_date('02-09-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12324,'abc84195','L.png','Arjun','Vishalbhai','Sekhaliya',9865897416,1,382358,'M',str_to_date('07-15-1993', '%m-%d-%Y'), str_to_date('10-18-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12325,'3132e84195','L.png','Hardik','Ratneshbhai','Shah',9898236546,1,382358,'F',str_to_date('11-11-1986', '%m-%d-%Y'), str_to_date('05-17-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12326,'31ervy195','L.png','Parth','Maitreybhai','Mehta',9898296306,1,382359,'F',str_to_date('12-19-1981', '%m-%d-%Y'), str_to_date('06-29-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12327,'313edty95','L.png','Mehul','Kishanbhai','Raval',8974526312,0,382359,'M',str_to_date('10-14-1971', '%m-%d-%Y'), str_to_date('02-09-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12328,'31wer195','L.png','Malhar','Bharatbhai','Solanki',8974524587,0,382359,'F',str_to_date('09-22-1984', '%m-%d-%Y'), str_to_date('09-27-2015', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12329,'313rrt195','L.png','Pratham','Madhavbhai','Yuthika',8974525587,1,382360,'F',str_to_date('07-15-1975', '%m-%d-%Y'), str_to_date('12-11-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12330,'313yb4195','L.png','Aashima','Rahulbhai','Kanjiya',9825877416,0,382360,'F',str_to_date('07-15-1990', '%m-%d-%Y'), str_to_date('09-09-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12331,'qwe84195','L.png','Nirav','Harshbhai','Dalal',9898321416,1,382361,'M',str_to_date('01-15-1991', '%m-%d-%Y'), str_to_date('09-09-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12332,'3j284195','L.png','Janki','Janakbhai','Machchar',9897536416,0,382362,'M',str_to_date('04-15-1992', '%m-%d-%Y'), str_to_date('09-09-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12333,'31thjf4195','L.png','Rythm','Jaybhai','Prajapati',9887417416,0,382363,'F',str_to_date('02-12-1993', '%m-%d-%Y'), str_to_date('12-11-2013', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12334,'313fewe195','L.png','Kathan','Bholabhai','Gupta',9899587416,1,382364,'F',str_to_date('07-25-1994', '%m-%d-%Y'), str_to_date('09-09-2014', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12335,'313828rew','L.png','Dhruv','Nileshbhai','Patel',9898321416,0,382364,'M',str_to_date('09-05-1995', '%m-%d-%Y'), str_to_date('05-01-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12337,'3138284e','L.png','Dhruvit','Dharmeshbhai','Barot',9365257416,0,382365,'F',str_to_date('10-15-1982', '%m-%d-%Y'), str_to_date('04-27-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12338,'3138282cvr','L.png','Akshay','Govindbhai','Ahir',9658757416,0,382366,'M',str_to_date('10-13-1983', '%m-%d-%Y'), str_to_date('05-02-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12339,'313828gg5','L.png','Jethalal','Champaklal','Gada',7589257416,1,382367,'F',str_to_date('11-19-1984', '%m-%d-%Y'), str_to_date('04-27-2016', '%m-%d-%Y'));
insert into User_Details (User_ID, User_Password, Profile_Pic,FirstName,MiddleName,LastName,MobileNumber,Category_ID,City_ID,Sex,Birth_Date, Join_Date)
values (12340,'313828efb5','L.png','Anjali','Taarak','Mehta',7898257416,0,382367,'M',str_to_date('07-15-1985', '%m-%d-%Y'), str_to_date('04-28-2016', '%m-%d-%Y'));


insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12310,12314,str_to_date('07-15-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12310,12319,str_to_date('09-16-2011', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12312,12316,str_to_date('07-20-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12317,12319,str_to_date('08-01-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12320,12313,str_to_date('01-17-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12321,12323,str_to_date('01-25-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12324,12323,str_to_date('01-30-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12326,12315,str_to_date('02-02-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12323,12327,str_to_date('02-18-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12328,12313,str_to_date('02-25-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12330,12324,str_to_date('03-03-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12331,12319,str_to_date('03-15-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12332,12323,str_to_date('03-20-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12337,12327,str_to_date('03-25-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12338,12334,str_to_date('04-01-2010', '%m-%d-%Y'));
insert into Friends_And_Relatives (User_ID, Friend_ID,Since)
values (12340,12327,str_to_date('04-25-2010', '%m-%d-%Y'));

insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12310,12314,'2013-12-11 14:02:50','Suggest me good service provider names.','Deep is a good service provider.');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12310,12319,'2015-07-06 20:45:28','Good Day','Hello Day');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12312,12316,'2015-08-06 08:46:52','Hello','How are you');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12317,12319,'2015-08-06 08:46:52','Hi!There','HI.');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12320,12313,'2016-03-08 04:12:28','Good Morning,','');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12321,12323,'2013-10-14 00:58:46','Hello','How are you');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12324,12323,'2014-06-22 12:46:20','Hello','How are you');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12326,12315,'2016-01-09 20:16:18','Hello','How are you');
insert into FR_Message(User_ID, Friend_ID, Time_of_Intereaction, Message_in, Message_out)
values (12323,12327,'2013-10-14 00:58:46',null,null);


insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12346,1,'2003-12-31');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12347,0,'2004-01-12');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12316,1,'2001-09-01');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12310,1,'2015-12-31');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12317,0,'2014-12-31 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12324,1,'2015-11-21 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12325,0,'2011-12-31 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12318,1,'2013-12-31 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12326,1,'2013-12-31 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12331,0,'2014-10-11 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12339,1,'2014-11-12 ');
insert into General_status (ServiceProvider_ID,Online_Offline,Date_online)
values (12334,1,'2015-08-05 ');

insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12346,'10th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12347,'8th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12316,'12th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12310,'ITI',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12324,'6th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12317,'ITI',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12325,'5th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12318,'9th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12329,'ITI',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12326,'9th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12334,'11th Pass',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12339,'ITI',0);
insert into Service_Providers (ServiceProvider_ID,Qualification,Avablity_percentage	)
values (12331,'7th Pass',0);

insert into Services (Service_ID,Service_Name)
values(12030,'Barber');
insert into Services (Service_ID,Service_Name)
values(12031,'Electrical');
insert into Services (Service_ID,Service_Name)
values(12032,'Carpenting');
insert into Services (Service_ID,Service_Name)
values(12033,'Car-Repairing');
insert into Services (Service_ID,Service_Name)
values(12034,'Plumbing');
insert into Services (Service_ID,Service_Name)
values(12035,'Painting');
insert into Services (Service_ID,Service_Name)
values(12036,'House Keeping');

insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12346,382350,12030,300,12.5);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12347,382351,12031,350,05.7);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12310,382352,12033,500,06.7);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12317,382353,12034,200,08.0);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12316,382354,12035,400,14.5);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12324,382355,12036,280,06.5);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12325,382356,12032,360,08.6);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12318,382357,12031,500,13.8);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12326,382358,12035,170,08.0);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12329,382359,12036,260,13.8);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12331,382360,12030,350,07.0);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12339,382361,12031,400,05.8);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12334,382362,12033,230,12.6);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12347,382363,12034,300,06.0);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12347,382371,12036,3000,09.3);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12339,382371,12035,500,05.3);
insert into Service_Provided (ServiceProvider_ID,City_ID,Service_ID,Basic_Charges,Marginal_Percentage)
values (12329,382360,12030,450,06.5);


insert into Used(Customer_ID, ServiceProvider_ID, Service_ID, Address, Order_ID, Timing, Amount_paid)
values(12345,12346,12030,'Nandanvan Park Society',11111,'2015-12-31 01:02:03',250);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12348,12347,12031,'Ila Society',11112,'2016-01-12 01:12:03',200);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12311,12310,12033,'Pooja Society',11113,'2016-01-01 09:02:39',100);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12314,12316,12035,'Swaminarayan Park',11114,'2016-03-21 11:02:13',50);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12319,12324,12036,'Pratik Tenament',11115,'2015-12-31 10:25:25',300);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12320,12318,12035,'Girivar Bunglows',11116,'2015-12-11 04:05:15',450);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12320,12347,12036,'Girivar Bunglows',11134,'2015-12-11 02:06:15',3000);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12327,12329,12034,'Shukan Bunglows',11117,'2015-05-31 06:42:03',960);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12335,12339,12032,'Madhav Homes',11118,'2015-10-31 01:02:03',840);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12338,12334,12031,'Akruti Society',11119,'2015-09-22 01:32:03',520);
insert into Used(Customer_ID,ServiceProvider_ID,Service_ID,Address,Order_ID,Timing,Amount_paid)
values(12340,12347,12030,'Hari_OM Society',11120,'2015-08-21 01:12:03',740);

insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85236,12311,12346,12030,382350,'Thank you.',3.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85237,12314,12347,12031,382351,'Thank you.',2.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85283,12314,12316,12035,382354,'Thank you.',3.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85291,12319,12339,12031,382361,'Hulla',4.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85238,12320,12316,12035,382354,'Thank you.',4.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85239,12327,12324,12036,382355,'Bad one.',1.0);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85240,12338,12347,12032,382351,'Excited.',1.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85241,12340,12347,12031,382351,'Thank you.',2.5);
insert into Recommendation(Recommendation_Id,Customer_ID,ServiceProvider_ID,Service_ID,City_ID,Comments,Rating)
values(85242,12311,12339,12031,382361,'Thank you.',3.5);

insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68123,'Raj_Ko','M',382350,50000,str_to_date('07-15-1968', '%m-%d-%Y'), 9999991234);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68124,'Bhim_Ks','M',382351,50000,str_to_date('09-15-1985', '%m-%d-%Y'), 9999991235);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68125,'Netra_P','F',382352,50000,str_to_date('07-27-1975', '%m-%d-%Y'), 9999991236);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68126,'Pooja','M',382353,50000,str_to_date('02-06-1968', '%m-%d-%Y'), 9999991237);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68127,'Shyam','M',382354,50000,str_to_date('09-08-1954', '%m-%d-%Y'), 9999991238);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68128,'Vis','M',382355,50000,str_to_date('07-30-1979', '%m-%d-%Y'), 9999991239);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68129,'Ayush','M',382356,50000,str_to_date('06-21-1971', '%m-%d-%Y'), 9999991240);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68130,'Aksha','M',382357,50000,str_to_date('07-26-1977', '%m-%d-%Y'), 9999991241);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68131,'James','M',382358,50000,str_to_date('11-05-1976', '%m-%d-%Y'), 9999991242);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68132,'Pooja','F',382359,50000,str_to_date('02-16-1989', '%m-%d-%Y'), 9999991243);
insert into Manager(Manager_ID,M_name,Sex,City_ID,Salary,Birth_date, Mobile_No)values(68133,'Falguni','F',382360,50000,str_to_date('12-15-1990', '%m-%d-%Y'), 9999991244);

insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11221,'Bright Advertisers Pvt Ltd.');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11222,'Lucky Publicity Pvt. Ltd.');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11223,'Chitra Outdoors Ltd.');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11224,'Jay Advertisings, LLC');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11225,'GlucoAD Inc.');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11226,'Household Publicity Pvt. Ltd.');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11227,'IGA Corporation, LLC');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11228,'Google AdSense, Google Inc.');
insert into Advertisers(Advertiser_ID,Advertiser_Name) values(11229,'Eagle Advertising GmbH');

insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11221,str_to_date('07-15-2010', '%m-%d-%Y'),1000,233);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11222,str_to_date('07-29-2010', '%m-%d-%Y'),1750,102);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11223,str_to_date('08-15-2010', '%m-%d-%Y'),1450,12);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11224,str_to_date('08-20-2010', '%m-%d-%Y'),1500,3);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11225,str_to_date('08-30-2010', '%m-%d-%Y'),1400,522);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11226,str_to_date('09-02-2010', '%m-%d-%Y'),2150,18);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11227,str_to_date('12-12-2010', '%m-%d-%Y'),1700,0);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11228,str_to_date('01-01-2011', '%m-%d-%Y'),1000,45);
insert into Advertisement_Given(Advertiser_ID,Adv_Date,Advertising_Cost, Number_of_users_interested) values(11229,str_to_date('04-11-2011', '%m-%d-%Y'),1500,101);

#Queries

#1
select * from Recommendation where Customer_ID in (select Friend_ID from Friends_And_Relatives where Friends_And_Relatives.User_ID=12310);

#2
#select ServiceProvider_ID, Service_ID, Basic_Charges from Service_Provided where City_ID=(select City_ID from User_Details where User_ID=12310) and ServiceProvider_ID in (select ServiceProvider_ID from ((select Friend_ID from Friends_And_Relatives where User_ID=12310) as a) join Recommendation on a.Friend_ID=Recommendation.Customer_ID where Recommendation.Service_ID=12036) and Service_ID=12036 order by Basic_Charges asc;
select Service_Provided.ServiceProvider_ID, Service_Provided.Service_ID, Basic_Charges, avgRatings from (Service_Provided natural join averageRating) where City_ID=(select City_ID from User_Details where User_ID=12310) and Service_Provided.ServiceProvider_ID in (select ServiceProvider_ID from ((select Friend_ID from Friends_And_Relatives where User_ID=12310) as a) join Recommendation on a.Friend_ID=Recommendation.Customer_ID where Recommendation.Service_ID=12036) and Service_ID=12036 order by Basic_Charges asc;

#3
#select ServiceProvider_ID, Service_ID, Basic_Charges from Service_Provided where City_ID=(select City_ID from User_Details where User_ID=12310) order by Basic_Charges asc;
select Service_Provided.ServiceProvider_ID, Service_Provided.Service_ID, Basic_Charges, avgRatings from (Service_Provided natural join averageRating) where City_ID=(select City_ID from User_Details where User_ID=12310) order by Basic_Charges asc;

#4
#select ServiceProvider_ID, Service_ID, Basic_Charges from Service_Provided where Basic_Charges<=300 order by Basic_Charges asc;
select Service_Provided.ServiceProvider_ID, Service_Provided.Service_ID, Basic_Charges, avgRatings from (Service_Provided natural join averageRating) where Basic_Charges<=300 order by Basic_Charges asc;

#5
select Service_Provided.ServiceProvider_ID,Service_Provided.Service_ID, Basic_Charges, avgRatings from (Service_Provided natural join averageRating) where avgRatings>=3.6 order by avgRatings desc;

#6
select a.ServiceProvider_ID, avgRatings, a.Worked from ((select ServiceProvider_ID, count(*) as Worked from Used group by ServiceProvider_ID desc) as a join (select Service_Provided.ServiceProvider_ID, avgRatings from(Service_Provided natural join averageRating)) as b on a.ServiceProvider_ID=b.ServiceProvider_ID );

#7
select ServiceProvider_ID,tab.cnt,Basic_Charges from (select distinct ServiceProvider_ID, City_ID, Basic_Charges, count(*) as cnt  from Service_Provided group by ServiceProvider_ID order by Basic_Charges desc)as tab where tab.cnt>1 order by Basic_Charges asc;

#8
select ServiceProvider_ID from Used where Customer_ID=12320 and Amount_Paid<500;

#9
select Service_ID, count(*) as HighestUsed from Used group by Service_ID limit 1;

#10
select Service_Provided.ServiceProvider_ID, avgRatings from (Service_Provided natural join averageRating) where Service_Provided.Service_ID=12030 order by avgRatings asc limit 1;

#11
select Service_Provided.ServiceProvider_ID, avgRatings from (Service_Provided natural join averageRating) where Service_Provided.Service_ID=12031 order by avgRatings desc limit 1;

#12
select Service_ID, sum(Amount_paid) as Total_Amount from Used where YEAR(Timing)=2015  group by Service_ID order by Total_Amount desc limit 1;

#13
select Service_ID from(select Service_ID, count(*) as HighestUsed from Used group by Service_ID order by HighestUsed desc) as a where a.HighestUsed<2;	#Services that are need to Promote

#14
select User_ID from User_Details where DATEDIFF(now(),(Join_Date))<=15;

#15
select User_ID from User_Details join Service_Providers on (User_Details.User_ID=Service_Providers.ServiceProvider_ID) where DATEDIFF(now(),(Join_Date))<=15;
