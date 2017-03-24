
-- this function is deterministic
-- the return value from is_deterministic(2) will always be 4

create or replace function is_deterministic ( n_in number) return number
deterministic is
begin
	return n_in * 2;
end;
/

show error function is_deterministic

