SELECT 
call.index_entry AS "call #",
  title.best_title AS "Title",
  item.barcode AS "Barcode", 
  item.location_code As "Location", 
  meta.record_last_updated_gmt as "last updated"

FROM 


sierra_view.phrase_entry as call 
Join sierra_view.bib_record_property as title on title.bib_record_id = call.record_id
join sierra_view.bib_record_item_record_link as link on call.record_id = link.bib_record_id
join sierra_view.item_view as item on item.id = Link.item_record_id 
left join sierra_view.item_record_property as itemcall on itemcall.item_record_id = link.item_record_id
full outer join sierra_view.checkout as Cout on Cout.item_record_id = item.id
join sierra_view.record_metadata as meta on meta.id = item.id
JOIN sierra_view.bib_view as bib on bib.id = link.bib_record_id

WHERE 

item.item_status_code = 'm' AND item.location_code not like 'p%' AND item.barcode not like '3 2021%' AND item.barcode not like '32021%' 
and meta.record_last_updated_gmt > (now() - interval '14 day') and call.varfield_type_code = 'c' and item.location_code like 'gm%'



ORDER BY 
item.location_code, call.index_entry ASC  ;