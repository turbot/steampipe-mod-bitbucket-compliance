// Benchmarks and controls for specific services should override the "service" tag
locals {
  bitbucket_compliance_common_tags = {
    category = "Compliance"
    plugin   = "bitbucket"
    service  = "BitBucket"
  }
}

mod "bitbucket_compliance" {
  # hub metadata
  title         = "BitBucket Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for BitBucket across your repositories and organizations using Steampipe."
  color         = "#191717"
  documentation = file("./docs/index.md")
  // icon          = "/images/mods/turbot/bitbucket-compliance.svg"
  categories    = ["bitbucket", "cis", "compliance", "security"]

  opengraph {
    title       = "Steampipe Mod for BitBucket Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for BitBucket across your repositories and organizations using Steampipe."
    image       = "/images/mods/turbot/bitbucket-compliance-social-graphic.png"
  }
  
}
