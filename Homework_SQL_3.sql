--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary
from ((employee_salary
inner join salary on employee_salary.salary_id=salary.id)
inner join employees on employee_salary.employee_id=employees.id);

--2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary
from ((employee_salary
inner join salary on employee_salary.salary_id=salary.id)
inner join employees on employee_salary.employee_id=employees.id)
where monthly_salary<2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, salary.monthly_salary
from employee_salary
full join salary on employee_salary.salary_id=salary.id
full join employees on employee_salary.employee_id=employees.id
where employee_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, salary.monthly_salary
from employee_salary
full join salary on employee_salary.salary_id=salary.id
full join employees on employee_salary.employee_id=employees.id
where employee_name is null 
and monthly_salary<2000;

--5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, employee_salary.salary_id
from employees
left join employee_salary on employee_salary.employee_id=employees.id
where salary_id is null;

--6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name, employee_id
from roles_employee
inner join employees on roles_employee.employee_id=employees.id
inner join roles on roles_employee.role_id=roles.id;

 --7. Вывести имена и должность только Java разработчиков.
 select employees.employee_name, roles.role_name
 from roles_employee
 inner join employees on roles_employee.employee_id=employees.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%Java developer';

 --8. Вывести имена и должность только Python разработчиков.
 select employees.employee_name, roles.role_name
 from roles_employee
 inner join employees on roles_employee.employee_id=employees.id 
 inner join roles on roles_employee.role_id=roles.id 
 where role_name like '%Python developer';

 --9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name
from roles_employee
inner join employees on roles_employee.employee_id=employees.id
inner join roles on roles_employee.role_id=roles.id 
where role_name like '%QA engineer'; 

--10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name 
from roles_employee
inner join employees on roles_employee.employee_id=employees.id
inner join roles on roles_employee.role_id=roles.id
where role_name like '%Manual QA engineer';

 --11. Вывести имена и должность автоматизаторов QA.
 select employees.employee_name, roles.role_name
 from roles_employee
 inner join employees on roles_employee.employee_id=employees.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%Automation QA engineer';

--(Выводит только 9 вместо 12чел.)--12. Вывести имена и зарплаты Junior специалистов.
select employees.employee_name, salary.monthly_salary, roles.role_name
from employee_salary
inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
inner join employees on employee_salary.employee_id=employees.id
inner join salary on employee_salary.salary_id=salary.id 
inner join roles on roles_employee.role_id=roles.id
where role_name like '%Junior%'
order by role_name;

 --(Выводит только 8 вместо 9чел)--13. Вывести имена и зарплаты Middle специалистов.
select employees.employee_name, salary.monthly_salary, roles.role_name
from employee_salary
inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
inner join employees on employee_salary.employee_id=employees.id
inner join salary on employee_salary.salary_id=salary.id 
inner join roles on roles_employee.role_id=roles.id
where role_name like '%Middle%'
order by role_name;

 --(Выводит только 7 вместо 11чел)--14. Вывести имена и зарплаты Senior специалистов.
select employees.employee_name, salary.monthly_salary, roles.role_name
from employee_salary
inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
inner join employees on employee_salary.employee_id=employees.id
inner join salary on employee_salary.salary_id=salary.id 
inner join roles on roles_employee.role_id=roles.id
where role_name like '%Senior%'
order by role_name;

 --(Выводит 4 вместо 5чел.)--15. Вывести зарплаты Java разработчиков.
 select employees.employee_name, salary.monthly_salary, roles.role_name
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where role_name like '%Java developer';

 --(Выводит 5 вместо 7чел.)--16. Вывести зарплаты Python разработчиков.
 select employees.employee_name, salary.monthly_salary, roles.role_name
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where role_name like '%Python developer';

 --17. Вывести имена и зарплаты Junior Python разработчиков.
 select employees.employee_name, salary.monthly_salary, roles.role_name
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where role_name like 'Junior Python developer';

 --18. Вывести имена и зарплаты Middle JS разработчиков.
 select employees.employee_name, salary.monthly_salary, roles.role_name
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where role_name like 'Middle JavaScript developer';

 --19. Вывести имена и зарплаты Senior Java разработчиков.
 select employees.employee_name, salary.monthly_salary, roles.role_name
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where role_name like 'Senior Java developer';

 --20. Вывести зарплаты Junior QA инженеров.
 select salary.monthly_salary, roles.role_name
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like 'Junior%QA engineer';

 --21. Вывести среднюю зарплату всех Junior специалистов.
 select avg(monthly_salary)
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%Junior%';
 
 --22. Вывести сумму зарплат JS разработчиков.
 select sum(monthly_salary)
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%JavaScript developer';

 --23. Вывести минимальную ЗП QA инженеров.
 select min(monthly_salary)
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%QA engineer';

 --24. Вывести максимальную ЗП QA инженеров.
 select max(monthly_salary)
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%QA engineer';

 --25. Вывести количество QA инженеров.
 select count(role_name)
 from roles_employee
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%QA engineer';

 --26. Вывести количество Middle специалистов.
 select count(role_name)
 from roles_employee
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%Middle';

 --27. Вывести количество разработчиков.
 select count(role_name)
 from roles_employee
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%developer';

 --28. Вывести фонд (сумму) зарплаты разработчиков.
 select sum(monthly_salary)
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 where role_name like '%developer';

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию.
 select employees.employee_name, roles.role_name, salary.monthly_salary
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 order by salary.monthly_salary;
 
 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300.
 select employees.employee_name, roles.role_name, salary.monthly_salary
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where monthly_salary between 1700 and 2300
 order by salary.monthly_salary;

 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300.
 select employees.employee_name, roles.role_name, salary.monthly_salary
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where monthly_salary<2300
 order by salary.monthly_salary;

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000.
 select employees.employee_name, roles.role_name, salary.monthly_salary
 from employee_salary
 inner join roles_employee on employee_salary.employee_id=roles_employee.employee_id
 inner join salary on employee_salary.salary_id=salary.id
 inner join roles on roles_employee.role_id=roles.id
 inner join employees on employee_salary.employee_id=employees.id
 where monthly_salary in (1100, 1500, 2000)
 order by salary.monthly_salary;