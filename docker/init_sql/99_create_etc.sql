CREATE MATERIALIZED VIEW player_info AS
select
 "選手"."ドラフト年" as "year"
 , "選手"."ドラフトチーム" as "team"
 , "選手"."ドラフト順目" as "draft_rank"
 , "選手"."選手ID" as "player_id"
 , "選手"."選手名" as "player_name"
 , "summary_salary"."summary"
 , "summary_salary"."max_salary"
 , "this_year_salary"."年俸" as "this_year"
 , case
    when "last_year_salary"."last_salary" < date_part('year', current_date) then "last_year_salary"."last_salary"
    else 0
   end as "retire"
from public."選手"
left join (
 select
  "選手ID"
  , SUM("年俸") AS "summary"
  , MAX("年俸") AS "max_salary"
 from public."年俸"
 group by
  "年俸"."選手ID"
) as "summary_salary" on
"summary_salary"."選手ID" = public."選手"."選手ID"
left join (
 select
  "選手ID"
  , "年俸"
 from public."年俸"
 where "年度" = date_part('year', current_date)
) as "this_year_salary" on
"this_year_salary"."選手ID" = public."選手"."選手ID"
left join (
 select
  "選手ID"
  , MAX("年度") as "last_salary"
 from public."年俸"
 group by
  "選手ID"
) as "last_year_salary" on
"last_year_salary"."選手ID" = public."選手"."選手ID" ;