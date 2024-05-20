use tn_dpdc
go

select distinct 
	ct2.case_id	
	,substring  ( 
			(
				select isnull(', ' + convert(varchar, ct1.sub_id) ,'') as [text()]
				from case_team ct1
				where ct1.case_id = ct2.case_id
				order by ct1.case_id
				for xml path('')
			), 2, 1000
	) [team_members]
from
	case_team ct2
inner join
	cases c on c.case_id = ct2.case_id 
where
	c.organization_id = 1331

