
-- ensure nd-lookup-update.sql is running
-- then run this query
-- many different values will be returned from the not_deterministic() function


with get_sec as (
	select not_deterministic(2) sec from dual
)
select distinct sec from (
	select s.sec
	from get_sec s,
	(
		select a.depth * b.depth
		from (
			select level depth
			from dual
			connect by level <= 1000
		) a,
		(
			select level depth
			from dual
			connect by level <= 1000
		) b
	)
)
/

