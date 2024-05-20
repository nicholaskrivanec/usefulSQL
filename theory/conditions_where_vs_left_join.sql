
create table #person 
	( person_id int,	first_name varchar(50)	,last_name varchar(50) )
insert into #person values
	( 100,				'Bruce',				'Wayne'	),
	( 101,				'Harvey',				'Dent'	),
	( 102,				'Average',				'Joe'	),
	( 103,				'Tony',					'Stark' )

create table #role
	( role_id int 	,role_code varchar(50)	,role_descr varchar(50)	)
insert into #role values
	( 200,			'Billionaire',			'Billionaire Playboy'	),
	( 201,			'HG',					'Homeless Guy'			),
	( 202,			'DA',					'District Attorney'		)

create table #person_2_role 
	( person_id int,	role_id int	)
insert into #person_2_role values
	( 100,				200 ),
	( 100,				201 ), 
	( 101,				202 ),
	( 103,				200 )




select 
	p.first_name,
	p.last_name,
	r.role_code,
	r.role_descr
from
	#person p
left join
	#person_2_role p2r on p2r.person_id = p.person_id and p2r.role_id = 200
left join
	#role r on r.role_id = p2r.role_id

select 
	p.first_name,
	p.last_name,
	r.role_code,
	r.role_descr
from
	#person p
left join
	#person_2_role p2r on p2r.person_id = p.person_id 
left join
	#role r on r.role_id = p2r.role_id
where
	p2r.role_id = 200



drop table #person
drop table #role
drop table #person_2_role


