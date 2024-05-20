declare @i int = 0

create table #dateFormat ( date_form varchar(50), format_code int, curr_date datetime )


	insert into #dateFormat select convert(varchar, getdate(), 0  ),0  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 1  ),1  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 2  ),2  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 3  ),3  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 4  ),4  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 5  ),5  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 6  ),6  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 7  ),7  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 8  ),8  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 9  ),9  ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 10 ),10 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 11 ),11 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 12 ),12 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 13 ),13 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 14 ),14 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 20 ),20 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 21 ),21 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 22 ),22 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 23 ),23 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 24 ),24 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 25 ),25 ,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 101),101,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 102),102,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 103),103,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 104),104,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 105),105,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 106),106,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 107),107,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 108),108,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 109),109,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 110),110,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 111),111,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 112),112,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 113),113,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 114),114,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 120),120,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 121),121,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 126),126,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 127),127,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 130),130,getdate() 
	insert into #dateFormat select convert(varchar, getdate(), 131),131,getdate()

select format_code, curr_date, date_form from #dateFormat order by format_code

drop table #dateFormat

select 'convert( varchar, convert( time, getdate()) ,0 ) =>' sql_code, convert(varchar, convert(time, dateadd(hh, 12, getdate())), 0) result