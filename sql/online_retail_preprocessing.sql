CREATE TABLE retail_data (
    invoice_no TEXT,  -- Da hier Zeichen mitgeführt wurden zunächst als Text definieren.
    stock_code TEXT,  -- Hier ebenso.
    description TEXT,
    quantity INTEGER,
    invoice_date TIMESTAMP,
    unit_price NUMERIC(10, 2), -- da es Preise sind mit 2 Nachkommastellen.
    customer_iD NUMERIC, -- da 1 Nachkommastelle.
    country TEXT
);

/*
Über "Import/Export" die CSV-Datei einbinden in die Tabelle "retail_data".
(Pfad eingeben, Encoding = UTF8, Options -> Header aktiv)
*/

SELECT * FROM retail_data
ORDER BY invoice_no DESC


-- Datenvorverarbeitung (Data Preprocessing)

-- 1) "invoice_no" beinhaltet "c" Chars(Zeichen). Diese sollten separiert werden.
 AlTER TABLE retail_data ADD canceled INT -- Erzeuge eine neue Spalte "canceled" als Status.
 UPDATE retail_data SET canceled = 1 WHERE invoice_no LIKE '%C%' -- Suche in der Spalte nach dem C und setze canceled auf 1.
 UPDATE retail_data SET canceled = 0 WHERE invoice_no NOT LIKE '%C%' -- Da wo es nicht C ist, soll canceled auf 0. 
----- Wenn beide Fälle behandelt wurden, soll jeder einzelne Buchstabe aus Spalte invoice_no verschwinden.
 UPDATE retail_data SET invoice_no = regexp_replace(invoice_no,'[A-Za-z]','', 'g') 

-- 2) "customer_id" ist als Gleitkommazahl dargestellt und umwandeln als Ganzezahl.
 ALTER TABLE retail_data
 ALTER COLUMN customer_id SET DATA TYPE INTEGER

-- 3 )Neue Spalte erzeugen aus Anzahl * Preis.
 Alter TABLE retail_data ADD total NUMERIC(10, 2)
 UPDATE retail_data SET total = quantity * unit_price

-- 4) invoice_no und stock_code_digit als INT umwandeln.
 ALTER TABLE retail_data
 ALTER COLUMN invoice_no SET DATA TYPE INTEGER
 USING invoice_no::integer; 

-- 5) "stock_code" beinhaltet unterschiedliche Chars. Diese sollten entfernt werden.
----- Filter, in dem "stock_code" nur aus 5 Zahlen und aus keinen Buchstaben besteht (als int parse).
----- und es nur gültige Kunden gibt. 
 SELECT *, LEFT(stock_code, 5)::integer as stock_code_digit 
 FROM retail_data WHERE LEFT(stock_code, 5) !~ '[A-Za-z ]' AND customer_id > 0  


-- Den bearbeiteten Datensatz als materialized view abspeichern.
CREATE MATERIALIZED VIEW retail_merged AS
	SELECT *, LEFT(stock_code, 5)::integer as stock_code_digit 
    FROM retail_data WHERE LEFT(stock_code, 5) !~ '[A-Za-z ]' AND customer_id > 0 
	
	
-- Eine View erstellen mit den beliebtesten Artikeln pro Land.
CREATE MATERIALIZED VIEW popular_products AS
    -- Nach Land und Artikel gruppieren, jeweils die Summe bilden von Artikelmenge und Artikelnamen und absteigend sortieren.
	SELECT country, description, COUNT(description) AS sum_desc, SUM(quantity) as sum_quantity, SUM(total) as sum_total FROM retail_merged  	
		GROUP BY country, description	
		ORDER BY country, sum_desc DESC
	
-- Eine gezieltere View, indem nur ein Top-Artikel pro Land ausgegeben wird.
CREATE MATERIALIZED VIEW top_products_per_country AS
	SELECT country, description, sum_desc, sum_quantity, sum_total FROM 
	(
		SELECT *, ROW_NUMBER() OVER -- Erstellung eines subselects für alle spalten.
		(
		PARTITION BY country ORDER BY sum_desc DESC -- Es wird nach dem höchsten sum_desc sortiert innerhalb des Landes.
		) as rn FROM popular_products
	) ranked WHERE rn=1  -- über ranked bzw rn = 1 wird der höchste Wert nur betrachtet.
	
-- Zum Schluß werden mit den View´s explorative Datenanalysen durchgeführt in Power BI.