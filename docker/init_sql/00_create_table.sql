create table "年俸" (
  id text not null
  , "選手ID" text not null
  , "年度" integer not null
  , "年俸" integer not null
  , "チーム" text not null
  , "背番号" text not null
  , constraint "年俸_PKC" primary key (id)
) ;

create table "選手" (
  "選手ID" text not null
  , "選手名" text not null
  , "ドラフトチーム" text not null
  , "ドラフト年" integer not null
  , "ドラフト順目" integer not null
  , "誕生日" text not null
  , constraint "選手_PKC" primary key ("選手ID")
) ;