
-- this test is rather useless
-- I do not recall why it is even here

with get_sec as (
	select not_deterministic(2) sec from dual
)
select count(*) from (
	select o.owner, o.object_name, o.object_type, s.sec
	from dba_objects o, get_sec s
)
/

