# Nädal 4: SQL Agregatsioon ja varude optimeerimine 
## Projekti ülevaade
Sel nädalal liikusin UrbanStyle.ltd andmete analüüsimisel toornumbritest strateegiliste vastusteni. 
. Minu fookuses (Roll C) oli analüüsida tootekategooriaid, laoseisu ja müüki — leida tootekategooriad ja tooted, mis müüvad kõige rohkem.
. 
## Kasutatud tööriistad ja tehnikad
SQL Agregatsioon: Kasutasin GROUP BY ja agregaatfunktsioone (SUM, COUNT, AVG), et koondada tuhandeid müügiridu kategooriate ja toodete tasemele
.
Keerukad filtrid: Rakendasin HAVING klauslit, et filtreerida välja grupeeritud tulemused (nt tooted, mille müügisumma on 0)


CTE (Common Table Expressions): Lõin ajutisi tabeliväljavõtteid, et muuta keerulised varude ja müügi võrdlused loetavaks ja süsteemseks


Andmete valideerimine: Kasutasin COALESCE funktsiooni, et asendada müügita toodete NULL väärtused nullidega, tagades korrektse võrdluse laoseisuga
.
## Peamised leiud : 
Kõige tugevam müügikategooria on meesteriided ( 4121 müüdud ühikut)

kõrgeima väärtusega kategooria on jalanõud (keskmine hind 214,10 €)

Kõige nõrgem kategooria : aksessuaarid ( 3231 müüdud ühikut)
Vt. täpsem info ROLL C_Inventuuristatistika (2).md

## Ärilised järeldused ja soovitused
Tuvastasime andmete analüüsi käigus, et teatud toodete laovarud on ebaloomulikult kõrged võrreldes tegeliku müügitempoga. Jalanõud ja meesteriided pakuvad ettevõttele suurimat äripotentsiaali ning vajavad täiendavat tähelepanud toodete ja kampaaniate planeerimisel.

Meeskonnatöö GITHUBis :
https://github.com/silvervarusk/Sales-Analytics/tree/main/04_SQL%20Agregatsioon

## AI kasutamine
Küsisin AI-lt nõud kuidas kirjutada Web-kanali efektiivsus päringut CTE-ga

Koostas Tiiu Kumar 19.07.2026
