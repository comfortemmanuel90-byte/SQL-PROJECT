use sql_project;

select * from `p9-consolegames`;
select * from `p9-consoledates`;

select
round(sum(na_sales)/sum(na_sales+eu_sales+jp_sales+other_sales)* 100,2)
as na_sales_percentage
from `p9-consolegames`;

create view game_titles_view as
select
name,
platform,
year
from `p9-consolegames`;

select * from game_titles_view
order by
platform asc,
year desc;

select
name,
publisher,
left(publisher,4) as publisher_prefix
from `p9-consolegames`;

describe `p9-consoledates`;

select
platform,
'firstretailavailability'
from `p9-consoledates`
where
month('FirstRetailAvailability') in (11,12);

describe `p9-consoledates`;

select
platform,
'FirstRetailAvailability'
'Discontinued',
datediff('Discontinued', 'FirstRetailAvailabilty') as
longevity_days
from `p9-consoledates`
order by longevity_days asc;

alter table `p9-consolegames`
add year_date date;

set sql_safe_updates =0;

update `p9-consolegames`
set year_date = concat(`year`,'-01-01')
where `year` is not null;

describe `p9-consolegames`;

select * 
from `p9-consolegames`
where
publisher is null
or year is null
or na_sales is null;

update `p9-consolegames`
set publisher = 'unknown'
where publisher is null;



