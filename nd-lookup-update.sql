

-- constantly update the lookup table
-- used as part of the demo that shows how
-- the return value of a function can return different values
-- when it must query data for calculation

begin
	for i in 1 .. 100000
	loop
		update nd_lookup set c1 = i;
		commit;
		dbms_lock.sleep(.1);
	end loop;
end;
/

