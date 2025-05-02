create database db;
use db;
create table employee ( emp_id int primary key, name varchar(50));

insert into employee (emp_id,name) values (1,"Ann");
select * from employee;
select * from employee where name= "ann";
update employee set name="Arun" where emp_id=1;
insert into employee (emp_id,name) values (2,"Neha"),(3,"Sooraj"),(4,"Kishore");
select * from employee ;
delete from employee where emp_id=2;
alter table employee add email varchar(255);


create table manager(manager_id int primary key,name varchar(50), dpt_name varchar(50));
insert into manager(manager_id,name,dpt_name) values (4,"Kishore","sales"),(1000,"Asok","sales"),(500,"hari","marketing");
select emp_id,name,email,dpt_name from employee inner join manager on employee.id=manager.id;
select * from employee  join manager on employee.emp_id=manager.manager_id;
drop table manager;

drop table employee;
create table manager(manager_id int primary key,manager_name varchar(50),dpt varchar(50));
create table employee(emp_id int primary key,emp_name varchar(50),salary decimal(10,2),
manager_id int, foreign key(manager_id) references manager(manager_id));
-- CRUD OPERATIONS--
insert into manager(manager_id,manager_name,dpt) 
values(1,"Ann","IT"),(2,"John","Hr"),(3,"Sam","Finance");
insert into employee(emp_id,emp_name,salary,manager_id) 
values(101,"Anna",50000,1),(102,"Emma",60000,2),(103,"Sam",55000,3);
select*from employee;
select*from manager;
update employee set salary=52000 where emp_id=101;
delete from employee where emp_id=3;
-- Join--
select employee.emp_id,employee.emp_name,employee.salary,manager.manager_name,manager.dpt
from employee inner join manager on employee.manager_id=manager.manager_id;
select employee.emp_id,employee.emp_name,employee.salary,manager.manager_name,manager.dpt
from employee left join manager on employee.manager_id=manager.manager_id;
select employee.emp_id,employee.emp_name,employee.salary,manager.manager_name,manager.dpt
from employee right join manager on employee.manager_id=manager.manager_id;
select employee.emp_id,employee.emp_name,manager.dpt
from employee full join manager on employee.manager_id=manager.manager_id;

select MIN(salary)from employee;
select * from employee where emp_name like 'a%';
select emp_name , salary from employee limit 3;
select emp_name from employee order by emp_name desc;
desc employee;
select manager_name from manager where dpt in ("IT","HR"); 
select emp_name,salary  from employee where salary between 50000 and 55000;
select salary AS s from employee;
-- select  from employee AS emp;--
select emp_name from employee union select manager_name from manager;
select dpt,count(*) as dpt_count
from manager 
group by dpt
having count(*) > 0;

select emp_name,emp_id from employee where exists(select dpt from MANAGER
 where dpt="HR");
 
 select max(salary)
 from employee
 where salary<(select max(salary) from employee);
 
 select salary from employee
 order by salary desc 
limit 1 offset 1;


create database db1;
use db1;
create table customer (cus_id int primary key, cus_name varchar(50),email varchar(50),phone varchar(20));
create table orders (order_id int primary key, order_date date, total_amnt decimal (10,2),
cus_id int,foreign key(cus_id) references customer(cus_id));

 insert into customer (cus_id,cus_name,email,phone) values(1,"Alice","alice@gmail.com",1234567),
 (2,"Bincy","bincy@gmail.com",4567789),(3,"charlie","charlie@gmail.com",45678992);
 
insert into orders (order_id,order_date,cus_id,total_amnt) values(101,"2025-02-25",1,250.50),
(102,"2025-03-15",2,100.00),(103,"2025-02-17",3,75.00);


-- Display customer name along with order details--
select c.cus_name,o.order_id,o.order_date,o.total_amnt from customer
c join orders o on c.cus_id=o.cus_id;

-- list all customers having total amnt >=100
select c.cus_id,c.cus_name,o.total_amnt from customer c
join orders o on c.cus_id=o.cus_id
where o.total_amnt>=100;

-- Name start with "c" and the second letter should be l
 select cus_name from customer where cus_name like "c%";
select cus_name from customer where cus_name like "_l%";
 
-- Find count of all the customer and avg of their total amnt spend
select count(c.cus_id),avg(o.total_amnt)
from customer c join orders o on c.cus_id=o.cus_id;

-- show cus name nd total amnt spend, ordered by total amnt (highest fst)
select c.cus_name,o.total_amnt from customer c join orders o 
on c.cus_id=o.cus_id 
group by c.cus_name 
order by total_amnt desc;



 

 