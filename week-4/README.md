# Nädal 4: SQL Agregatsioon ja varude optimeerimine 
## Projekti ülevaade
Sel nädalal liikusin UrbanStyle.ltd andmete analüüsimisel toornumbritest strateegiliste vastusteni. 
Minu fookuses (Roll C) oli tuvastada ebaefektiivsust varude juhtimises — leida tooted, mis seisavad laos ja seovad ettevõtte kapitali, kuid ei tekita müüki
. 
Kasutatud tööriistad ja tehnikad
SQL Agregatsioon: Kasutasin GROUP BY ja agregaatfunktsioone (SUM, COUNT, AVG), et koondada tuhandeid müügiridu kategooriate ja toodete tasemele
.
Keerukad filtrid: Rakendasin HAVING klauslit, et filtreerida välja grupeeritud tulemused (nt tooted, mille müügisumma on 0)
.
CTE (Common Table Expressions): Lõin ajutisi tabeliväljavõtteid, et muuta keerulised varude ja müügi võrdlused loetavaks ja süsteemseks
.
Andmete valideerimine: Kasutasin COALESCE funktsiooni, et asendada müügita toodete NULL väärtused nullidega, tagades korrektse võrdluse laoseisuga
.


Ärilised järeldused ja soovitused
Tuvastasime andmete analüüsi käigus, et teatud toodete laovarud on ebaloomulikult kõrged võrreldes tegeliku müügitempoga

Meeskonnatöö GITHUBis :

Koostas Tiiu Kumar 19.07.2026
