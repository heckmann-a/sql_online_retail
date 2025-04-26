# sql_online_retail

Für die vollständige Analyse stehen die Dateien 
* [*explorative-analyse.md*](https://github.com/heckmann-a/sql_online_retail/blob/main/docs/explorative-analyse.md) und
* [*online_retail_preprocessing*](https://github.com/heckmann-a/sql_online_retail/blob/main/sql/online_retail_preprocessing.sql) zur Verfügung.
  
&nbsp;

Die entsprechende Beispiel-Datenbank als SQL-Dump, die typische Analyseprozesse im Retail-Bereich zeigt. 
* [*online_retail*](https://github.com/heckmann-a/sql_online_retail/blob/main/sql/online_retail.sql) *(Beinhaltet Materialized Views zur Auswertung von Verkaufsdaten nach Land und Produkt.)*
  

&nbsp;

# Einführung:
Das Projekt befasst sich mit einem Online-Shop in Großbritannien und den dort getätigten Transaktionen.\
Hierbei wurde ein Datenatz aus der Datenbank extrahiert.

# Datenquellen:
[(Datensätze: Kaggle.com)]( https://www.kaggle.com/datasets/ulrikthygepedersen/online-retail-dataset/data)\
*Der verwendete Datensatz stammt aus Kaggle und unterliegt der Lizenz 'CC BY 4.0'.\
Dieses Projekt dient ausschließlich zu Lern- und Demonstrationszwecken und wird nicht für kommerzielle Nutzung eingesetzt.*

# Technologien:
* PostgreSQL in pgAdmin, Visualisierung in Power BI 

# Beschreibung des Vorgehens:
* Einlesen der Daten in pgAdmin 
* Vorverarbeitung der Daten durch SQL-Script mit Query
* Export der SQL-Datenbank und Import in Power BI
* Datenanalyse
* Ergebnisse


# Aufgabenstellung:
Es soll untersucht werden, welche Produkte am häufigsten gekauft werden und ob es saisonale Trends gibt.


![monate](https://github.com/user-attachments/assets/5c7e365e-3aa0-424a-a630-81b0b5072e54)


# Ergebnisse:
Am häufigsten haben sich kleinere Spielzeuge wie „WORLD WAR 2 GLIDERS ASSTD DESIGNS“, Taschen „JUMBO BAG RED RETROSPOT“, dekorative Vögel „ASSORTED COLOUR BIRD ORNAMENT“ oder Lichter „WHITE HANGING HEART T-LIGHT HOLDER“ unabhängig vom Land der Bestellung.\
In der Regel kleine, preiswerte Dekorations- und Spielzeugartikel sowie praktische Produkte bis ca. 4-5 £.\
Die umsatzstärksten Monate sind September bis Dezember, was daran liegen könnte, dass in dieser Zeit mehr Geschenke gekauft werden, z.B. für Weihnachten. Daher ist das Wintergeschäft stärker.
