
-- by encapsulating the call toe not_deterministic() in a scalar subquery, oracle will cache the results
-- as long as the function is always called with the same value, oracle will execute the function only
-- once and cache the results

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

