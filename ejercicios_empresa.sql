CREATE SCHEMA `empresa` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `empresa`.`departamentos` (
  `codDepto` VARCHAR(4) NOT NULL,
  `nombreDpto` VARCHAR(20) NOT NULL,
  `ciudad` VARCHAR(15) not NULL,
  `codDirector` VARCHAR(12) not NULL,
  PRIMARY KEY (`codDepto`));
  
insert into departamentos values ('1000', 'GERENCIA', 'CALI', '31.840.269'),
('1500', 'PRODUCCIÓN', 'CALI', '16.211.383'),
('2000', 'VENTAS', 'CALI', '31.178.144'),
('3000', 'INVESTIGACIÓN', 'CALI', '16.759.060'),
('3500', 'MERCADEO', 'CALI', '22.222.222'),
('2100', 'VENTAS', 'POPAYAN', '31.751.219'),
('2200', 'VENTAS', 'BUGA', '768.782'),
('2300', 'VENTAS', 'CARTAGO', '737.689'),
('4000', 'MANTENIMIENTO', 'CALI', '333.333.333'),
('4100', 'MANTENIMIENTO', 'POPAYAN', '888.888'),
('4200', 'MANTENIMIENTO', 'BUGA', '11.111.111'),
('4300', 'MANTENIMIENTO', 'CARTAGO', '444.444');

CREATE TABLE `empresa`.`empleados` (
  `nDIEmp` VARCHAR(12) NOT NULL,
  `nomEmp` VARCHAR(30) NOT NULL,
  `sexEmp` CHAR(1) NOT NULL,
  `fecNac` DATE NOT NULL,
  `fecIncorporacion` DATE NOT NULL,
  `salEmp` FLOAT NOT NULL,
  `comisionE` FLOAT NOT NULL,
  `cargoE` VARCHAR(15) NOT NULL,
  `jefeID` VARCHAR(12),
  `codDepto` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`nDIEmp`));

insert into empleados values 
('31.840.269', 'María Rojas', 'F', '1959-01-15', '1990-05-16', 6250000, 1500000, 'Gerente', NULL, '1000'),
('16.211.383', 'Luis Pérez', 'M', '1956-02-25', '2000-01-01', 5050000, 0, 'Director', '31.840.269', '1500'),
('31.178.144', 'Rosa Angulo', 'F', '1957-03-15', '1998-08-16', 3250000, 3500000, 'Jefe Ventas', '31.840.269', '2000'),
('16.759.060', 'Darío Casas', 'M', '1960-04-05', '1992-11-01', 4500000, 500000, 'Investigador', '31.840.269', '3000'),
('22.222.222', 'Carla López', 'F', '1975-05-11', '2005-07-16', 4500000, 500000, 'Jefe Mercadeo', '31.840.269', '3500'),
('22.222.333', 'Carlos Rozo', 'M', '1975-05-11', '2001-09-16', 750000, 500000, 'Vigilante', '31.840.269', '3500') ,
('1.751.219', 'Melissa Roa', 'F', '1960-06-19', '2001-03-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2100'),
('768.782', 'Joaquín Rosas', 'M', '1947-07-07', '1990-05-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2200'),
('737.689', 'Mario Llano', 'M', '1945-08-30', '1990-05-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2300'),
('333.333.333', 'Elisa Rojas', 'F', '1979-09-28', '2004-06-01', 3000000, 1000000, 'Jefe Mecánicos', '31.840.269', '4000'),
('888.888', 'Iván Duarte', 'M', '1955-08-12', '1998-05-16', 1050000, 200000, 'Mecánico', '333.333.333', '4100'),
('11.111.111', 'Irene Díaz', 'F', '1979-09-28', '2004-06-01', 1050000, 200000, 'Mecánico', '333.333.333', '4200'),
('444.444', 'Abel Gómez', 'M', '1939-12-24', '2000-10-01', 1050000, 200000, 'Mecánico', '333.333.333', '4300'),
('1.130.222', 'José Giraldo', 'M', '1985-01-20', '2000-11-01', 1200000, 400000, 'Asesor', '22.222.222', '3500'),
('19.709.802', 'William Daza', 'M', '1982-10-09', '1999-12-16', 2250000, 1000000,'Investigador', '16.759.060', '3000'),
('31.174.099', 'Diana Solarte', 'F', '1957-11-19', '1990-05-16', 1250000, 500000, 'Secretaria', '31.840.269', '1000'),
('1.130.777', 'Marcos Cortez', 'M', '1986-06-23', '2000-04-16', 2550000, 500000, 'Mecánico', '333.333.333', '4000'),
('1.130.782', 'Antonio Gil', 'M', '1980-01-23', '2010-04-16', 850000, 1500000, 'Técnico', '16.211.383', '1500'),
('333.333.334', 'Marisol Pulido', 'F', '1979-10-01', '1990-05-16', 3250000, 1000000, 'Investigador', '16.759.060', '3000'),
('333.333.335', 'Ana Moreno', 'F', '1992-01-05', '2004-06-01', 1200000, 400000, 'Secretaria', '16.759.060', '3000'),
('1.130.333', 'Pedro Blanco', 'M', '1987-10-28', '2000-10-01', 800000, 3000000, 'Vendedor', '31.178.144', '2000'),
('1.130.444', 'Jesús Alfonso', 'M', '1988-03-14', '2000-10-01', 800000, 3500000, 'Vendedor', '31.178.144', '2000'),
('333.333.336', 'Carolina Ríos', 'F', '1992-02-15', '2000-10-01', 1250000, 500000, 'Secretaria', '16.211.383', '1500'),
('333.333.337', 'Edith Muñoz', 'F', '1992-03-31', '2000-10-01', 800000, 3600000, 'Vendedor', '31.178.144', '2100'),
('1.130.555', 'Julián Mora', 'M', '1989-07-03', '2000-10-01', 800000, 3100000, 'Vendedor', '31.178.144', '2200'),
('1.130.666', 'Manuel Millán', 'M', '1990-12-08', '2004-06-01', 800000, 3700000, 'Vendedor', '31.178.144', '2300');
  
ALTER TABLE `empresa`.`empleados` 
ADD INDEX `empleado_empleado_idx` (`jefeID` ASC) VISIBLE,
ADD INDEX `empleado_departamento_idx` (`codDepto` ASC) VISIBLE;
;
ALTER TABLE `empresa`.`empleados` 
ADD CONSTRAINT `empleado_empleado`
  FOREIGN KEY (`jefeID`)
  REFERENCES `empresa`.`empleados` (`nDIEmp`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `empleado_departamento`
  FOREIGN KEY (`codDepto`)
  REFERENCES `empresa`.`departamentos` (`codDepto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- 1 Obtener los datos completos de los empleados
select *
from empleados;

-- 2 Obtener los datos completos de los departamentso
select *
from departamentos;

-- 3 obtener los datos de los empleados con cargo 'Secretaria'
select *
from empleados
where cargoE = 'Secretaria';

-- 4 Obtener el nombre y salario de los empleados
select nomEmp as nombre, salEmp as salario
from empleados;

-- 5 Obtener los datos de los empleados vendedores, ordenado por nombre
select *
from empleados
where cargoE = 'Vendedor'
order by nomEmp asc;

-- 6 Listar el nombre de los departamentos
select distinct nombreDpto
from departamentos;

-- 7 Listar el nombre de los departamentos ordenado por nombre
select distinct nombreDpto
from departamentos
order by nombreDpto asc;

-- 8 Listar el nombre de los departamentos ordenado por ciudad
select distinct nombreDpto, ciudad
from departamentos
order by ciudad asc;

-- 9 Listar el nombre de los departamentos ordenado por ciudad en orden inverso
select distinct nombreDpto, ciudad
from departamentos
order by ciudad desc;

-- 10 Obtener el nombre y cargo de todos los empleados, ordenado por salario
select nomEmp, cargoE
from empleados
order by salEmp asc;

-- 11 Obtener el nombre y cargo de todos los empleados, ordenado por cargo y por salario
select nomEmp, cargoE, salEmp
from empleados
order by cargoE asc, salEmp asc;

-- 12 Obtener el nombre y cargo de todos los empleados, en orden inverso por cargo
select nomEmp, cargoE
from empleados
order by cargoE desc;

-- 13 Listar los salarios y comisiones de los empleados del departamento 2000
-- manera 1
select salEmp, comisionE
from empleados as e
inner join departamentos as d on e.codDepto = d.codDepto
where d.codDepto = 2000;

-- manera 2
select salEmp, comisionE
from empleados as e, departamentos as d
where e.codDepto = d.codDepto and d.codDepto = 2000;

-- 14 Listar los salarios y comisiones de los empleados del departamento 
-- 2000, ordenado por comisión
select nomEmp, salEmp, comisionE
from empleados as e, departamentos as d
where e.codDepto = d.codDepto and d.codDepto = 2000
order by comisionE asc;

-- 15 Listar todas las comisiones
select comisionE
from empleados;

-- 16 Listar las comisiones que sean diferentes, ordenada por valor
select distinct comisionE
from empleados
order by comisionE asc;

-- 17 Listar los diferentes salarios
select distinct salEmp
from empleados;

-- 18 Obtener el valor total a pagar que resulta de sumar a los empleados del 
-- departamento 3000 una bonificación de $500.000, en orden alfabético del empleado
select nomEmp, salEmp, comisionE, (salEmp + comisionE + 500000) as valor_total
from empleados as e, departamentos as d
where e.codDepto = d.codDepto and d.codDepto = 3000
order by nomEmp asc;

-- 19 Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
select *
from empleados
where salEmp < comisionE;

-- 20 Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo
select *
from empleados
where salEmp*0.3 >= comisionE;

-- 21 Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ 
-- antes del valor respectivo para cada empleado
select 'Nombre' ,nomEmp, 'Cargo', cargoE
from empleados;

-- 22 Hallar el salario y la comisión de aquellos empleados cuyo número 
-- de documento de identidad es superior al '19.709.802'
select nDIEmp, salEmp, comisionE
from empleados
where nDIEmp > '19.709.802';

-- 23 Listar los empleados cuyo salario es menor o igual que el 40% de su comisión
select *
from empleados
where salEmp <= comisionE*0.4;

-- 24 Divida los empleados, generando un grupo cuyo nombre 
-- inicie por la letra J y termine en la letra Z.
-- Liste estos empleados y su cargo por orden alfabético ???
select *
from empleados
where nomEmp like 'J%' and nomEmp like '%z'
order by nomEmp;

-- 25 Listar el salario, la comisión, el salario total (salario + comisión), 
-- documento de identidad del empleado y nombre, de aquellos empleados que 
-- tienen comisión superior a $1.000.000, ordenar el informe por el número 
-- del documento de identidad 
select salEmp, comisionE, (salEmp + comisionE) as `salario total`, nDIEmp, nomEmp
from empleados
where comisionE > 1000000
order by nDIEmp asc;

-- 26 Obtener un listado similar al anterior, pero de aquellos empleados que NO 
-- tienen comisión
select salEmp, comisionE, (salEmp + comisionE) as `salario total`, nDIEmp, nomEmp
from empleados
where comisionE = 0
order by nDIEmp asc;

-- 27 Hallar el nombre de los empleados que tienen un salario superior a 
-- $1.000.000, y tienen como jefe al empleado con documento de identidad 
-- '31.840.269'
select nomEmp, salEmp, jefeID
from empleados
where salEmp > 1000000 and jefeID = '31.840.269';

-- 28 Hallar el conjunto complementario del resultado del ejercicio 
-- anterior.
select nomEmp, salEmp, jefeID
from empleados
where nDIEmp not in (select nDIEmp
from empleados
where salEmp > 1000000 and jefeID = '31.840.269');

-- 29 Hallar los empleados cuyo nombre no contiene la cadena “MA”
select nomEmp
from empleados
where nomEmp like '%ma%';

-- 30 Obtener los nombres de los departamentos que no sean “Ventas” 
-- ni “Investigación” NI ‘MANTENIMIENTO’, ordenados por ciudad.
select nombreDpto, ciudad
from departamentos
where nombreDpto not in ('Investigacion', 'Ventas', 'Mantenimiento')
order by ciudad;

-- 31 Obtener el nombre y el departamento de los empleados con cargo 
-- 'Secretaria' o 'Vendedor', que no trabajan en el departamento de 
-- “PRODUCCION”, cuyo salario es superior a $1.000.000, ordenados por 
-- fecha de incorporación
select e.nomEmp, e.cargoE, d.nombreDpto
from empleados as e
inner join departamentos as d on e.codDepto = d.codDepto 
where e.cargoE not in ('Secretaria', 'Vendedor') 
and d.nombreDpto not in ('PRODUCCIÓN')
and e.salEmp > 1000000
order by e.fecIncorporacion;

-- 32 Obtener información de los empleados cuyo nombre tiene 
-- exactamente 11 caracteres
-- manera 1
select *, length(nomEmp) as `longitud nombre`
from empleados
where length(nomEmp) = 11;

-- manera 2
select *, length(nomEmp) as `longitud nombre`
from empleados
having `longitud nombre` = 11;

-- 33 Obtener información de los empleados cuyo nombre tiene al 
-- menos 11 caracteres
-- manera 1
select *, length(nomEmp) as `longitud nombre`
from empleados
where length(nomEmp) >= 11;

-- manera 2
select *, length(nomEmp) as `longitud nombre`
from empleados
having `longitud nombre` >= 11;

-- 34 Listar los datos de los empleados cuyo nombre inicia por 
-- la letra 'M', su salario es mayor a $800.000
-- o reciben comisión y trabajan para el departamento de 'VENTAS'
select e.*, d.nombreDpto
from empleados as e
inner join departamentos as d on e.codDepto = d.codDepto
where nomEmp like 'M%' and (salEmp > 800000 or comisionE > 0) and nombreDpto = 'VENTAS';

-- 35 Obtener los nombres, salarios y comisiones de los empleados que 
-- reciben un salario situado entre la mitad de la comisión la propia comisión
select nomEmp, salEmp, comisionE
from empleados
where salEmp between comisionE/2 and comisionE;

-- 36 Suponga que la empresa va a aplicar un reajuste salarial del 7%. 
-- Listar los nombres de los empleados, su salario actual y su nuevo salario, 
-- indicando para cada uno de ellos si tiene o no comisión
select nomEmp as `Nombre empleado`, salEmp as `Salario actual`, 
salEmp*1.07 as `Salario nuevo`, if(comisionE > 0, 'SI', 'NO') as `Tiene comision`
from empleados;

-- 37 Obtener la información disponible del empleado cuyo número de documento de 
-- identidad sea: '31.178.144', '16.759.060', '1.751.219', '768.782', '737.689', 
-- '19.709.802', '31.174.099', '1.130.782'
select *
from empleados
where nDIEmp in ('31.178.144', '16.759.060', '1.751.219', '768.782', '737.689', 
'19.709.802', '31.174.099', '1.130.782'
);

-- 38 Entregar un listado de todos los empleados ordenado 
-- por su departamento, y alfabético dentro del departamento.
select e.*, d.nombreDpto
from empleados as e, departamentos as d
where e.codDepto = d.codDepto
order by d.codDepto asc, nombreDpto asc;

-- 39 Entregar el salario más alto de la empresa
select *
from empleados
where salEmp = (select max(salEmp) from empleados); 

-- 40 Entregar el total a pagar por comisiones, y el número de empleados 
-- que las reciben
select sum(comisionE) as `Total comisiones`, 
count(*) as `Personas que la reciben`
from empleados
where comisionE > 0;

-- 41 Entregar el nombre del último empleado de la lista 
-- por orden alfabético.
select max(nomEmp)
from empleados
order by nomEmp;

-- 42 Hallar el salario más alto, el más bajo y la diferencia entre ellos.
select max(salEmp) as `Salario más alto`, min(salEmp) as `Salario más bajo`,
max(salEmp) - min(salEmp) as `Diferencia salarial`
from empleados;

-- Conocido el resultado anterior, entregar el nombre de los empleados
-- que reciben el salario más alto y más bajo. Cuanto suman estos salarios?
select group_concat(nomEmp) as Nombres, max(salEmp) as `Salario máximo`, 
min(salEmp) as `Salario mínimo`, sum(salEmp) `Suma salarios`
from empleados
where salEmp in (select max(salEmp) from empleados) or 
salEmp in (select min(salEmp) from empleados);

-- 44 Entregar el número de empleados de sexo femenino y de sexo masculino, 
-- por departamento
select codDepto, sexEmp, count(*) as `Cantidad de personas por género`
from empleados
group by codDepto, sexEmp
order by codDepto asc;

-- 45 Hallar el salario promedio por departamento
select codDepto, avg(salEmp) as `Salario promedio`
from empleados
group by codDepto;

-- 46 Hallar el salario promedio por departamento, considerando aquellos 
-- empleados cuyo salario supera $900.000, y aquellos con salarios 
-- inferiores a $575.000. Entregar el código y el nombre del departamento

select e.codDepto, d.nombreDpto, avg(salEmp) as `Salario promedio`
from empleados as e
inner join departamentos as d on e.codDepto = d.codDepto
where salEmp > 900000 or salEmp < 575000
group by d.nombreDpto
order by d.codDepto;

-- 47 Entregar la lista de los empleados cuyo salario es mayor o igual 
-- que el promedio de la empresa. Ordenarlo por departamento.
select nomEmp, salEmp
from empleados
where salEmp >= (select avg(salEmp) from empleados)
order by codDepto; 

-- 48 Hallar los departamentos que tienen más de tres (3) empleados. 
-- Entregar el número de empleados de esos departamentos.
select d.codDepto, d.nombreDpto, count(*) as `Cantidad empleados`
from departamentos as d
inner join empleados as e on d.codDepto = e.codDepto
group by d.codDepto
having `Cantidad empleados` > 3;

-- 49 Obtener la lista de empleados jefes, que tienen al menos un empleado a su cargo. 
-- Ordene el informe inversamente por el nombre.
-- manera 1
select *
from empleados
where nDIEmp in (select distinct jefeID as nDIEmp from empleados )
order by nomEmp;
