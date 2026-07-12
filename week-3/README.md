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
.
2. Tootekategooriate analüüs

Ühendasin sales, products ja customers tabelid, et mõista, mida meie kliendid eelistavad
.

.
3. "Kadunud" kliendid (LEFT JOIN)

Kasutasin LEFT JOINi ja filtrit WHERE s.sale_id IS NULL, et leida kliendid, kes on registreerunud, kuid pole kunagi ostnud
.
Leid: Tuvastasin 599 klienti, kellele Anna saab saata tervituskampaania ja esimese ostu soodustuse
.

4. Müügikanalid ja linnad

Analüüsisin müüki channel (online vs. store) ja store_location lõikes
.
.
Ärisoovitused Annale
Saata personaalne "esimese ostu" pakkumine registreerunud klientidele, kellel puudub ostuajalugu
.
Suunata järgmine kampaania eco-sertifitseeritud toodetele, kuna need resoneerivad meie Gold-taseme klientidega

Meeskonnatöö GitHubis:


Koostas Tiiu Kumar 12.07.2026