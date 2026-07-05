# Nädal 2: UrbanStyle'i andmete puhastamine ja kvaliteedikontroll
## Projekti ülevaade
Selle nädala eesmärk oli korrastada müügi- ja kliendiandmed, et valmistuda juhatuse koosolekuks
Andmebaas sisaldas üle 5000 duplikaadi, puuduvaid väärtusi ja vigaseid kuupäevi, mis moonutasid ärianalüüsi
Kasutatud tööriistad
. SQL (PostgreSQL) 
. Supabase 
. GitHub 

## Tehtud sammud

1. Turvalise töökeskkonna loomine

Lõin esmalt originaaltabelitest test-koopiad (test_sales ja test_customers)
See tagas, et algandmed säilisid puutumatuna.

2. Duplikaatide eemaldamine

Tuvastasin invoice_id põhjal üle 5000 duplikaatse rea, kasutades GROUP BY ja HAVING funktsioone
Duplikaadid eemaldasin DELETE käsu ja ROW_NUMBER() aknafunktsiooni abil, jättes alles vaid unikaalsed kirjed

3. NULL väärtuste ja tekstide ühtlustamine

Puuduvad kliendinimed ja e-mailid saab asendada väärtusega 'tundmatu', kasutades COALESCE() funktsiooni
 (ei teinud)
Ühtlustasin linnade nimetused (nt "tallinn" -> "Tallinn"), kasutades TRIM() ja INITCAP() funktsioone

4. Kuupäevade valideerimine

Kontrollisin müügikuupäevi CASE WHEN lausega, et tuvastada ebaloogilised kanded (tuleviku kuupäevad või kanded enne ettevõtte asutamist 2020. aastal)
. Tuleviku kuupäevi ei olnud.

## Tulemused ja äriline mõju

Andmete puhastamise tulemusena on UrbanStyle'i raportid nüüd usaldusväärsed:
Duplikaatide eemaldamine: Vähendas näiliselt ülepaisutatud müüginumbreid umbes 33%, andes  ausa pildi ettevõtte käibest
.
Andmete kvaliteet: Ühtlustatud kliendiandmed võimaldavad  pakkuda paremat personaalset teenindust
Meeskonna koondraport : https://github.com/silvervarusk/Sales-Analytics/blob/main/02_Sustainability_Analysis/week2_team_cleaning_report.md


Koostas : Tiiu Kumar 05.07.2026
