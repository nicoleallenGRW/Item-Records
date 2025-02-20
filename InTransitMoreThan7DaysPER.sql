SELECT 
item_record_property.call_number_norm AS "call #",
  bib_view.title AS "Title",
  item_view.barcode AS "Barcode", 
  item_view.location_code As "Location", 
 TO_CHAR(record_metadata.record_last_updated_gmt, 'MM/DD/YYYY') as "last updated",
  varfield_view.field_content

FROM 
  sierra_view.bib_view, 
  sierra_view.bib_record_item_record_link, 
  sierra_view.item_view,
  sierra_view.item_record_property,
  sierra_view.record_metadata,
  sierra_view.varfield_view

WHERE 

 (bib_view.id = bib_record_item_record_link.bib_record_id 
  AND item_view.id = record_metadata.id 
  AND bib_record_item_record_link.item_record_id = item_view.id 
  AND varfield_view.record_id = item_view.id 
  and varfield_view.varfield_type_code = 'm'
  AND item_status_code = 't' 
  AND item_view.checkin_statistics_group_code_num between 700 and 799
  AND item_record_property.item_record_id = item_view.id 
  AND 
  ((record_metadata.record_last_updated_gmt::date - current_date)between -100 and -7)) and item_view.location_code != 'gmill'

  or

   (bib_view.id = bib_record_item_record_link.bib_record_id 
  AND item_view.id = record_metadata.id 
  AND bib_record_item_record_link.item_record_id = item_view.id 
  AND varfield_view.record_id = item_view.id 
  and varfield_view.varfield_type_code = 'm'
  and item_status_code = 't' 
  AND item_view.location_code like '%per%'
  AND item_record_property.item_record_id = item_view.id 
  AND 
  ((record_metadata.record_last_updated_gmt::date - current_date)between -100 and -7)) and item_view.location_code != 'gmill'

 or

   (bib_view.id = bib_record_item_record_link.bib_record_id 
  AND item_view.id = record_metadata.id 
  AND bib_record_item_record_link.item_record_id = item_view.id 
  AND varfield_view.record_id = item_view.id 
  and varfield_view.varfield_type_code = 'm'
  and varfield_view.varfield_type_code like '%bpn%'
  and item_status_code = 't' 
  AND item_record_property.item_record_id = item_view.id 
  AND 
  ((record_metadata.record_last_updated_gmt::date - current_date)between -100 and -7)) and item_view.location_code != 'gmill'

  or

   (bib_view.id = bib_record_item_record_link.bib_record_id 
  AND item_view.id = record_metadata.id 
  AND bib_record_item_record_link.item_record_id = item_view.id 
  AND varfield_view.record_id = item_view.id 
  and varfield_view.varfield_type_code = 'm'
  and varfield_view.varfield_type_code like '%lsw%'
  and item_status_code = 't' 
  AND item_record_property.item_record_id = item_view.id 
  AND 
  ((record_metadata.record_last_updated_gmt::date - current_date)between -100 and -7)) and item_view.location_code != 'gmill'

  
  order by

item_record_property.call_number_norm ASC;
  
