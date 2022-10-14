with my_repo as (
  select
    full_name,
    mainbranch ->> 'Name' as main_branch_name
  from
    bitbucket_my_repository
),
default_reviewers as (
  select
    distinct reviewer ->> 'Uuid' as rev
  from
    bitbucket_my_repository as r,
    jsonb_array_elements(default_reviewers) as reviewer
),
pull_request as (
  select
    p.author_uuid,
    p.repository_full_name as name,
    p.author_display_name,
    p.description,
    p.self_link
  from
    bitbucket_pull_request as p,
    my_repo as r
  where
    p.repository_full_name = r.full_name
  order by
    p.author_uuid
)
select
  -- Required Columns
  p.self_link as resource,
  case
    when d.rev is not null then 'ok'
    else 'alarm'
  end as status,
  p.self_link || ' pull request owner ' || p.author_display_name || case when (d.rev is not null) then ' is set ' else ' is not set ' end || 'as default reviewer of pull request.' as reason,
  -- Additional Dimensions
  r.full_name as repository_full_name
from
  my_repo as r
  right join pull_request as p on p.name = r.full_name
  left join default_reviewers as d on p.author_uuid = d.rev;