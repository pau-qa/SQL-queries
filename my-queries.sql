#SELECT/WHERE

--Wyswietl kod i nazwe wszystkich produktow, ktore nie naleza do kategorli: Napoje
SELECT product_code, product_name, category FROM products WHERE category NOT LIKE 'Beverages';

--Wyswietl wszvstkie dane produktow, ktorch koszt zakupu iest wiekszy niz 12.0000.
SELECT * FROM products WHERE standard_cost > 12.0000; 

--Wyswietl miasto, adres dostawy i optate za przewóz zamówienia, którego optata za przewóz miesci sie w przedziale 20.0000 a 78.1223.
SELECT ship_city, ship_address, shipping_fee  FROM orders WHERE shipping_fee BETWEEN 20.0000 AND 78.1223;

--Wyswietl wszystkie intormace o produktach, Ktore mala okreslona minimalna liczbe zamowienia.
SELECT * FROM products WHERE minimum_reorder_quantity IS NOT NULL;

--Wvswietl imie. nazwisko i miasto zamieszkania pracownikow. ktorch miasto zamieszkania konczv sie na nd i lest nie jest to Redmond.
SELECT first_name, last_name, city FROM employees WHERE city LIKE '%nd' AND city NOT LIKE 'Redmond';

--Wyswietl wszystkie informacje o produktach, które maja okreslona minimalna liczbe zamówienia i ich koszt jest mniejszy niz 10.0000.
SELECT * FROM products WHERE minimum_reorder_quantity IS NOT NULL AND standard_cost < 10;

--Wyswietl intormace o Klientach, Ktorzy nie sa menadzerami.
SELECT * FROM customers WHERE job_title NOT LIKE '%Manager%';

--Wyswietl intormacje o produktach, Ktorych id dostawcy rowna sie 4 lub 6 lub 7
SELECT * FROM products WHERE supplier_ids IN (4,6,7);

#ORDER BY
--Wyswietl imie, nazwisko i miasto zamieszkania pracowników. którvch miasto zamieszkania konczv sie na nd i nie jest to Redmond. Wiki posortuj od Z do A wzgledem imienia.
SELECT first_name, last_name, city FROM employees WHERE city NOT LIKE 'Redmond' ORDER BY first_name DESC;

--Zaprezentuj wszystkie produkty posortowane od najmniejszej ceny zakupu (standard _cost).
SELECT product_name, standard_cost FROM products ORDER BY standard_cost ASC;

--Zaprezentuj wszystkie produkty posortowane od naimnieiszej ceny zakupu (standard cost) i naiwiekszej ceny sprzedazy (list price).
SELECT product_name, standard_cost, list_price FROM products ORDER BY standard_cost ASC, list_price DESC;

#DISTINCT

--Poda] Liste zawodow (nie moga sie powtarzac), Jakie posiadaja nasi Klienci.
SELECT DISTINCT job_title FROM customers; 

--Wyswietl liste kategoril produktow, ktore posiadamy w bazie. Posortuj po nazwie kategorii malejaco.
SELECT DISTINCT category FROM products ORDER BY category DESC;

#AS
--Zaprezentuj raport da dyrekcji, który bedzie zawieral nastepujace kolumny: Imie Pracownika, Nazwisko_ Pracowanika, Miasto. Na raporcie umiesc tylko pracowników z Seattle.
SELECT first_name AS Imie_Pracownika, last_name AS Nazwisko_Pracownika, city FROM customers WHERE city LIKE 'Seattle';

--Przedstaw raport, ktory bedzie zawierac miasto, adres dostawy i optate za przewoz zamowienia, ktorego oplata za przewoz miesci sie w przedziale 19.1256 a 78.1999
SELECT ship_city AS Miasto, ship_address AS Adres_dostawy, shipping_fee AS Przewoz_Zamowienia FROM orders WHERE shipping_fee BETWEEN 19.1256 AND 78.1999;

#AGGREGATION
--ZLICZ Liczbe wszystkich zamowien.
SELECT COUNT(*) FROM orders;

--Zlicz liczbe wszystkich zamówien oplaconych kartami kredytowymi.
SELECT COUNT(*) FROM orders WHERE payment_type LIKE 'Credit Card';
SELECT MAX(shipping_fee) FROM orders;
SELECT MIN(standard_cost) FROM products WHERE supplier_ids LIKE '1';
SELECT AVG(shipping_fee) FROM orders WHERE shipping_fee > 0; 
SELECT SUM(quantity) FROM order_details WHERE product_id = '43';
SELECT MIN(standard_cost), category FROM products GROUP BY category;
SELECT COUNT(job_title), job_title FROM customers GROUP BY job_title;

#UPDATE

--Zaaktualizuj wartosc jezyka obcego o id 1 na Esperanto
SELECT * FROM language 
UPDATE language
SET name = 'ESPERANTO'
WHERE language_id =1;

#DELETE 
  
--Usun jezyk obcy Esperanto z bazy danych
SELECT * FROM language 
DELETE FROM language
WHERE name = 'ESPERANTO';

#ALTER TABLE

--Zmien nazwę kolumny title na language_title
ALTER TABLE language
RENAME COLUMN title TO language_title;

#JOIN

--Podaj listę wszystkich zamowien zlozonych przez John Reindhardt
SELECT * FROM Customers
JOIN Orders 
ON customers.customer_id = orders.customer_id
WHERE first_name = 'John' AND last_name = 'Reinhardt';

