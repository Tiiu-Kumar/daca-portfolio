## Nädal 9: Tehnilise kandidaadi hindamisjuhend (Roll B)

**Projekti ülevaade**

Seoses UrbanStyle.ltd kiire laienemisega ja plaaniga palgata 7 uut andmeanalüütikut (5 Eestisse ja 2 välismaale kaugtööna), koostasin värbamismeeskonnale tehnilise hindamisjuhendi

Tehnilise intervjueerija (Roll B) rollis oli minu ülesandeks defineerida kriteeriumid, mille alusel hinnata kandidaatide koodi kvaliteeti, tööriistade tundmist ja dokumentatsiooni, tuginedes viimase 8 nädala jooksul omandatud parimatele andmeinseneeria praktikatele
.

### Hindamiskriteeriumid

**1. Koodi kvaliteet ja struktuur**
   
**SQL loetavus**: Kandidaat peab kasutama standardset vormindust (suurtähtedega märksõnad nagu SELECT, FROM, JOIN) ja loogilisi reavahetusi
. Keerukama loogika puhul (nt müügitrendide võrdlus) on eelistatud CTE (Common Table Expressions) kasutamine alampäringute asemel, mis näitab koodi loetavuse väärtustamist-

**Pythoni modulaarsus**: Hindame, kas kood on jagatud funktsioonideks (nt eraldi funktsioonid andmete hankimiseks, puhastamiseks ja töötlemiseks) või kirjutatud ühe pika skriptina. Modulaarne kood on kergemini testitav ja vastab Single Responsibility printsiibile

**Kommenteerimine**: Koodis peavad olema selgitused selle kohta, miks on teatud loogikat või filtreid kasutatud (nt miks tehti otsus kasutada LEFT JOIN-i või kuidas käsitleti NULL väärtuseid)
.

**2. Tööriistade tundmine**

**SQL (PostgreSQL)**: Kandidaat peab tõestama praktilist oskust andmete puhastamisel (GROUP BY ja HAVING duplikaatide leidmiseks) ning tabelite ühendamisel (INNER JOIN ja LEFT JOIN)
.

**Python & pandas**: Oskus laadida andmeid pilvebaasist (nt Supabase API kaudu), kontrollida andmetüüpe (eriti kuupäevade ja summade teisendamist tekstist) ning teostada keerukamaid arvutusi (nt RFM skoorimine)
.

**Git / GitHub**: Versioonihaldus peab olema kandidaadi igapäevane harjumus, mitte ühekordne tegevus


**3. Dokumentatsioon ja GitHub**

**README.md failid**: Igal projektil peab olema "kaaneleht", mis selgitab lahendatud äriprobleemi, kasutatud tööriistu, peamisi leidude ja ärilisi soovitusi
.

**Commit sõnumid**: Commit'ide ajalugu peab olema loogiline ja sõnumid kirjeldavad (nt "Add retry-logic to fetch_sales function"), mitte lakoonilised (nt "Update")
.
### 3 Rohelist lippu (Tugev kandidaat)

✅**Andmete valideerimise ja puhastamise harjumus:** Kandidaat ei hakka pimesi andmeid analüüsima, vaid kontrollib esimese asjana ridade arvu, otsib duplikaate (DISTINCT abil) ja tuvastab NULL väärtuste osakaalu
.

✅**Andmete turvalisuse tagamine:** Kandidaat peidab kriitilised andmebaasi paroolid ja Supabase API võtmed .env faili ning lisab selle .gitignore faili, hoides ära tundlike andmete lekkimise avalikku GitHub repositooriumisse
.

✅**STAR-meetodil esitletud äriline tähendus:** Portfoolios ja intervjuul ei räägita ainult koodist, vaid seotakse tehniline tulemus äriliste otsustega (nt: "tuvastasin 424 VIP-klienti, kes genereerivad 42% käibest, võimaldades turundusjuhil käivitada personaliseeritud kampaania")
.

### 2 Punast lippu (Hoiatusmärgid)

🔴**Turbevead ja kõvakodeeritud saladused:** Supabase paroolid või API-võtmed on kirjutatud otse koodi sisse ja üles laetud avalikku repositooriumisse
.

🔴 **"Must kast" ja puudulik dokumentatsioon:** Kandidaat esitleb koodi, kus puuduvad kommentaarid, ning repositooriumi README on tühi või sisaldab vaid vaikimisi loodud teksti
. See viitab suutmatusele teha koostööd või selgitada oma tööd mittetehnilistele sidusrühmadele nagu Kristi Tamm või Anna Mets
.

🧭**Äriline mõju ja järeldused**


Selle juhendi rakendamine aitab UrbanStyle'il vähendada värbamisriske ning tagada, et uued meeskonnaliikmed suudavad kiiresti sulanduda meie tehnoloogilisse keskkonda
. 
Tööandja vaatenurga analüüsimine andis mulle väärtusliku õppetunni: suurepärast andmeanalüütikut ei erista mitte koodi keerukus, vaid koodi turvalisus, loetavus ning oskus tõlkida andmed ärilisteks soovitusteks

**AI kasutamine:**
Küsisin AI-lt soovitusi hindamisjuhendi koostamiseks ja vajadusel ka esitlusel kasutatavateks ülesanneteks.

Grupitöö : https://github.com/silvervarusk/Sales-Analytics/blob/main/09_HR/Varbamisjuhend.md

Koostas: Tiiu Kumar 23.08.2026


