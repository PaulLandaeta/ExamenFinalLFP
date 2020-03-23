-- Ejercicio 3 
-- Mostrar los email de los empleados sin asistencia. 

select *
from employee 
left join attendance on employee.username = attendance.empusername
where attendance.value is null