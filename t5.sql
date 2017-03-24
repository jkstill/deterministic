
-- the MATERIALIZE hint will have the same effect as scalar subquery caching
-- it is also quite fast

with get_sec as (
	select /*+ materialize */ not_deterministic(2) sec from dual
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

