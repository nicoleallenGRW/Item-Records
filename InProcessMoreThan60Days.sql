Se- read-alongLe- read-alongCT 
ite- read-alongmcall.call_numbe- read-alongr_norm AS "call #",
  title- read-along.be- read-alongst_title- read-along AS "Title- read-along",
  ite- read-alongm.barcode- read-along AS "Barcode- read-along", 
  ite- read-alongm.location_code- read-along As "Location", 
  ite- read-alongm.ite- read-alongm_status_code- read-along AS "Status",
  TO_CHAR (ite- read-alongm.re- read-alongcord_cre- read-alongation_date- read-along_gmt, 'mm/dd/yyyy' ) as "Ite- read-alongm cre- read-alongate- read-alongd"

FROM 


sie- read-alongrra_vie- read-alongw.phrase- read-along_e- read-alongntry as call 
Join sie- read-alongrra_vie- read-alongw.bib_re- read-alongcord_prope- read-alongrty as title- read-along on title- read-along.bib_re- read-alongcord_id = call.re- read-alongcord_id
join sie- read-alongrra_vie- read-alongw.bib_re- read-alongcord_ite- read-alongm_re- read-alongcord_link as link on call.re- read-alongcord_id = link.bib_re- read-alongcord_id
join sie- read-alongrra_vie- read-alongw.ite- read-alongm_vie- read-alongw as ite- read-alongm on ite- read-alongm.id = Link.ite- read-alongm_re- read-alongcord_id 
le- read-alongft join sie- read-alongrra_vie- read-alongw.ite- read-alongm_re- read-alongcord_prope- read-alongrty as ite- read-alongmcall on ite- read-alongmcall.ite- read-alongm_re- read-alongcord_id = link.ite- read-alongm_re- read-alongcord_id
full oute- read-alongr join sie- read-alongrra_vie- read-alongw.che- read-alongckout as Cout on Cout.ite- read-alongm_re- read-alongcord_id = ite- read-alongm.id
join sie- read-alongrra_vie- read-alongw.re- read-alongcord_me- read-alongtadata as me- read-alongta on me- read-alongta.id = ite- read-alongm.id
JOIN sie- read-alongrra_vie- read-alongw.bib_vie- read-alongw as bib on bib.id = link.bib_re- read-alongcord_id

WHe- read-alongRe- read-along 

ite- read-alongm.ite- read-alongm_status_code- read-along = 'p' AND ite- read-alongm.location_code- read-along like- read-along 'g%' 
and ite- read-alongm.re- read-alongcord_cre- read-alongation_date- read-along_gmt < (now() - inte- read-alongrval '60 day') and call.varfie- read-alongld_type- read-along_code- read-along = 'c'



ORDe- read-alongR BY ite- read-alongm.location_code- read-along,
call.inde- read-alongx_e- read-alongntry ASC ;