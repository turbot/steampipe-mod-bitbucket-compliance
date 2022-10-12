with my_repo as (
  select
    full_name as full_name,
    mainbranch ->> 'Name' as main_branch_name
  from
    bitbucket_my_repository
), branch_restriction_1 as (
  select
    r.full_name as full_name
  from
    my_repo as r,
    bitbucket_branch_restriction as br1
  where
    repository_full_name = r.full_name
    and br1.pattern = r.main_branch_name
    and type = 'branchrestriction'
    and kind = 'require_no_changes_requested'
) , branch_restriction_2 as (
  select
    r.full_name as full_name
  from
    my_repo as r,
    bitbucket_branch_restriction as br2
  where
    repository_full_name = r.full_name
    and br2.pattern = r.main_branch_name
    and type = 'branchrestriction'
    and kind = 'require_tasks_to_be_completed'
)
select
  -- Required Columns
  r.full_name as resource,
  case
    when (br1.full_name is not null and br2.full_name is not null) then 'ok'
    else 'alarm'
  end as status,
    r.full_name || ' default branch ' || r.main_branch_name || case when (br1.full_name is not null and br2.full_name is not null) then ' has ' else ' does not have ' end || 'open Git branches up to date.' as reason,
  -- Additional Dimensions
  r.full_name
from
  my_repo as r
  left join branch_restriction_1 as br1 on br1.full_name = r.full_name
  left join branch_restriction_2 as br2 on br2.full_name = r.full_name;
  