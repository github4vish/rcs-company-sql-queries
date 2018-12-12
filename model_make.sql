select * from par
select * from far

select make, model , * from far

--alter table far 
--add   make   varchar(max)  null , model  varchar(max)  null 

select * from par

select distinct  model from  par
where model is not null



--SELECT  make ,model from far
--intersect
--select [BRAND/MAKE],model from par



select distinct f.*, p.[BRAND/MAKE],p.model from far f
join par p
on f.make= p.[BRAND/MAKE]
and f.model=p.model
where f.make !='NA'
and f.model!='NA'
order by f.id



--where f.make!= p.[BRAND/MAKE]
--and f.model!=p.model



--model from par
	

	
--SELECT * 	--MODEL
--NILKAMAL	N/A
--DROP TABLE PAR
--DROP TABLE FAR

SELECT * INTO #PAR FROM PAR

INSERT INTO PAR 
([DATE],[STATE],[CITY],[SITE],[BUILDING ],[FLOOR],[WORK AREA/CUBICAL NUMBER],[ASSET CLASS(TYPE)],[ASSET GROUP(CATOGERY)],[ASSET DISCRIPTION],[BRAND/MAKE],[MODEL],[SERIAL NUMBER],[EMPLOYEE NAME],[EMPLOYEE ID],[TAGGABLE/NON-TAGGABLE],[RCS ID],[A#E NAME],[MAHINDRA SPOC NAME],[STATUS],[RECO REMARKS])
SELECT [DATE],[STATE],[CITY],[SITE],[BUILDING ],[FLOOR],[WORK AREA/CUBICAL NUMBER],[ASSET CLASS(TYPE)],[ASSET GROUP(CATOGERY)],[ASSET DISCRIPTION],[BRAND/MAKE],[MODEL],[SERIAL NUMBER],[EMPLOYEE NAME],[EMPLOYEE ID],[TAGGABLE/NON-TAGGABLE],[RCS ID],[A#E NAME],[MAHINDRA SPOC NAME],[STATUS],[RECO REMARKS]
 FROM  #PAR


 insert into far
(
[ASSET_NAME],[SERIAL_NO],[SERIAL_NO_2],[ASSET_DESCRIPTION],[GROUP_NAME],[SUBGROUP_NAME],[quantity],[PO_NO],[CITY],[WORKAREA],[TAGGABLENON_TAGGABLE],[Remarks],[PREFIX],[F14],[F15],[make],[model])
SELECT  [ASSET_NAME],[SERIAL_NO],[SERIAL_NO_2],[ASSET_DESCRIPTION],[GROUP_NAME],[SUBGROUP_NAME],[quantity],[PO_NO],[CITY],[WORKAREA],[TAGGABLENON_TAGGABLE],[Remarks],[PREFIX],[F14],[F15],[make],[model]
 FROM #FAR


