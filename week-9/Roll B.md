## UrbanStyle.ltd värbamisjuhend: (Roll B)

### 1. Koodi kvaliteet ja struktuur

Tehniline intervjueerija peab koodi vaadates nägema süsteemsust. UrbanStyle'i andmekaoses ei ole ruumi lohakale koodile
.

**SQL loetavus:**


Kas kandidaat kasutab suuri tähti märksõnade jaoks (nt SELECT, FROM, JOIN)? 
Kas päringud on jaotatud ridadele nii, et loogika on jälgitav, mitte üks pikk tekstijada?
.

**Pythoni moodulsus:** 

Kas kood on jagatud funktsioonideks (nt fetch_data(), clean_data()) või on see üks pikk skript? 
UrbanStyle eelistab modulaarset lähenemist, mis on kergemini testitav
.

**Kommenteerimine:**

Hea kandidaat ei selgita koodis, mida kood teeb, vaid miks ta valis just selle meetodi (nt "kasutame LEFT JOINi, et leida ka ostuta kliendid")
.

### 2. Tööriistade tundmine

Kandidaat peab tõestama, et ta valdab UrbanStyle'i tehnoloogilist stacki
:

**SQL:**
Peab valdama JOIN tüüpe, GROUP BY agregaatfunktsioone ja soovitavalt ka CTE (Common Table Expressions) kasutamist keerukama loogika puhul
.

**Python & pandas:**
Oskus andmeid puhastada (duplikaatide ja NULLide käsitlemine) ning DataFrame manipulation
.

**GitHub:** 
Portfoolio peab olema avalik ja hästi struktureeritud (iga nädal eraldi kaustas)
.

**Power BI / Plotly:** 
Kas kandidaat oskab hoida Data-Ink Ratio madalana ja fokuseerida visuaalid järeldusele, mitte ainult "ilusale pildile"?
.
###3. Dokumentatsioon ja GitHub

Kuna andmeanalüütik on sild tehnoloogia ja äri vahel, on dokumentatsioon kriitiline
.
README.md failid: Igal projektil peab olema kirjeldus: mis on äriprobleem, milliseid tööriistu kasutati ja mis oli peamine järeldus
.
Commit sõnumid: "Update" ei ole piisav. Otsime konkreetseid selgitusi nagu "Fix duplicate handling in sales table"
.

**3 Rohelist lippu (Tugev kandidaat)**

Andmete valideerimise mentaliteet: Kandidaat ei hüppa kohe analüüsi juurde, vaid kontrollib esmalt ridade arvu, unikaalseid väärtuseid ja NULLide osakaalu
.
Äriliselt kvantifitseeritud tulemused: Ta ei ütle "leidsin VIPid", vaid "tuvastasin 424 VIP-klienti, kes annavad 42% UrbanStyle'i käibest"
.
Automatiseerimise huvi: Kandidaat on loonud skripte või pipeline'e, mis muudavad korduva töö (nt iganädalane RFM-analüüs) automaatseks
.


**2 Punast lippu (Hoiatusmärgid)**

Turvavead (Critical): API-võtmed või andmebaasi paroolid on jäetud otse koodi, mitte peidetud .env faili
.
"Must kast" analüüs: Koodis puuduvad selgitused ja README ei kirjelda, kuidas kandidaat tulemuseni jõudis. See tähendab, et teised meeskonnaliikmed ei saa tema tööd jätkata
.
