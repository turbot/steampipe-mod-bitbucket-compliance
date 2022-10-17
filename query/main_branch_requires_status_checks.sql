with my_repo as (
  select
    full_name as full_name,
    mainbranch ->> 'Name' as main_branch_name
  from
    bitbucket_my_repository
), branch_restriction as (
  select
    kind,
    r.full_name as full_name
  from
    my_repo as r,
    bitbucket_branch_restriction as br
  where
    repository_full_name = r.full_name
    and br.pattern = r.main_branch_name
    and br.kind = 'enforce_merge_checks'
)
select
  -- Required Columns
  r.full_name as resource,
  case
    when br.kind is not null then 'ok'
    else 'alarm'
  end as status,
    r.full_name || ' default branch ' || r.main_branch_name || case when(br.kind is not null) then ' requires ' else ' does not require ' end || 'status checks.' as reason,
  -- Additional Dimensions
  r.full_name
from
  my_repo as r
  left join branch_restriction as br on br.full_name = r.full_name;
  