SELECT 
  itemrecprop.call_number_norm, 
  item.barcode, 
  item.record_num,
  item.item_status_code,
  item.itype_code_num,
  bibrecprop.material_code, 
  item.location_code, 
  bibrecprop.best_title
FROM 

sierra_view.item_view as item
join sierra_view.item_record_property as ItemRecProp on ItemRecProp.item_record_id = item.id
join sierra_view.bib_record_item_record_link as BibItemLink on BibItemLink.item_record_id = item.id
join sierra_view.bib_view as BIB on BIB.id = BibItemLink.bib_record_id
Join sierra_view.bib_record_property as BibRecProp on BibRecProp.bib_record_id = bib.id

WHERE 
  ((itemrecprop.call_number_norm between '000' and '999.999' and item.itype_code_num <> '0')
  or (itemrecprop.call_number_norm like 'pbk%' and item.itype_code_num <> '0')
  or (itemrecprop.call_number_norm like 'lt%' and itemrecprop.call_number_norm <> 'lt magazine' and item.itype_code_num <> '0')
  or (itemrecprop.call_number_norm like 'express%' and item.itype_code_num <> '31' )
  or (itemrecprop.call_number_norm like 'fiction%' and item.itype_code_num <> '0' )
  or (itemrecprop.call_number_norm like 'mystery%' and item.itype_code_num <> '0' )
  or (itemrecprop.call_number_norm like 'sci%' and item.itype_code_num <> '0' and item.location_code <> 'gmloc')
  or (itemrecprop.call_number_norm like 'short%' and item.itype_code_num <> '0' and item.location_code <> 'gmloc')
  or (itemrecprop.call_number_norm like 'jpn%' and itemrecprop.call_number_norm not like 'jpn comp disc%' and item.itype_code_num <> '0')
  or (itemrecprop.call_number_norm like 'japanese%' and item.itype_code_num <> '0' and item.location_code <> 'gmloc')
  or (itemrecprop.call_number_norm like 'spa%' and itemrecprop.call_number_norm not like 'spa comp disc%' and item.itype_code_num <> '0' )
  or (itemrecprop.call_number_norm like 'ita%' and item.itype_code_num <> '0')
  or (itemrecprop.call_number_norm like 'fre%' and item.itype_code_num <> '0' )
  or (itemrecprop.call_number_norm like 'ger%' and item.itype_code_num <> '0' )
  or (itemrecprop.call_number_norm like 'graphic%' and item.itype_code_num <> '0')
  or ((itemrecprop.call_number_norm like 'dvd fea%' or itemrecprop.call_number_norm like 'blu-ray fea%')  and item.itype_code_num <> '44')
  or ((itemrecprop.call_number_norm between 'dvd 000' and 'dvd 999.9999' or itemrecprop.call_number_norm between 'blu-ray 000' and 'blu-ray 999.9999') and item.itype_code_num <> '41' ) 
  or (itemrecprop.call_number_norm between 'comp disc 780%' and 'comp disc 789.999%' and item.itype_code_num <> '2' and item.location_code like 'gm%' and bibrecprop.material_code = 'c') 
  or (itemrecprop.call_number_norm between 'comp disc f%' and 'comp disc z%' and item.itype_code_num <> '22' )
  or (itemrecprop.call_number_norm between 'ya f%' and 'ya-ms z%' and itemrecprop.call_number_norm <> 'ya magazine' and item.itype_code_num <> '17' )
  or (itemrecprop.call_number_norm between 'ya 000%' and 'ya 999.999%' and item.itype_code_num <> '17')
or (itemrecprop.call_number_norm like 'game%' and item.itype_code_num <> '62')
or (itemrecprop.call_number_norm like 'j game%' and item.itype_code_num <> '63' )
or (itemrecprop.call_number_norm between 'j 000' and 'j 999.999' and item.itype_code_num <> '20')
or ((itemrecprop.call_number_norm like 'e %' or itemrecprop.call_number_norm like 'e- %' ) and itemrecprop.call_number_norm not like 'e comp disc%' and item.itype_code_num <> '20' and item.itype_code_num <> '13' )
or ((itemrecprop.call_number_norm like 'j dvd%' or itemrecprop.call_number_norm like 'j blu-ray%') and item.itype_code_num <> '42')
or (itemrecprop.call_number_norm between 'j comp disc 780%' and 'j comp disc 789.999%' and item.itype_code_num <> '3' ) 
or (item.location_code = 'gmpmu' and itemrecprop.call_number_norm like 'comp disc%' and item.itype_code_num <> '2')
or (itemrecprop.call_number_norm not like 'comp disc%' and itemrecprop.call_number_norm not like 'language%' and itemrecprop.call_number_norm not like 'ya comp disc%' and itemrecprop.call_number_norm not like 'jpn%' and itemrecprop.call_number_norm not like 'spa%'and item.itype_code_num = '22' and item.location_code like 'gm%')
or (itemrecprop.call_number_norm not like 'j comp disc%' and item.itype_code_num = '3' ) 
or (itemrecprop.call_number_norm not like 'j dvd%' and item.itype_code_num = '42' and item.location_code like 'gm%' and item.location_code <> 'gmoff' and item.location_code <> 'gmloc')
or (itemrecprop.call_number_norm not like 'dvd feature%' and itemrecprop.call_number_norm not like 'blu-ray feature%' and item.itype_code_num = '44' and item.location_code like 'gm%' and item.location_code <> 'gmoff' and item.location_code <> 'gmloc')
or (itemrecprop.call_number_norm like 'ref%' and item.itype_code_num <> '6' and itemrecprop.call_number_norm not like 'ref newspaper' and itemrecprop.call_number_norm not like 'fine%' and itemrecprop.call_number_norm not like 'ref magazine'  and item.location_code <> 'gmoff' and item.location_code <> 'gmloc' and item.location_code <> 'gmp')
or (itemrecprop.call_number_norm not like 'ref%' and itemrecprop.call_number_norm not like 'ref newspaper' and itemrecprop.call_number_norm not like 'j ref%' and itemrecprop.call_number_norm not like 'ref magazine' and itemrecprop.call_number_norm not like 'fine%' and item.itype_code_num = '6' and item.location_code like 'gm%' and item.location_code <> 'gmoff' and item.location_code <> 'gmloc' and item.location_code <> 'gmp')
or (itemrecprop.call_number_norm like 'j ref%' and item.itype_code_num <> '6' and item.location_code like 'gm%' and itemrecprop.call_number_norm not like 'ref newspaper' and itemrecprop.call_number_norm not like 'fine%' and itemrecprop.call_number_norm not like 'ref magazine'  and item.location_code <> 'gmoff' and item.location_code <> 'gmloc' and item.location_code <> 'gmp')
or (itemrecprop.call_number_norm like 'language%' and item.itype_code_num <> '22' and item.itype_code_num <> '41' )) and item.item_status_code <> 'm'
and item.itype_code_num <> '13' and item.location_code not like 'p%' and item.location_code not like 'gmoff' and item.location_code not like 'rpr'

order by
itemrecprop.call_number_norm ASC;