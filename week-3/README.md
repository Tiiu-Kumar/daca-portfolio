# Nädal 3: SQL JOINid ja ärianalüüs Anna Metsale
## Projekti ülevaade
Selle nädala fookuses oli UrbanStyle.ltd erinevate andmetabelite (sales, customers, products, inventory) ühendamine, et vastata turundusjuht Anna Metsa kriitilistele äriküsimustele
. Kui eelmisel nädalal tegelesime andmete puhastamisega, siis nüüd avasime SQL JOINide abil andmete tõelise väärtuse
.
## Äriprobleem
Anna Mets vajas kampaaniate planeerimiseks kiiret ülevaadet parimatest klientidest, populaarsetest tootekategooriatest ja nendest inimestest, kes on süsteemis registreerunud, kuid pole veel ühtegi ostu teinud
.

## 📌  Tehnilised oskused ja tööriistad
SQL JOINid: Kasutasin INNER JOINi sobivate paaride leidmiseks ja LEFT JOINi "kadunud" andmete (nt ostuta kliendid) tuvastamiseks
.

Multi-table JOIN: Ühendasin korraga kolm tabelit, et siduda müügiinfo, toote andmed ja kliendi profiil
.

Supabase SQL Editor: Päringute testimine ja tulemuste valideerimine
.
 ## 📊  Analüüsi tulemused

**1. TOP 20 klienti (INNER JOIN)**

Ühendasin sales ja customers tabelid, et leida UrbanStyle'i kõige väärtuslikumad kliendid.

Leid: Enamik meie TOP-kliente on Gold-tasemel ja asuvad Tallinnas

vt sql päring : week3_roll_a_myyk_kliendid.sql
.


**2. "Kadunud" kliendid (LEFT JOIN)**

Kasutasin LEFT JOINi ja filtrit WHERE s.sale_id IS NULL, et leida kliendid, kes on registreerunud, 
kuid pole kunagi ostnud
.
Kliendid kellel pole ühtegi ostu**
- näide
  
  <img width="697" height="257" alt="image" src="https://github.com/user-attachments/assets/a6eaf3b1-8898-4cc1-8a15-387c25add037" />


Leid: Tuvastasin 599 klienti, kellele Anna saab saata tervituskampaania ja esimese ostu soodustuse


vt sql päring : week3_roll_b_kadunud_kliendid.sql
.

**3. Müügikanalid ja linnad**

Analüüsisin müüki channel (online vs. store) ja store_location lõikes

.
Kadudnud kliendid linnade kaupa**
-  näide
  
<img width="244" height="297" alt="image" src="https://github.com/user-attachments/assets/79a3b228-64a1-4734-9ffe-cdffd24ae064" />

vt sql päring : week3_roll_c_müügikanalid.sql
.

**4. Kontroll : kas aktiivsete ja kadunud klientide arv annab kokku koguklientide arvu**

- Kadunud kliente: **599**  
- Aktiivseid kliente: **2551**

**6. Kadunud klientide mustrite otismine**
  
<img width="288" height="418" alt="image" src="https://github.com/user-attachments/assets/6ac11446-e67f-4962-86a7-d928796c3f81" />

**7. Kadunud klientide registreerimise kuupäev**

-  näide
  
<img width="425" height="259" alt="image" src="https://github.com/user-attachments/assets/796b04f2-808f-451e-821e-0dda950bd452" />

## 🧭 3. Kokkuvõte Annale

- 599 klienti ei ole kunagi ostnud (enim Tallinnas 231 ja Tartus 133)
- Kuna need inimesed on juba huvi üles näidanud, on see suurepärane võimalus meie müüki kasvatada
ja brändilojaalsust ehitada.
-Soovitan neile klientidele saata personaalse "esimese ostu" kampaania koos 15% allahindluskoodiga, 
et muuta need juba registreeringud kliendid aktiivseteks klientideks. 



Meeskonnatöö GitHubis:
https://github.com/silvervarusk/Sales-Analytics/tree/main/03_SQL%20JOIN-id%20ja%20j%C3%A4tkusuutlikud%20tooted


Koostas Tiiu Kumar 12.07.2026
