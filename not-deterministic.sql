

-- this function is not deterministic.
-- we may be able to declare it as deterministic, but really it is not
-- this may work for specific use cases, but could have unwanted side effects
-- when called from other code

create or replace function not_deterministic ( n_in number) return number
--deterministic 
is
	mult number;
begin
	select c1 into mult from nd_lookup;
	return n_in * mult;
end;
/

show error function not_deterministic

