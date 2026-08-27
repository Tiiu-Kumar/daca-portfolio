
## Nädal 8: UrbanStyle.ltd Pipeline automatiseerimine

### Projekti ülevaade
Selle nädala eesmärk oli muuta seni manuaalne analüüs täisautomaatseks andmetoruks (pipeline). Kui varem sõltusime CSV failide käsitsi eksportimisest, siis nüüd suhtleb süsteem otse Supabase API-ga. See tagab tegevjuht alati värsked andmed ilma igasuguse käsitööta
.

### Minu rollid ja panus

### Roll A: Andmete hankimine (data_fetcher.py)

Minu ülesandeks oli luua süsteemi  Extract moodul, mis toob andmed Supabase andmebaasist Python keskkonda
.

**API integratsioon**: Kasutasin supabase-py SDK-d, et luua funktsioonid fetch_sales(), fetch_customers() ja fetch_products()
.

**Turvalisus**: nõutud turvastandardeid, hoides API-võtmeid .env failis, et need ei lekiks GitHub-i
.

**Veakäsitlus**: Lisasin retry-loogika ja exponential backoff mustri, et pipeline ei jookseks kokku ajutiste võrgukatkestuste korral
.
### Roll D: Süsteemi orkestreerimine (pipeline.py)

Minu ülesandeks oli olla süsteemi "dirigent", kes paneb kõik osad ühtselt tööle
.

**Moodulite ühendamine**: Sidusin Roll A hankijad ja Roll B/C töötlejad üheks terviklikuks ETL (Extract-Transform-Load) protsessiks
.

**Paindlikkus**: Lisasin käsurea argumendid (nt --date ja --format), mis võimaldavad analüüsi parameetreid muuta ilma koodi ennast puutumata
.

**Logimine**: Asendasid tavalised print() laused professionaalse logging mooduliga, mis salvestab süsteemi ajaloo ja vead "musta kasti" faili


**Programmi käivitamine** : python pipeline.py --date kuupäev

### AI kasutamine :
Kasutasin AI abi ülesannete koodide koostamiseks , eriti pipeline.py jaoks, mis oli uus käsitlus, samuti log failide koostamisel.

Koostaas: Tiiu Kumar 13.08.2026
