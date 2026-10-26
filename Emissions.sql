-- Emissions Per Location --

select
  latitude,
  longitude,
  `GHG emissions mtons CO2e` as Emissions
from
  emissions_data;

-- Emissions Per Person --

select
  county_state_name,
  population,
  cast(replace(`GHG emissions mtons CO2e`, ',', '') as double) as Emissions,
  cast(replace(`GHG emissions mtons CO2e`, ',', '') as double) / population as Emissions_per_person
from
  emissions_data
where
  population > 0
order by
  Emissions_per_person desc;

-- Emissions Per State --

select
  state_abbr,
  sum(cast(replace(`GHG emissions mtons CO2e`, ',', '') as double)) as Total_Emissions
from
  emissions_data
group by
  state_abbr
order by
  Total_Emissions desc
limit 10;

-- Emissions Per County Name --

select county_state_name,
  population,
  cast(replace(`GHG emissions mtons CO2e`, ',', '') as double) as Total_Emissions
from emissions_data
order by Total_Emissions desc
limit 10;