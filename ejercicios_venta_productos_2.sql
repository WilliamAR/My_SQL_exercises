CREATE TABLE CLIENTE(
id_cliente INT(10) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCTO(
id_producto INT(10) PRIMARY KEY,
descripcion VARCHAR(200) NOT NULL,
precio INT(10) NOT NULL
);

CREATE TABLE `ventas`.`venta` (
  `id_venta` INT(10) NOT NULL,
  `cantidad` INT(10) NOT NULL,
  `id_cliente` INT(10) NOT NULL,
  `id_producto` INT(10) NOT NULL,
  PRIMARY KEY (`id_venta`));

ALTER TABLE `ventas`.`venta` 
ADD INDEX `venta_cliente_idx` (`id_cliente` ASC) VISIBLE,
ADD INDEX `venta_producto_idx` (`id_producto` ASC) VISIBLE;
;
ALTER TABLE `ventas`.`venta` 
ADD CONSTRAINT `venta_cliente`
  FOREIGN KEY (`id_cliente`)
  REFERENCES `ventas`.`cliente` (`id_cliente`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `venta_producto`
  FOREIGN KEY (`id_producto`)
  REFERENCES `ventas`.`producto` (`id_producto`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

INSERT INTO CLIENTE VALUES(123,'Simon Bolivar', 'Kra11#9-56', '7702291', 'Cali');
INSERT INTO CLIENTE VALUES(456,'Mark Zuckerberg', 'Cll 21#95-52', '+57-315291', 'Medellin');
INSERT INTO CLIENTE VALUES(789,'Drew Barrymore', 'Kra52#65-05', '3125359456', 'Cali');
INSERT INTO CLIENTE VALUES(741,'Larry Page', 'Cll 05#52-95', '7872296', 'Tunja');
INSERT INTO CLIENTE VALUES(147,'Tom Delonge', 'Cll 52#65-56', '7992293', 'Medellin');
INSERT INTO CLIENTE VALUES(852,'Simon Bolivar', 'Kra 21#65-52', '982295', 'Bogota');
INSERT INTO CLIENTE VALUES(258,'Mark Hoppus', 'Cll 11#95-9', '8952294', 'Bogota');
INSERT INTO CLIENTE VALUES(963,'Britney Spears', 'Cll 05#52-56', '7705295', 'Tunja');
INSERT INTO CLIENTE VALUES(369,'John Forbes Nash', 'Kra 21#05-56', '776622966', 'Cali');
INSERT INTO CLIENTE VALUES(159,'Tom Delonge', 'Kra05#65-05', '6702293','Medellin');
INSERT INTO CLIENTE VALUES(753,'Sergey Brin', 'Cll 11#65-11', '9702299', 'Medellin');
INSERT INTO CLIENTE VALUES(153,'Emma Watson', 'Kra 9#9-95', '31569638', 'Tunja');
INSERT INTO PRODUCTO VALUES(1,'Coca-Cola 2L',2400);
INSERT INTO PRODUCTO VALUES(2,'Doritos',1000);
INSERT INTO PRODUCTO VALUES(3,'Salchicha',3600);
INSERT INTO PRODUCTO VALUES(4,'Pan',500);
INSERT INTO PRODUCTO VALUES(5,'Queso',1000);
INSERT INTO PRODUCTO VALUES(6,'Sandia',8000);
INSERT INTO PRODUCTO VALUES(7,'Leche 1L',4563);
INSERT INTO PRODUCTO VALUES(8,'Atun',1800);
INSERT INTO PRODUCTO VALUES(9,'Pescado',7856);
INSERT INTO PRODUCTO VALUES(10,'Cicla Estatica',1800);
INSERT INTO PRODUCTO VALUES(11,'Camiseta',12000);
INSERT INTO PRODUCTO VALUES(12,'Blue-Jean',7800);
INSERT INTO PRODUCTO VALUES(13,'Papaya',1400);
INSERT INTO PRODUCTO VALUES(14,'Agua en Bolsa',1800);
INSERT INTO PRODUCTO VALUES(15,'Red Bull',1200);
INSERT INTO VENTA VALUES(1,5,123,1);
INSERT INTO VENTA VALUES(2,6,123,2);
INSERT INTO VENTA VALUES(3,7,123,3);
INSERT INTO VENTA VALUES(4,8,123,4);
INSERT INTO VENTA VALUES(5,2,456,5);
INSERT INTO VENTA VALUES(6,4,741,6);
INSERT INTO VENTA VALUES(7,5,456,7);
INSERT INTO VENTA VALUES(8,600,741,8);
INSERT INTO VENTA VALUES(9,69,852,9);
INSERT INTO VENTA VALUES(10,15,789,10);
INSERT INTO VENTA VALUES(11,11,456,5);
INSERT INTO VENTA VALUES(12,22,789,6);
INSERT INTO VENTA VALUES(13,11,753,7);
INSERT INTO VENTA VALUES(14,10,963,12);
INSERT INTO VENTA VALUES(15,65,963,11);
INSERT INTO VENTA VALUES(16,12,852,10);
INSERT INTO VENTA VALUES(17,65,741,9);
INSERT INTO VENTA VALUES(18,78,147,8);
INSERT INTO VENTA VALUES(19,92,258,9);
INSERT INTO VENTA VALUES(20,12,258,6);
INSERT INTO VENTA VALUES(21,32,147,3);
INSERT INTO VENTA VALUES(22,3,789,1);
INSERT INTO VENTA VALUES(23,45,456,2);
INSERT INTO VENTA VALUES(24,5,123,3);
INSERT INTO VENTA VALUES(25,5,789,4);
INSERT INTO VENTA VALUES(26,6,456,1);
INSERT INTO VENTA VALUES(27,4,123,2);
INSERT INTO VENTA VALUES(28,7,789,12);
INSERT INTO VENTA VALUES(29,8,258,13);
INSERT INTO VENTA VALUES(30,9,852,14);
INSERT INTO VENTA VALUES(31,9,753,15);
INSERT INTO VENTA VALUES(32,6,753,10);
INSERT INTO VENTA VALUES(33,7,159,9);
INSERT INTO VENTA VALUES(34,8,963,10);
INSERT INTO VENTA VALUES(35,9,369,8);
INSERT INTO VENTA VALUES(36,15,369,7);
INSERT INTO VENTA VALUES(37,5,123,5);
INSERT INTO VENTA VALUES(38,6,123,6);
INSERT INTO VENTA VALUES(39,7,123,7);
INSERT INTO VENTA VALUES(40,8,123,8);
INSERT INTO VENTA VALUES(41,5,123,9);
INSERT INTO VENTA VALUES(42,6,123,10);
INSERT INTO VENTA VALUES(43,7,123,11);
INSERT INTO VENTA VALUES(44,8,123,12);
INSERT INTO VENTA VALUES(45,5,123,13);
INSERT INTO VENTA VALUES(46,6,123,14);
INSERT INTO VENTA VALUES(47,7,123,15);

-- ID de los clientes de cali
select id_cliente
from cliente
where ciudad = 'Cali';

-- ID y la descripción de los productos que cuesten menos de $1500 pesos
select id_producto, descripcion
from producto
where precio < 1500;

-- ID y nombre de los clientes, cantidad de venta y la descripción del producto, en las ventas en las cuales se vendieron más de 10 unidades
select c.id_cliente, c.nombre, v.cantidad, p.descripcion
from cliente as c, venta as v, producto as p
where c.id_cliente = v.id_cliente and v.id_producto = p.id_producto;

-- ID y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no han comprado productos)
select c.id_cliente, nombre
from cliente as c
left join venta as v on c.id_cliente = v.id_cliente
where v.id_cliente is null;

-- ID y nombre de los clientes que han comprado todos los productos de la empresa
-- manera 1
select id_cliente, nombre
from cliente
where not exists (
select *
from producto
where not exists (
select *
from venta
where cliente.id_cliente = venta.id_cliente and venta.id_producto = producto.id_producto
)
);

-- ID, nombre de cada cliente de la empresa y la suma total (suma de cantidad) de los productos que ha comprado
select c.id_cliente, nombre, count(*) as cant_compras
from cliente as c
inner join venta as v on c.id_cliente = v.id_cliente
group by v.id_cliente;

-- ID de los productos que no han sido comprados por clientes de Tunja
select id_producto
from producto
where id_producto not in (
select id_producto
from venta
where id_cliente in (
select id_cliente
from cliente
where ciudad = 'Tunja') );

-- ID de los productos que se han vendido a clientes de Medellín y que también se han vendido a clientes de Bogotá !!!
select p.id_producto
from producto as p
inner join venta as v on p.id_producto = v.id_producto
inner join cliente as c on v.id_cliente = c.id_cliente
group by p.id_producto
having group_concat(c.ciudad) like '%Medellin%' and group_concat(c.ciudad) like '%Bogota%';

-- Nombre de las ciudades en las que se ha vendido todos los productos !!!
select cliente.ciudad
from cliente
inner join venta on cliente.id_cliente = venta.id_cliente
inner join producto on venta.id_producto = producto.id_producto
group by ciudad
having count(distinct venta.id_producto) = (select count(*) from producto);