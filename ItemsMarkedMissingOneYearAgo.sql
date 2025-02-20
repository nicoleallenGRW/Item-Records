SELECT 
  item_record_property.call_number_norm as "Call number",
  bib_record_property.best_title_norm as "Title",
  bib_record_property.best_Author_norm as "Author",
  item_view.barcode AS "Barcode", 
  item_view.checkout_total as "Total Checkout", 
  item_view.renewal_total as "Total Renewal", 
  item_view.last_checkin_gmt as "Last Checkin",  
  record_metadata.creation_date_gmt as "Created Date", 
  record_metadata.record_last_updated_gmt as "Last Updated", 
  item_view.item_status_code as "Item Status" 
  
FROM 
  sierra_view.item_view, 
  sierra_view.item_record_property, 
  sierra_view.record_metadata, 
  sierra_view.bib_record_property, 
  sierra_view.bib_view, 
  sierra_view.bib_record_item_record_link
WHERE 
  item_record_property.item_record_id = item_view.id AND
  record_metadata.id = item_view.id AND
  bib_record_property.bib_record_id = bib_view.id AND
  bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id and item_status_code = 'm' and item_view.location_code like 'g%' and 
  ((record_metadata.record_last_updated_gmt::date - current_date)between -395 and -365)

  order by
item_record_property.call_number_norm;
