with my_repo as (
  select
    full_name as full_name,
    mainbranch ->> 'Name' as main_branch_name
  from
    bitbucket_my_repository
), branch_restriction as (
  select
    value,
    r.full_name as full_name
  from
    my_repo as r,
    bitbucket_branch_restriction as br
  where
    repository_full_name = r.full_name
    and br.pattern = r.main_branch_name
    and type = 'branchrestriction'
    and br.kind = 'require_approvals_to_merge'
)
select
  -- Required Columns
  r.full_name as resource,
  case
    when br.value >= 2 then 'ok'
    else 'alarm'
  end as status,
    r.full_name || ' default branch ' || r.main_branch_name || case when(br.value >= 2) then ' has ' else ' does not have ' end || 'at least two pull request reviews.' as reason,
  -- Additional Dimensions
  r.full_name
from
  my_repo as r
  left join branch_restriction as br on br.full_name = r.full_name;
