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
  ]

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    type = "Benchmark"
  })
}