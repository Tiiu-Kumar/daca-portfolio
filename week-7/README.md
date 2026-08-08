## Nädal 7: Python Pandas — RFM kliendisegmenteerimine
Sel nädalal lahendasin UrbanStyle.ltd tootehalduri Marko Saare äriprobleemi: 
kes on meie väärtuslikuimad kliendid ja kes on ohus kaduda?

Kasutasin Python-i ja pandas teeki, et töödelda müügiandmeid ning luua RFM mudel, mis jagab kliendid käitumuslikesse segmentidesse

### Minu roll: Visualize roll (Roll D)

Minu fookuses oli analüüsi tulemuste visualiseerimine Plotly teegi abil
Minu eesmärk oli luua vaated, mis ei näita ainult numbreid, vaid räägivad ärijuhtidele loo kliendibaasi tervisest

**Minu peamised tegevused:**

Segmentide jaotuse visualiseerimine: 

1. Tulpdiagramm, mis näitab klientide arvu igas RFM segmendis


2. RFM hajuvusdiagramm (Scatter plot): Visualiseerisin seoseid hiljutisuse (Recency) ja rahalise väärtuse (Monetary) vahel, kus punktide suurus tähistas ostusagedust (Frequency)
.
Andmete valideerimine visuaalselt: Kontrollisin, et VIP Champions ja Lost segmendid paikneksid graafikul loogilistes kohtades

3. Tulpdiagramm : TOP 10 VIP klienti

### Peamised leiud
.

1. VIP-klientide ebaproportsionaalne mõju .
   
Analüüsi tulemusena selgus, et segment VIP Champions (skooriga 13–15) moodustab 17,91 % klientidest (245 klienti) ja annab suurema osa UrbanStyle’i kogukäibest 42,82 %.

Need on kliendid, kes ostavad tihti, kulutavad palju ja on hiljuti külastanud e-poodi


**Äriline soovitus:** Marko ja Anna peaksid neile pakkuma eksklusiivset varajast ligipääsu uutele kollektsioonidele ilma suurte allahindlusteta, et hoida marginaali kõrgena


2. "At Risk" segmendi kõrge potentsiaal
   
Tuvastasin olulise hulga kliente segmendis At Risk, kellel on kõrge ajalooline rahaline väärtus, kuid kelle viimasest ostust on möödunud mitu kuud (529 klienti, kes moodustavad klientide üldarvust 20,83% ja nende osakaal kogukäibest on 7,18%)

See segment on kriitiline, sest nad on ühe sammu kaugusel lõplikust lahkumisest (Lost)


**Äriline soovitus:** Saata neile personaliseeritud "me igatseme teid" e-mail koos 15% sooduskoodiga, mis kehtib vaid 7 päeva, et tekitada kiiret huvi naasmiseks

### AI kasutamine
AI aitas sel nädalal väga palju, lahendasin tema abiga andmete importimises tekkinud vigu, samuti aitas koodide kirjutamisel ning RFM koodi selgitamisel. Lisaks aitas graafikutega - kui algul  graafikute koostamisel tekkis viga, siis soovitas AI neid salvestada html-na.

Koostas : Tiiu Kumar 08.08.2026
