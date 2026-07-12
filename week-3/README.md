# Nädal 3: SQL JOINid ja ärianalüüs Anna Metsale
## Projekti ülevaade
Selle nädala fookuses oli UrbanStyle.ltd erinevate andmetabelite (sales, customers, products, inventory) ühendamine, et vastata turundusjuht Anna Metsa kriitilistele äriküsimustele
. Kui eelmisel nädalal tegelesime andmete puhastamisega, siis nüüd avasime SQL JOINide abil andmete tõelise väärtuse
.
Äriprobleem
Anna Mets vajas kampaaniate planeerimiseks kiiret ülevaadet parimatest klientidest, populaarsetest tootekategooriatest ja nendest inimestest, kes on süsteemis registreerunud, kuid pole veel ühtegi ostu teinud
.
Tehnilised oskused ja tööriistad
SQL JOINid: Kasutasin INNER JOINi sobivate paaride leidmiseks ja LEFT JOINi "kadunud" andmete (nt ostuta kliendid) tuvastamiseks
.
Multi-table JOIN: Ühendasin korraga kolm tabelit, et siduda müügiinfo, toote andmed ja kliendi profiil
.
Supabase SQL Editor: Päringute testimine ja tulemuste valideerimine
.
## Analüüsi tulemused

1. TOP 20 klienti (INNER JOIN)

Ühendasin sales ja customers tabelid, et leida UrbanStyle'i kõige väärtuslikumad kliendid.
Leid: Enamik meie TOP-kliente on Gold-tasemel ja asuvad Tallinnas
vt sql päring : week3_roll_a_myyk_kliendid.sql
.

2. Tootekategooriate analüüs

(minu roll grupitöös, vt ROLL B_nädal3.md)

Ühendasin sales, products ja customers tabelid, et mõista, mida meie kliendid eelistavad

.
3. "Kadunud" kliendid (LEFT JOIN)

Kasutasin LEFT JOINi ja filtrit WHERE s.sale_id IS NULL, et leida kliendid, kes on registreerunud, 
kuid pole kunagi ostnud
.

Leid: Tuvastasin 599 klienti, kellele Anna saab saata tervituskampaania ja esimese ostu soodustuse

vt sql päring : week3_roll_b_kadunud_kliendid.sql
.

4. Müügikanalid ja linnad

Analüüsisin müüki channel (online vs. store) ja store_location lõikes

.
vt sql päring : week3_roll_c_müügikanalid.sql
.

Ärisoovitused Annale

Saata personaalne "esimese ostu" pakkumine registreerunud klientidele, kellel puudub ostuajalugu
.
Suunata järgmine kampaania eco-sertifitseeritud toodetele, kuna need resoneerivad meie Gold-taseme klientidega

Meeskonnatöö GitHubis:
https://github.com/silvervarusk/Sales-Analytics/tree/main/03_SQL%20JOIN-id%20ja%20j%C3%A4tkusuutlikud%20tooted


Koostas Tiiu Kumar 12.07.2026
