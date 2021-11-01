1)Создать таблицу employees и наполнить.
========================================================
create table employees (
  id serial primary key,
  employee_name varchar(50) not null
);

select * from employees;

insert into employees (id, employee_name)
values (default, 'Neville Longbottom_5');
========================================================
2) Создать таблицу salary и наполнить.
========================================================

create table salary (
 id serial primary key,
 monthly_salary int not null
);

insert into salary (id, monthly_salary)
values (default, 2500);


select * from salary;
========================================================
3)Создать таблицу employee_salary и наполнить.
========================================================

create table employee_salary (
 id serial primary key,
 employee_id int not null unique,
 salary_id int not null
);

insert into employee_salary (id, employee_id, salary_id)
values (default, 32, 11);

select * from employee_salary;
========================================================================================
4)Создать таблицу roles, поменять тип столба role_name с int на varchar(30) и наполнить.
========================================================================================

create table roles (
id serial primary key,
role_name int not null unique
);

alter table roles
alter column role_name type varchar(30)
using role_name::varchar(30);

insert into roles (id, role_name)
values (default, 'Senior Automation QA engineer');

select * from roles;
=====================================================================
5) Создать таблицу roles_employee, сделать внешние ключи и наполнить.
=====================================================================

create table roles_employee (
 id serial primary key,
 employee_id int not null,
 role_id int not null,
 foreign key (employee_id)
    references employees(id),
 foreign key (role_id)
    references roles(id)
);

insert into roles_employee (id, employee_id, role_id)
values (default, 14, 1);

select * from roles_employee;