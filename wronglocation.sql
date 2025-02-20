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
  ((itemrecprop.call_number_norm between '000' and '329.999' and item.location_code like 'gm%' and item.location_code <> 'gmad1' and item.location_code <> 'gmnew' and item.location_code <> 'gmoff')
   or (itemrecprop.call_number_norm between '330' and '339.999' and item.location_code like 'gm%' and item.location_code <> 'gmpba' and item.location_code <> 'gmnew')
   or (itemrecprop.call_number_norm between '340' and '649.999' and item.location_code like 'gm%' and item.location_code <> 'gmad1' and item.location_code <> 'gmnew')
  or (itemrecprop.call_number_norm between '650' and '659.999' and item.location_code like 'gm%' and item.location_code <> 'gmpba' and item.location_code <> 'gmnew')
    or (itemrecprop.call_number_norm between '660' and '699.999' and item.location_code like 'gm%' and item.location_code <> 'gmad1' and item.location_code <> 'gmnew')
   or (itemrecprop.call_number_norm between '900' and '999.999' and item.location_code like 'gm%' and item.location_code <> 'gmad1' and item.location_code <> 'gmnew')  
   or (itemrecprop.call_number_norm like 'dvd%' and item.location_code like 'gm%' and item.location_code <> 'gmdvd' and item.location_code <> 'gmoff') 
      or (itemrecprop.call_number_norm like 'dvd%' and item.location_code like 'gb%' and item.location_code <> 'gbadu' and item.location_code <> 'gmoff') 
or (itemrecprop.call_number_norm like 'j dvd%' and item.location_code like 'gb%' and item.location_code <> 'gbjuv' and item.location_code <> 'gmoff') 
      or (itemrecprop.call_number_norm like 'dvd%' and item.location_code like 'gc%' and item.location_code <> 'gcadu' and item.location_code <> 'gmoff') 
or (itemrecprop.call_number_norm like 'j dvd%' and item.location_code like 'gc%' and item.location_code <> 'gcjuv' and item.location_code <> 'gmoff') 
   or (itemrecprop.call_number_norm like 'blu%' and item.location_code like 'gm%' and item.location_code <> 'gmdvd' and item.location_code <> 'gmoff') 
  or (itemrecprop.call_number_norm like 'fiction%' and item.location_code like 'gm%' and item.location_code <> 'gmad2' and item.location_code <> 'gmoff' and item.location_code <> 'gmnew')
  or (itemrecprop.call_number_norm like 'pbk%' and item.location_code like 'gm%' and item.location_code <> 'gmad1' and item.location_code <> 'gmoff')
  or (itemrecprop.call_number_norm like 'lt%' and item.location_code like 'gm%' and item.location_code <> 'gmpba' and item.location_code <> 'gmp' and item.location_code <> 'gmoff')
  or (itemrecprop.call_number_norm like 'j %' and item.location_code like 'gm%' and item.location_code <> 'gmjuv' and item.location_code <> 'gmcaf' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'j %' and item.location_code like 'gc%' and item.location_code <> 'gcjuv' and item.location_code <> 'gmcaf' and item.location_code <> 'gmoff')
  or (itemrecprop.call_number_norm like 'e %' and item.location_code like 'gm%' and item.location_code <> 'gmjuv' and item.location_code <> 'gmoff')
      or (itemrecprop.call_number_norm like 'j %' and item.location_code like 'gb%' and item.location_code <> 'gbjuv' and item.location_code <> 'gmcaf' and item.location_code <> 'gmoff')
  or (itemrecprop.call_number_norm like 'e %' and item.location_code like 'gb%' and item.location_code <> 'gbjuv' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'e %' and item.location_code like 'gc%' and item.location_code <> 'gcjuv' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'e- %' and item.location_code like 'gm%' and item.location_code <> 'gmjuv' and item.location_code <> 'gmoff')
	or (itemrecprop.call_number_norm like 'e- %' and item.location_code like 'gc%' and item.location_code <> 'gcjuv' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm between '700' and '779.9999'  and item.location_code like 'gm%' and item.location_code <> 'gmad2' and item.location_code <> 'gmnew' and item.location_code <> 'gmoff')
  or (itemrecprop.call_number_norm between '780' and '789.9999'  and item.location_code like 'gm%' and item.location_code <> 'gmpmu' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm between '790' and '899.9999'  and item.location_code like 'gm%' and item.location_code <> 'gmad2' and item.location_code <> 'gmnew' and item.location_code <> 'gmoff') 
 or (itemrecprop.call_number_norm like 'ya %' and item.location_code like 'gm%' and item.location_code <> 'gmya' and item.location_code <> 'gmoff')
  or (itemrecprop.call_number_norm like 'comp%' and item.itype_code_num = '2' and item.location_code like 'gm%' and item.location_code <> 'gmpmu' and item.location_code <> 'gmoff')
   or (itemrecprop.call_number_norm like 'music%' and item.location_code like 'gm%' and item.location_code <> 'gmpmu' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'libre%' and item.location_code like 'gm%' and item.location_code <> 'gmpmu' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'mystery%' and item.location_code like 'gm%' and item.location_code <> 'gmad2' and item.location_code <> 'gmoff' and item.location_code <> 'gmnew')
    or (itemrecprop.call_number_norm like 'sci%' and item.location_code like 'gm%' and item.location_code <> 'gmad2' and item.location_code <> 'gmnew')
    or (itemrecprop.call_number_norm like 'short%' and item.location_code like 'gm%' and item.location_code <> 'gmad2' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'jpn%' and item.location_code like 'gm%' and item.location_code <> 'gmwor' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'japanese%' and item.location_code like 'gm%' and item.location_code <> 'gmwor' and item.location_code <> 'gmoff')
    or (itemrecprop.call_number_norm like 'spa%' and item.location_code like 'gm%' and item.location_code <> 'gmwor' and item.location_code <> 'gmoff' )
    or (itemrecprop.call_number_norm like 'fre%' and item.location_code like 'gm%' and item.location_code <> 'gmwor' and item.location_code <> 'gmoff' )
    or (itemrecprop.call_number_norm like 'ita%' and item.location_code like 'gm%' and item.location_code <> 'gmwor' and item.location_code <> 'gmoff' )
    or (itemrecprop.call_number_norm like 'ger%' and item.location_code like 'gm%' and item.location_code <> 'gmwor' and item.location_code <> 'gmoff' )
) and item.item_status_code <> 'm' 
order by
itemrecprop.call_number_norm ASC;