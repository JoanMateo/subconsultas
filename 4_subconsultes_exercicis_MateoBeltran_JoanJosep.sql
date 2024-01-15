-------------------------------------------------------------------------------
--          Subconsultes
-------------------------------------------------------------------------------

-- 4.1- Llista el nom dels venedors que tinguin una quota igual o inferior a l'objectiu de l'oficina de vendes d'Atlanta. (9)

SELECT nom from repvenda where quota <= (select objectiu from oficina where ciutat = 'Atlanta');

-- 4.2- Tots els clients, codi i nom del client, que han estat atesos per (que han fet comanda amb) Bill Adams.(2)

SELECT cliecod, nom from client where cliecod in (select repcod from repvenda rv join comanda c on rv.repcod=c.repcod where nom = 'Bill Adams');


-- 4.3- Llista dels productes del fabricant amb identificador "aci" que les existències superen les existències del producte amb identificador de producte "41004" i identificador de fabricant "aci". Mostreu els identificadors del producte i la descripció(3)

SELECT prodcod, descrip from producte where fabcod = 'aci' and exist > (select exist from producte where prodcod = '41004' and fabcod 'aci');

-- 4.4- Llistar el nom i l'edat de totes les persones de l'equip de vendes que no dirigeixen una oficina. (6)

SELECT nom, edat from repvenda where repcod not in (select director from oficina);

-- 4.5- Llistar aquells clients que els seus representants de vendes estàn assignats a oficines de la regió est. Mostrar codi i nom dels clients (13)

SELECT cliecod, nom from client where repcod in (select repcod from repvenda where ofinum in (select ofinum from oficina where regio = 'Este'));

-- 4.6- Llistar els venedors que treballen en oficines que superen el seu objectiu. Mostrar codi i nom dels venedors(5)

SELECT select repcod, nom, from repvenda where ofinum in (select ofinum from oficina where objectiu<vendes);

-- 4.7- Llistar el nom de tots els clients que han realitzat comandes del productes de la família ACI Widgets entre gener i juny del 2020. Els productes de la famíla ACI Widgets són aquells que tenen identificador de fabricant "aci" i que l'identificador del producte comença per "4100". (4)

SELECT nom from client where cliecod in (select cliecod from comanda where fabcod = 'aci' and prodcod like '4100%' and data between '2020-01-01' and '2020-06-30');

-- 4.8- Llistar el nom dels clients que no tenen cap comanda. (6)

SELECT nom from client where cliecod not in (select cliecod from comanda);                      

-- 4.9- Llistar el nom dels clients que tenen assignat el venedor que porta més temps a contractat. (3=)

SELECT nom from client where repcod in (select repcod from repvenda order by datacontracte asc limit 1);
                         
-- 4.10- Llistar el nom dels jefes d'empleats que tenen més de 40 anys i que dirigeixen un venedor que té unes vendes superiors a la seva pròpia quota.(2)

SELECT nom from repvenda where edat > 40 and repcod in (select jefe from repvenda where vendes > quota);

-- 4.11- Llista els venedors que no treballen en oficines dirigides per Larry Fitch, o que no treballen a cap oficina. Sense usar consultes multitaula. Mostrar codi i nom dels venedors (7)

SELECT nom from repvenda where ofinum in (select ofinum from oficina where director not in (select repcod from repvenda where nom = 'Larry Fitch')) or ofinum is null;

-- 4.12- Llistar els venedors (codi i nom) que no treballen en oficines dirigides per Larry Fitch, o que no treballen a cap oficina. Mostrant també la ciutat de l'oficina on treballa l'empleat i l'identificador del director de la oficina. Proposa dues sentències SQL, una amb subconsultes i una sense. (6)

SELECT repcod, nom, ciutat, director from repvenda left join oficina on repvenda.ofinum = oficina.ofinum where oficina.ofinum is null or director <> (select repcod from repvenda where nom = 'Larry Fitch');

-- 4.13- Llistar els venedors que han acceptat una comanda que representa més del 10% de la seva quota. Mostreu el codi. (3)

SELECT distinct repvenda.repcod from repvenda join comanda on repvenda.repcod = comanda.repcod where comanda.import > 0.1 * repvenda.quota;


-- 4.14- Venedors amb quotes que siguin iguals o superiors a l'objectiu de llur oficina de vendes. Mostreu el nom del venedor, la quota del venedor i l'objectiu de l'oficina(2)

SELECT repvenda.nom, repvenda.quota, oficina.objectiu from repvenda join oficina on repvenda.ofinum = oficina.ofinum where repvenda.quota >= oficina.objectiu;

-- 4.15- Mostrar l'identificador de l'oficina i la ciutat de les oficines on l'objectiu de vendes de l'oficina excedeix la suma de quotes dels venedors d'aquella oficina. (2)

SELECT oficina.ofinum, oficina.ciutat from oficina where oficina.objectiu > (select SUM(quota) from repvenda where ofinum = oficina.ofinum);

-- 4.16- Llistar aquelles oficines, i els seus objectius, que tots els seus venedors tinguin unes vendes que superen el 50% de l'objectiu de l'oficina. Mostrar codi oficina, ciutat i objectiu (3)

SELECT oficina.ofinum, oficina.ciutat, oficina.objectiu from oficina where not exists (select from repvenda where ofinum = oficina.ofinum and vendes < 0.5 * objectiu);

-- 4.17- Llistar els venedors que treballen en oficines que superen el seu objectiu. Mostrar també les següents dades de l'oficina: ciutat i la diferència entre les vendes i l'objectiu. Ordenar el resultat per aquest últim valor. Proposa dues sentències SQL, una amb subconsultes i una sense. (5)

--  repcod |     nom     |   ciutat    |    dif
-- --------+-------------+-------------+-----------

SELECT ;

-- 4.18- Llistar el nom dels clients assignats a Sue Smith que no han fet cap comanda amb un import superior a 30000. Proposa una sentència SQL sense usar multitaula i una altre en que s'usi multitaula i subconsultes. (4)

SELECT ;

-- 4.19- Llista la ciutat de les oficines on hi hagi algun venedor tal que la seva quota representi més del 50% de l'objectiu de l'oficina (3)

SELECT ;

-- 4.20- Llista la ciutat de les oficines on tots els venedors tinguin la seva quota superior al 55% de l'objectiu de l'oficina. (2)

SELECT ;


-- 4.21- Transforma el següent JOIN a una comanda amb subconsultes:
/* SELECT comnum, import, comanda.cliecod, limcred
 FROM comanda JOIN client
 ON comanda.cliecod = client.cliecod; 
 */

SELECT ;


-- 4.22- Transforma la següent consulta amb subconsultes a una consulta sense subconsultes.
-- SELECT repcod, nom FROM repvenda WHERE repcod = ANY ( SELECT repcod FROM client WHERE nom LIKE '%Inc.');

SELECT ;


-- 4.23- Transforma la següent consulta amb subconsultes a una consulta sense subconsultes.
-- SELECT * FROM producte WHERE fabcod IN(SELECT fabcod FROM comanda WHERE quant > 30) AND prodcod IN(SELECT prodcod FROM comanda WHERE quant > 30);

SELECT;


-- 4.24- Transforma el següent JOIN a una comanda amb subconsultes:
/* SELECT empl.nom, empl.quota, empl_jefe.nom, empl_jefe.quota
 FROM repvenda AS empl JOIN repvenda AS empl_jefe
 ON empl.jefe = empl_jefe.repcod
 WHERE empl.quota > empl_jefe.quota; */

SELECT ;



-- 4.25- Transforma la següent consulta amb un EXISTS a una consulta amb un ANY i també amb un JOIN:
-- SELECT cliecod, nom FROM client WHERE EXISTS (SELECT * FROM repvenda WHERE repcod = client.repcod AND edat BETWEEN 40 AND 50);
-- Selecciona els clients que tenen un representant d'entre 40 i 50 anys.


SELECT ;



-- 4.26- Transforma la següent consulta amb un IN a una consulta amb un EXISTS i també a una altre consulta amb un ALL.
-- SELECT repcod, nom FROM repvenda WHERE repcod IN(SELECT jefe FROM repvenda);
-- Mostra codi i nom dels representants que son jefes

SELECT ;
              

   
-- 4.27- Transforma la següent consulta amb un ALL a una consulta amb un EXISTS i també en una altre consulta amb un ANY:
-- SELECT cliecod FROM client WHERE limcred < ALL (SELECT import FROM comanda WHERE client.cliecod = comanda.cliecod);
-- Selecciona els clients tals que totes les seves comandes son superiors al seu límit de crèdit


SELECT ;