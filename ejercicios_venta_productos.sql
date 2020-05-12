CREATE TABLE s( 
 sn VARCHAR(2) PRIMARY KEY, 
 snombre VARCHAR (10) NOT NULL,
 situacion INT(4) NOT NULL,
 ciudad VARCHAR (10) NOT NULL
);

INSERT INTO s VALUES ('S1','Salazar',20,'Londres');
INSERT INTO s VALUES ('S2','Jaramillo',10,'París');
INSERT INTO s VALUES ('S3','Bernal',30,'París');
INSERT INTO s VALUES ('S4','Caicedo',20,'Londres');
INSERT INTO s VALUES ('S5','Aldana',30,'Atenas');

CREATE TABLE p( 
 pn VARCHAR (2) PRIMARY KEY, 
 pnombre VARCHAR (15) NOT NULL,
 color VARCHAR (15),
 peso INT(4) NOT NULL CHECK (peso >= 0), 
 ciudad VARCHAR (15) NOT NULL
);

INSERT INTO p VALUES ('P1','Tuerca','Rojo',12,'Londres');
INSERT INTO p VALUES ('P2','Perno','Verde',17,'París');
INSERT INTO p VALUES ('P3','Tornillo','Azul',17,'Roma');
INSERT INTO p VALUES ('P4','Tornillo','Rojo',14,'Londres');
INSERT INTO p VALUES ('P5','Leva','Azul',12,'París');
INSERT INTO p VALUES ('P6','Rueda','Rojo',19,'Londres');

CREATE TABLE sp(
 sn VARCHAR (2) REFERENCES s, 
 pn VARCHAR (2) REFERENCES p, 
 cantidad INT(4) NOT NULL CHECK (cantidad > 0),
 PRIMARY KEY (sn,pn)
);

INSERT INTO sp VALUES ('S1','P1',300);
INSERT INTO sp VALUES ('S1','P2',200);
INSERT INTO sp VALUES ('S1','P3',400);
INSERT INTO sp VALUES ('S1','P4',200);
INSERT INTO sp VALUES ('S1','P5',100);
INSERT INTO sp VALUES ('S1','P6',100);
INSERT INTO sp VALUES ('S2','P1',300);
INSERT INTO sp VALUES ('S2','P2',400);
INSERT INTO sp VALUES ('S3','P3',200);
INSERT INTO sp VALUES ('S4','P2',200);
INSERT INTO sp VALUES ('S4','P4',300);
INSERT INTO sp VALUES ('S4','P5',400);


-- proveedores s
-- producto p
-- obtener todos los datos de los proveedores de paris que tengan una situacion mayor a 10
select *
from s
where ciudad = 'París' and situacion > 10;

-- Obtener solo los códigos de los proveedores de Londres
select sn
from s
where ciudad = 'Londres';

-- Obtener todos los datos de los productos que no tienen color asignado
select *
from p
where color is null;

-- Imprimir todos los datos de los proveedores que suministran el producto P2
-- manera 1
select s.*
from s
inner join sp on s.sn = sp.sn_id
inner join p on sp.pn_id = p.pn
where p.pn = 'P2';

-- manera 2
select s.*
from sp, s
where sp.sn_id = s.sn and sp.pn_id = 'P2';

-- manera 3
select *
from s
where exists (
select *
from sp
where sp.sn_id = s.sn and sp.pn_id = 'P2'
);

-- manera 4
select *
from s
where sn in (
select sn_id
from sp
where pn_id = 'P2'
);

-- Imprimir todos los datos de los proveedores que no suministran el producto P2 !!!!!!
-- manera 1
select *
from s
where not exists (
select *
from sp
where sp.sn_id = s.sn and sp.pn_id = 'P2'
);

-- manera 2
select *
from s
where sn not in (
select sn_id
from sp
where pn_id = 'P2'
);

-- obtener todos los datos de los proveedores que suministran todos los productos !!!
-- manera 1
select *
from s
where not exists (
select *
from p
where not exists (
select *
from sp
where sp.pn_id = p.pn and  sp.sn_id = s.sn
)
);

-- manera 2
select *
from s
where ( select count(*)
from sp
where s.sn = sp.sn_id ) = (select count(*) from p);

-- manera 3
select * 
from s 
where sn in ( select sn_id 
from sp 
group by sn_id 
having count(*) = (select count(*) from p) 
);

-- Obtener los nombres de los proveedores que suministran por lo menos un producto rojo
-- manera 1
select snombre
from s
where sn in (
select sn_id
from sp
where pn_id in (
select pn
from p
where color = 'Rojo') );

-- manera 2
select distinct snombre
from s, sp, p 
where s.sn = sp.sn_id and sp.pn_id = p.pn and p.color = 'Rojo';

-- manera 3
select distinct snombre
from s
inner join sp on s.sn = sp.sn_id
inner join p on sp.pn_id = p.pn where p.color = 'Rojo';

-- imprimir los codigos de las parejas de proveedores que están situados en la misma ciudad
select group_concat(sn) as cod_prov_ciudad, ciudad
from s
group by ciudad;

-- !!!!
select s1.sn, s2.sn
from s as s1, s as s2
where s1.ciudad = s2.ciudad and s1.sn < s2.sn; 

-- obtener el código y el número de productos que suministra cada proveedor
select sp.pn_id, sp.cantidad, s.snombre
from sp
inner join s on s.sn = sp.sn_id;

select sn_id, count(*)
from sp
group by sn_id;

-- La misma consulta anterior pero solo para aquellos proveedores con más de dos productos. Imprimir en orden de conteo
select sn_id, count(*) as cant_prod
from sp
group by sn_id
having cant_prod > 2
order by cant_prod desc;

select sn_id, count(*) as conteo
from sp
group by sn_id
having count(*) > 2
order by 2;

-- Obtener los códigos de los proveedores que están ubicados en Londres o que suministran el producto P2
-- manera 1 
select distinct sn
from s
inner join sp on s.sn = sp.sn_id
where s.ciudad = 'Londres' or sp.pn_id = 'P2';

-- manera 2
select sn
from s
where ciudad = 'Londres'
union
select sn_id
from sp
where pn_id = 'P2';

-- Obtener los códigos de los proveedores que son de Londres pero que NO suministran el producto P2
select sn
from s
where ciudad = 'Londres' and sn
not in (
select sn_id
from sp
where pn_id = 'P2');

-- Obtener los códigos de los proveedores que son de Londres y que suministran también el producto P2
select sn
from s
where ciudad = 'Londres' and sn
in (
select distinct sn_id
from sp
where pn_id = 'P2'
);

-- Imprimir el nombre de cada proveedor y el nombre de cada producto que suministra
-- manera 1
select s.snombre, p.pnombre
from s
inner join sp on s.sn = sp.sn_id
inner join p on sp.pn_id = p.pn;

-- manera 2
select s.snombre, p.pnombre
from s, sp, p
where s.sn = sp.sn_id and sp.pn_id = p.pn;
