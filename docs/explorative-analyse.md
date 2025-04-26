# online_retail

&nbsp;
# Einführung:
Das Projekt befasst sich mit einem Online-Shop in Großbritannien und den dort getätigten Transaktionen.\
Hierbei wurde ein Datenatz aus der Datenbank extrahiert.

Der Datensatz besteht aus 8 Spalten und über 500.000 Zeilen.

Beschreibung der Datenspalten:
* *InvoiceNo*: Die Rechnungsnummer (6-stellige Zahl). Wenn diese mit einem Buchstaben „C“ anfängt, ist das ein Hinweis auf eine Stornierung.
* *StockCode*: Eindeutiger Artikelcode (5-stellig)
* *Description*: Artikelname
*	*Quantity*: Die Anzahl jedes Produkts
*	*InvoiceDate*: Rechnungsdatum
*	*UnitPrice*: Einzelpreis pro Einheit in in Pfund Sterling (£)
*	*CustomerID*: Eindeutige Kundennummer (5-stellige Zahl)
*	*Country*: Ländername


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


# Explorative Datenanalyse:
Nach der Datenvorverarbeitung schrumpft der Datensatz auf ca. 405 Tsd. Transaktionen.

![Länder](https://github.com/user-attachments/assets/c6837551-0508-4bc9-82c3-356709bc0b97)
Wie zu erwarten fanden die meisten Transaktionen in UK statt mit einem Anteil von **89,22 %**. Der verbleibende Anteil von **10,78 %** verteilt sich auf die übrigen Länder.\
Hierbei sind Deutschland (**2,24 %**), Frankreich(**2,02 %**) und Irland (**1,82 %**) am stärksten vertreten, bezogen auf die Gesamtanzahl von ca. 405 Tsd. Transaktionen. Direkte Nachbarländer sind daher häufiger an Transaktionen beteiligt.\
Auch beim Gesamtumsatz von **8,28 Mio. £**, generiert UK den größten Teil von (**84,77 % = 6,82 Mio. £**).


&nbsp;


![Artikel](https://github.com/user-attachments/assets/7ea84e33-d397-4016-a5bf-f5ad0145fdc2)

![umsatz](https://github.com/user-attachments/assets/6f3b8dde-0ed4-48b8-8434-de37615165f6)
Die beliebtesten Artikel sind deutlich zu erkennen. Mit 1980 Transaktionen beim Artikel “WHITE HANGING HEART T-LIGHT HOLER“ dominiert UK.\
Beim stärksten Artikelumsatz geht der „REGENCY CAKESTAND 3 TIER“ hervor mit ca. **133 Tsd. £** bei 11555 Einzelmengen, gefolgt vom “WHITE HANGING HEART T-LIGHT HOLDER“ mit ca. **94 Tsd. £** bei 34147 Einzelmengen.

&nbsp;

![monate](https://github.com/user-attachments/assets/873fff47-7776-4286-be63-408a5756945c)
Betrachtet man den gesamten Zeitraum (01.12.2010 – 09.12.2011), so sind die umsatzstärksten Monate September bis Dezember. Mit dem Spitzenmonat November (**1,12 Mio. £**). Daraus lässt sich ableiten, dass der Online-Shop überwiegend auf Artikel für die Herbst- und Wintersaison ausgerichtet ist. Das würde auch erklären warum sehr viele Artikel verkauft werden im Bereich Deko und Spielwaren.

&nbsp;

# Ergebnisse:
Am häufigsten haben sich kleinere Spielzeuge wie \„WORLD WAR 2 GLIDERS ASSTD DESIGNS“, Taschen „JUMBO BAG RED RETROSPOT“, dekorative Vögel „ASSORTED COLOUR BIRD ORNAMENT“ oder Lichter „WHITE HANGING HEART T-LIGHT HOLDER“ unabhängig vom Land der Bestellung.\
In der Regel kleine, preiswerte Dekorations- und Spielzeugartikel sowie praktische Produkte bis ca. 4-5 £.\
Die umsatzstärksten Monate sind September bis Dezember, was daran liegen könnte, dass in dieser Zeit mehr Geschenke gekauft werden, z.B. für Weihnachten. Daher ist das Wintergeschäft stärker.
