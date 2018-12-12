SELECT * FROM group_master

select * from INFORMATION_SCHEMA.COLUMNS
where  --COLUMN_NAME LIKE '%uom%'
--and
 TABLE_NAME ='uom_master'

SELECT   invoicenumber , ponumber, assetdesc FROM hardware_register
INTERSECT
SELECT [Invoice Number] , [PO number], [Description]  FROM inteva_daily

GO

SELECT distinct  inteva_id, [Invoice Number] ,[Invoice date], [PO number], [Po date], Vendor as [Vendor name ], [Currency], isnull(subloc_name,'-') as [Site] ,
i.[Location] as [City ], isnull( group_name,'-') as [Group ], isnull(subgroup_name,'-' )as [Sub Group],isnull(div_name,'-') as[BU name],isnull(costcenter_name,'-') as [Cost Center], isnull(unit_name,'-') as [UOM ] , 
isnull(tax1_value,'0.00') as [Tax 1] ,  isnull(tax2_value,'0.00') as[Tax 2],--tax3_value as [Tax 3],--N--[Tax 4]--N--[Type of Procurement ]--N--[Delivery Date]--N 
Quantity ,[Unit Price], isnull(bond_no,'-') as [Bond Number], isnull(bond_date,'1900-01-01') as [Bond Date],
Vendor as [Procured vendor ],  isnull( v.vendor_name,'-') as [Service Vendor],  isnull(manufacturer,'-') as Manufacturer,  isnull( model_no ,'-') as [Model Number], 
[Description] as [Asset Description],  isnull(asset_remarks,'-') as [Asset Remarks] --N
FROM  inteva_daily i 
left JOIN hardware_register h
ON i.[Invoice Number]=h.invoicenumber and i.[PO number]=h.ponumber and i.[Description]=h.assetdesc
left join group_master g
on g.group_id=h.group_id
left join subgroup_master sg
on sg.subgroup_id =h.subgroup_id
left join sublocation_master sl
on sl.subloc_id=h.subloc_id
left join vendor_master v
on v.vendor_id=h.service_vendor_id
left join division_master d
on d.div_id=h.bu_id
left join costcenter_master c
on c.costcenter_id= h.costcenter_id
left join uom_master u
on u.unit_id=h.uom_id



go

select * from sublocation_master

