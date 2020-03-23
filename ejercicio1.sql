-- Ejercicio 1 
-- Mostrar el nombre del cliente con ordenes en status done 

select distinct name
from clients
inner join orders on clients.username = orders.clientusername and orders.status = 'Done'   
