
create table #nums (nbr int) 
create table #nums2 (nbr int) 
insert into #nums values (1),(5),(3),(2),(0),(1),(1)
insert into #nums2 values (1),(7),(13),(9),(2),(45),(8)

	select * from #nums 
UNION
	select * from #nums2
order by 
	nbr

drop table #nums
drop table #nums2