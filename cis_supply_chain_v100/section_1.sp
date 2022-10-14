locals {
  cis_supply_chain_v100_1_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "1"
  })
}

locals {
  cis_supply_chain_v100_1_1_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.1"
  })
  cis_supply_chain_v100_1_2_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.2"
  })
  cis_supply_chain_v100_1_3_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.3"
  })
}

benchmark "cis_supply_chain_v100_1" {
  title         = "1 Source Code"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1.md")
  children = [
    benchmark.cis_supply_chain_v100_1_1,
  ]

  tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_1_1" {
  title         = "1.1 Code Changes"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1.md")
  children = [
    control.cis_supply_chain_v100_1_1_3,
    control.cis_supply_chain_v100_1_1_4,
    control.cis_supply_chain_v100_1_1_9,
    control.cis_supply_chain_v100_1_1_10,
    control.cis_supply_chain_v100_1_1_15,
    control.cis_supply_chain_v100_1_1_16,
    control.cis_supply_chain_v100_1_1_17
  ]

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_1_3" {
  title         = "1.1.3 Ensure any change to code receives approval of two strongly authenticated users"
  description   = "Ensure that every code change is reviewed and approved by two authorized contributors who are both strongly authenticated, from the team relevant to the code change."
  sql           = query.main_branch_requires_2_pull_request_reviews.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_3.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_4" {
  title         = "1.1.4 Ensure previous approvals are dismissed when updates are introduced to a code change proposal"
  description   = "Ensure that when a proposed code change is updated, previous approvals are declined and new approvals are required."
  sql           = query.main_branch_must_dismiss_stale_approvals.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_4.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_9" {
  title         = "1.1.9 Ensure all checks have passed before merging new code"
  description   = "Before a code change request can be merged to the code base, all predefined checks must successfully pass."
  sql           = query.main_branch_requires_status_checks.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_9.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_10" {
  title         = "1.1.10 Ensure open Git branches are up to date before they can be merged into code base"
  description   = "Organizations should make sure each suggested code change is in full sync with the existing state of its origin code repository before allowing merging."
  sql           = query.main_branch_git_branches_upto_date.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_10.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_15" {
  title         = "1.1.15 Ensure pushing or merging of new code is restricted to specific individuals or teams"
  description   = "Ensure that only trusted users can push or merge new code to protected branches."
  sql           = query.main_branch_restrict_push_and_merge.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_15.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_16" {
  title         = "1.1.16 Ensure force push code to branches is denied"
  description   = "The “force push” option allows users with “push” permissions to force their changes directly to the branch without a pull request, and thus should be disabled."
  sql           = query.main_branch_blocks_force_push.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_16.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_17" {
  title         = "1.1.17 Ensure branch deletions are denied"
  description   = "Ensure that users with only push access are incapable of deleting a protected branch."
  sql           = query.main_branch_deletion_restricted.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_17.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}
