# Nädal 6: Andmelugude jutustamine – Tartu kaupluse lugu

## Projekti ülevaade

Sel nädalal viimistlesin UrbanStyle.ltd Tartu kaupluse dashboard-i
Kasutasin data storytelling tehnikaid, et muuta toornumbrid operatsioonijuht Liis Koppelile arusaadavaks ja tegutsemiskõlblikuks looks
.

## Äriline kontekst (The Story):

**Setup:**

UrbanStyle on Eesti turul kiiresti kasvav bränd, kus Tartu kauplus mängib olulist rolli Lõuna-Eesti klientide teenindamisel

**Conflict:**

Kuigi ettevõte kasvab, on Tartu poe müügitrendid olnud ebaühtlased ning andmetes esineb 2025. aastal kriitilisi lünki, mis takistavad täpset planeerimist

**Resolution:** 

Tuvastasin Tartu poe peamised edutegurid (kõrge keskmine tellimus) ja andmekvaliteedi murekohad (lojaalsusandmete puudumine)

**Action:**

Esitasin Liis Koppelile konkreetsed soovitused varude ja kliendisuhete parandamiseks

## Dashboard-i peamised komponendid ja leiud (Roll B)

**1. Juhtide kokkuvõte (Executive Summary)**

Lisasin dashboard-i ülaossa KPI kaardid:

- Kogukäive: 521,60K EUR – Tartu panus on stabiilne

- Klientide arv : 1614K
- Keskmine tellimus: 290 € – kõrgem kui ettevõtte keskmine (288 €), mis viitab Tartu klientide eelistusele kallimate toodete vastu

- Müügitulu kasv (2023 vs 2024): +13% – näitab tervislikku arengut enne andmekaost
.

**2. Müügitrend ja annotatsioonid**

Kasutasin joondiagrammi, kuhu lisasin annotatsioonid, et selgitada anomaaliaid
:

**Müügitipp (detsember 2024):** Märgistatud kui "jõulukampaania efekt", mis tõi kaasa aasta suurima müügi
.

**Andmelünk (2025):** Selgitus puuduvate märtsi-novembri andmete kohta, et vältida vääraid järeldusi müügi kukkumisest
.

**3. Kliendisegmentide jaotus**

Tuvastasin olulise andmekvaliteedi probleemi: 35,7% klientidest on segmentimata ("None")
. 
See on kriitiline leid turundusjuht Annale ja operatsioonijuht Liisile – me kaotame võimaluse personaalseks teeninduseks
.

**🛠 Tööriist:**  Power BI
.

**Andmete allikas:** PostgreSQL andmebaas Supabase platvormil

<img width="1273" height="653" alt="image" src="https://github.com/user-attachments/assets/77e0eafb-3f1e-4a4a-a06b-5a7dcbf30372" />

.

## 🧭 Ärilised soovitused Liis Koppelile


Andmete taastamine: Koostöös Toomas Kasega tuleb taastada 2025. aasta andmed, et saaksime teha adekvaatseid prognoose 2026. aastaks
.

Lojaalsusprogrammi fookus: Kuna kolmandik kliente on segmentimata, tuleb Tartu poes juurutada aktiivsem e-mailide kogumine ja lojaalsusprogrammi pakkumine
.

Varude planeerimine: Kuna TOP 5 toodet (nt Klassikaline seemisnahkne jope) moodustavad suure osa käibest, peab tagama nende pideva saadavuse Tartu laos
.


**AI kasutus:**

Kasutasin AI abi Power BI-s visuaalide formaatimisel ning võimalike põhjuste väljaselgitamisel miks kliendisegmendi visuaalil tuli ikkagi üks grupp 'none', kuigi kasutasin tingimuslauset puuduvate andmete määratlemisel kliendilojaalsuse veerus

Koostas : Tiiu Kumar 31.07.2026

