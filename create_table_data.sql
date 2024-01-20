create table qitem
(itemname char(30) not null,
itemtype char(1),
itemcolor char(10),
constraint pk_qitem primary key (itemname));

insert into qitem values ('Boots - snakeproof','C','Green');
insert into qitem values ('Camel saddle','R','Brown');
insert into qitem values ('Compass','N','-');
insert into qitem values ('Elephant polo stick','R','Bamboo');
insert into qitem values ('Exploring in 10 Easy Lessons','B','-');
insert into qitem values ('Geo positioning system','N','-');
insert into qitem values ('Hammock','F','Khaki');
insert into qitem values ('Hat - polar explorer','C','White');
insert into qitem values ('How to Win Foreign Friends','B','-');
insert into qitem values ('Map case','E','Brown');
insert into qitem values ('Map measure','N','-');
insert into qitem values ('Pith helmet','C','Khaki');
insert into qitem values ('Pocket knife - Avon','E','Brown');
insert into qitem values ('Pocket knife - Nile','E','Brown');
insert into qitem values ('Safari chair','F','Khaki');
insert into qitem values ('Safari cooking kit','F','-');
insert into qitem values ('Sextant','N','-');
insert into qitem values ('Stetson','C','Black');
insert into qitem values ('Tent - 2 person','F','Khaki');
insert into qitem values ('Tent - 8 person','F','Khaki');
COMMIT;

create table qemp
(empno integer not null,
empfname char(15),
empsalary number(6),
deptname char(15),
bossno integer,
constraint pk_qemp primary key (empno));


insert into qemp(empno, empfname, empsalary, deptname) values
(1,'Alice',75000,'Management');

insert into qemp values (2,'Ned',45000,'Marketing',1);
insert into qemp values (3,'Andrew',25000,'Marketing',2);
insert into qemp values (4,'Clare',22000,'Marketing',2);
insert into qemp values (5,'Todd',38000,'Accounting',1);
insert into qemp values (6,'Nancy',22000,'Accounting',5);
insert into qemp values (7,'Brier',43000,'Purchasing',1);
insert into qemp values (8,'Sarah',56000,'Purchasing',7);
insert into qemp values (9,'Sophie',35000,'Personnel',1);
insert into qemp values (10,'Sanjay',15000,'Navigation',3);
insert into qemp values (11,'Rita',15000,'Books',4);
insert into qemp values (12,'Gigi',16000,'Clothes',4);
insert into qemp values (13,'Maggie',16000,'Clothes',4);
insert into qemp values (14,'Paul',11000,'Equipment',3);
insert into qemp values (15,'James',15000,'Equipment',3);
insert into qemp values (16,'Pat',15000,'Furniture',3);
insert into qemp values (17,'Mark',15000,'Recreation',3);
COMMIT;

create table qdept
(deptname char(15) not null,
deptfloor integer,
deptphone integer,
empno integer not null,
constraint pk_qdept primary key (deptname),
constraint fk_hasboss foreign key (empno) references qemp (empno));

insert into qdept values ('Management',5,34,1);
insert into qdept values ('Books',1,81,4);
insert into qdept values ('Clothes',2,24,4);
insert into qdept values ('Equipment',3,57,3);
insert into qdept values ('Furniture',4,14,3);
insert into qdept values ('Navigation',1,41,3);
insert into qdept values ('Recreation',2,29,4);
insert into qdept values ('Accounting',5,35,5);
insert into qdept values ('Purchasing',5,36,7);
insert into qdept values ('Personnel',5,37,9);
insert into qdept values ('Marketing',5,38,2);
COMMIT;

create table qsale
(saleno integer not null,
saleqty integer,
itemname char(30) not null,
deptname char(15) not null,
constraint pk_saleno primary key (saleno),
constraint fk_isitem foreign key (itemname) references qitem (itemname),
constraint fk_bydept foreign key (deptname) references qdept (deptname));

insert into qsale values (1001,2,'Boots - snakeproof','Clothes');
insert into qsale values (1002,1,'Pith helmet','Clothes');
insert into qsale values (1003,1,'Sextant','Navigation');
insert into qsale values (1004,3,'Hat - polar explorer','Clothes');
insert into qsale values (1005,5,'Pith helmet','Equipment');
insert into qsale values (1006,1,'Pocket knife - Nile','Clothes');
insert into qsale values (1007,1,'Pocket knife - Nile','Recreation');
insert into qsale values (1008,1,'Compass','Navigation');
insert into qsale values (1009,1,'Geo positioning system','Navigation');
insert into qsale values (1010,5,'Map measure','Navigation');
insert into qsale values (1011,1,'Geo positioning system','Books');
insert into qsale values (1012,1,'Sextant','Books');
insert into qsale values (1013,3,'Pocket knife - Nile','Books');
insert into qsale values (1014,1,'Pocket knife - Nile','Navigation');
insert into qsale values (1015,1,'Pocket knife - Nile','Equipment');
insert into qsale values (1016,1,'Sextant','Clothes');
insert into qsale values (1017,1,'Sextant','Equipment');
insert into qsale values (1018,1,'Sextant','Recreation');
insert into qsale values (1019,1,'Sextant','Furniture');
insert into qsale values (1020,1,'Pocket knife - Nile','Furniture');
insert into qsale values (1021,1,'Exploring in 10 Easy Lessons','Books');
insert into qsale values (1022,1,'How to Win Foreign Friends','Books');
insert into qsale values (1023,1,'Compass','Books');
insert into qsale values (1024,1,'Pith helmet','Books');
insert into qsale values (1025,1,'Elephant polo stick','Recreation');
insert into qsale values (1026,1,'Camel saddle','Recreation');
COMMIT;

create table qspl
(splno integer not null,
splname char(25),
constraint pk_qspl primary key (splno));

/* Insert values */
insert into qspl values (101,'Global Books and Maps');
insert into qspl values (102,'Nepalese Corp.');
insert into qspl values (103,'All Sports Manufacturing');
insert into qspl values (104,'Sweatshops Unlimited');
insert into qspl values (105,'All Points_ Inc.');
insert into qspl values (106,'Sao Paulo Manufacturing');
COMMIT;

create table qdel
(delno integer not null,
delqty integer not null,
itemname char(30) not null,
deptname char(15) not null,
splno integer not null,
constraint pk_qdel primary key (delno),
constraint fk_delitem foreign key (itemname) references qitem (itemname),
constraint fk_hasdept foreign key (deptname) references qdept (deptname),
constraint fk_hasspl foreign key (splno) references qspl (splno));

/* Insert values */
insert into qdel values (51,50,'Pocket knife - Nile','Navigation',105);
insert into qdel values (52,10,'Pocket knife - Nile','Books',105);
insert into qdel values (53,10,'Pocket knife - Nile','Clothes',105);
insert into qdel values (54,10,'Pocket knife - Nile','Equipment',105);
insert into qdel values (55,10,'Pocket knife - Nile','Furniture',105);
insert into qdel values (56,10,'Pocket knife - Nile','Recreation',105);
insert into qdel values (57,50,'Compass','Navigation',101);
insert into qdel values (58,10,'Geo positioning system','Navigation',101);
insert into qdel values (59,10,'Map measure','Navigation',101);
insert into qdel values (60,25,'Map case','Navigation',101);
insert into qdel values (61,2,'Sextant','Navigation',101);
insert into qdel values (62,1,'Sextant','Equipment',105);
insert into qdel values (63,20,'Compass','Equipment',103);
insert into qdel values (64,1,'Geo positioning system','Books',103);
insert into qdel values (65,15,'Map measure','Navigation',103);
insert into qdel values (66,1,'Sextant','Books',103);
insert into qdel values (67,5,'Sextant','Recreation',102);
insert into qdel values (68,3,'Sextant','Navigation',104);
insert into qdel values (69,5,'Boots - snakeproof','Clothes',105);
insert into qdel values (70,15,'Pith helmet','Clothes',105);
insert into qdel values (71,1,'Pith helmet','Clothes',101);
insert into qdel values (72,1,'Pith helmet','Clothes',102);
insert into qdel values (73,1,'Pith helmet','Clothes',103);
insert into qdel values (74,1,'Pith helmet','Clothes',104);
insert into qdel values (75,5,'Pith helmet','Navigation',105);
insert into qdel values (76,5,'Pith helmet','Books',105);
insert into qdel values (77,5,'Pith helmet','Equipment',105);
insert into qdel values (78,5,'Pith helmet','Furniture',105);
insert into qdel values (79,5,'Pith helmet','Recreation',105);
insert into qdel values (80,10,'Pocket knife - Nile','Navigation',102);
insert into qdel values (81,1,'Compass','Navigation',102);
insert into qdel values (82,1,'Geo positioning system','Navigation',102);
insert into qdel values (83,10,'Map measure','Navigation',102);
insert into qdel values (84,5,'Map case','Navigation',102);
insert into qdel values (85,5,'Compass','Books',102);
insert into qdel values (86,5,'Pocket knife - Avon','Recreation',102);
insert into qdel values (87,5,'Tent - 2 person','Recreation',102);
insert into qdel values (88,2,'Tent - 8 person','Recreation',102);
insert into qdel values (89,5,'Exploring in 10 Easy Lessons','Navigation',102);
insert into qdel values (90,5,'How to Win Foreign Friends','Navigation',102);
insert into qdel values (91,10,'Exploring in 10 Easy Lessons','Books',102);
insert into qdel values (92,10,'How to Win Foreign Friends','Books',102);
insert into qdel values (93,2,'Exploring in 10 Easy Lessons','Recreation',102);
insert into qdel values (94,2,'How to Win Foreign Friends','Recreation',102);
insert into qdel values (95,5,'Compass','Equipment',105);
insert into qdel values (96,2,'Boots - snakeproof','Equipment',105);
insert into qdel values (97,20,'Pith helmet','Equipment',106);
insert into qdel values (98,20,'Pocket knife - Nile','Equipment',106);
insert into qdel values (99,1,'Sextant','Equipment',106);
insert into qdel values (100,3,'Hat - polar explorer','Clothes',105);
insert into qdel values (101,3,'Stetson','Clothes',105);
COMMIT;


/*1.	Display all employee fnames in uppercase */
SELECT upper(EMPFNAME) 
from QEMP;

/*2.	Select all the item types in the qitem table (remove duplicates)*/
SELECT itemtype
from qitem
group by itemtype;

/*3.	Select the departments that sell Compasses and are not the navigation department*/
select deptname
from qdel
where ITEMNAME = 'Compass'
and DEPTNAME != 'Navigation';

/*4.	Find the average delivery quantity and round it to the nearest whole number*/
select round(avg(delqty))
from qdel;

/*5.	Select the empfname of all employees and print them out by department and within department by empfname*/
select empfname,deptname
from qemp
order by deptname, empfname;

/*6.	Select everything from the QDEL table*/
select *
from QDEL;

/*7.	Select delivery number, item name, and department name from the qdel table */
select delno,itemname,deptname
from qdel;

/*8.	Select all items with tent in the name */
select *
from qitem
where itemname LIKE '%Tent%';

/*9.	Select all departments on the 1, 2, and 4th floor*/
select *
from qdept
where deptfloor = 1 or deptfloor = 2 or deptfloor = 4;

/*10.	How many people are in each department? List the department name and the number.*/
select deptname,empno
from qdept;

/*11.	List out all departments with at least 2 employees.*/
select deptname
from qdept
where empno >= 2;
