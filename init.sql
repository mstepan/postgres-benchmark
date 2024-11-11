DROP TABLE IF EXISTS asset;

CREATE TABLE asset (
    id BIGSERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    c1 INTEGER,
    c2 INTEGER,
    c3 INTEGER,
    price INTEGER
);

insert into asset(owner_id, c1, c2, c3, price)
select
	round(random() * 10000), -- owner_id
	round(random() * 1000000), -- c1
	round(random() * 1000000), -- c2
	round(random() * 1000000), -- c3
	round(random() * 1000000)  -- price
from generate_series(1, 600000);


insert into asset(owner_id, c1, c2, c3, price)
select
	round(random() * 10000), -- owner_id
	round(random() * 1000000), -- c1
	round(random() * 1000000), -- c2
	round(random() * 1000000), -- c3
	NULL -- price
from generate_series(600001, 1000000);


create index asset_c1_idx on asset(c1);
create index asset_c2_idx on asset(c2);
create index asset_c3_idx on asset(c3);

-- Single column index
create index asset_owner_id_idx on asset using btree(owner_id);

-- Multi-column index
--create index asset_owner_id_price_idx on asset using btree(owner_id, price);

-- Partial index
-- create index asset_owner_id_idx on asset using btree(owner_id) where price is not NULL;

-- Covering index
-- create index asset_owner_id_idx on asset using btree(owner_id) include(price);

-- Partial, Covering index
-- create index asset_owner_id_idx on asset using btree(owner_id) include(price) where price is not NULL;

