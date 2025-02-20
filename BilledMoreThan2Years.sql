SELECT 
  call.index_entry,
  title.best_title AS "Title",
  item.barcode AS "Barcode", 
  item.location_code As "Location", 
  item.checkout_total AS "Total Check-out",
  TO_CHAR (bib.cataloging_date_gmt, 'mm/dd/yyyy' ) AS "Cat Date",
  item.item_status_code AS "Status",
  cout.due_gmt as "due date",
  count(hold.record_id),
  concat(id2reckey(item.id), 'a')

FROM 


sierra_view.phrase_entry as call 
Join sierra_view.bib_record_property as title on title.bib_record_id = call.record_id
join sierra_view.bib_record_item_record_link as link on call.record_id = link.bib_record_id
join sierra_view.item_view as item on item.id = Link.item_record_id 
left join sierra_view.item_record_property as itemcall on itemcall.item_record_id = link.item_record_id
full outer join sierra_view.checkout as Cout on Cout.item_record_id = item.id
join sierra_view.record_metadata as meta on meta.id = item.id
JOIN sierra_view.bib_view as bib on bib.id = link.bib_record_id
left join sierra_view.hold as hold on hold.record_id = bib.id

WHERE 

item.item_status_code = 'n' AND item.location_code not like 'p%' AND item.barcode not like '3 2021%' AND item.barcode not like '32021%' 
and cout.due_gmt < (now() - interval '712 day') and call.varfield_type_code = 'c'

group by 
  call.index_entry,
  title.best_title,
  item.barcode,
  item.location_code,
  item.checkout_total,
  TO_CHAR (bib.cataloging_date_gmt, 'mm/dd/yyyy' ),
  item.item_status_code,
  cout.due_gmt,
 hold.record_id,
 item.id


ORDER BY call.index_entry
 ;