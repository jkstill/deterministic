
-- the use of scalar subquery caching must be considered carefully
-- this query will always return 2 values, as oracle is executing each 
-- of the scalar subqueries separately
-- the job in the other session is continually updating the nd_lookup table


select distinct ( select not_deterministic(2) sec from dual) 
from 
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
union all
select distinct ( select not_deterministic(2) sec from dual) 
from 
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
/

