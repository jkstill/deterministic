
-- this is a lookup table to demonstrate how a function
-- that queries data is not deterministic

create table nd_lookup ( c1 number );

insert into nd_lookup values(1);

commit;


