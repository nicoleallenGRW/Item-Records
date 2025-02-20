SELECT 
item_record_property.call_number_norm AS "call #",
  bib_view.title AS "Title",
  item_view.barcode AS "Barcode", 
  item_view.location_code As "Location", 
  item_view.checkout_total AS "Total Check-out",
  TO_CHAR (bib_view.cataloging_date_gmt, 'mm/dd/yyyy' ) AS "Cat Date",
  item_view.item_status_code AS "Status"

FROM 
  sierra_view.bib_view, 
  sierra_view.bib_record_item_record_link, 
  sierra_view.item_view,
  sierra_view.item_record_property

WHERE 
  (bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'perj'
  AND item_record_property.item_record_id = item_view.id)

AND

(bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'per'
  AND item_record_property.item_record_id = item_view.id)

AND
   (bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'perr'
  AND item_record_property.item_record_id = item_view.id)

AND

   (bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'prnew'
  AND item_record_property.item_record_id = item_view.id)

AND
      (bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'rpr'
  AND item_record_property.item_record_id = item_view.id)

  AND

      (bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'prstr'
  AND item_record_property.item_record_id = item_view.id)

AND
      (bib_view.id = bib_record_item_record_link.bib_record_id AND
  bib_record_item_record_link.item_record_id = item_view.id AND
  item_status_code = '$' AND item_view.location_code != 'jper'
  AND item_record_property.item_record_id = item_view.id)

ORDER BY item_record_property.call_number_norm ASC 