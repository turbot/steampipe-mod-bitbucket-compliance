# Bitbucket Compliance Mod for Steampipe

6+ checks covering industry defined security best practices for Bitbucket.

**Includes full support for CIS Software Supply Chain Security Guide v1.0.0**.

Run checks in a dashboard:
![image](https://raw.bitbucketusercontent.com/turbot/steampipe-mod-bitbucket-compliance/main/docs/images/bitbucket_compliance_cis_v100_dashboard.png)

Or in a terminal:
![image](https://raw.bitbucketusercontent.com/turbot/steampipe-mod-bitbucket-compliance/main/docs/images/bitbucket_cis_v100_terminal.png)

## Getting started

### Installation

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Install the bitbucket plugin with [Steampipe](https://steampipe.io):

```sh
steampipe plugin install bitbucket
```

Clone:

```sh
git clone https://bitbucket.com/turbot/steampipe-mod-bitbucket-compliance.git
cd steampipe-mod-bitbucket-compliance
```

### Usage

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at https://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `steampipe check` command:

Run all benchmarks:

```sh
steampipe check all
```

Run a single benchmark:

```sh
steampipe check benchmark.cis_supply_chain_v100
```

Run a specific control:

```sh
steampipe check control.cis_supply_chain_v100_1_1_3
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe bitbucket plugin](https://hub.steampipe.io/plugins/turbot/bitbucket).

### Configuration

No extra configuration is required.

## Contributing

If you have an idea for additional compliance controls, or just want to help maintain and extend this mod ([or others](https://bitbucket.com/topics/steampipe-mod)) we would love you to join the community and start contributing. (Even if you just want to help with the docs.)

- **[Join our Slack community →](https://steampipe.io/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://bitbucket.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://bitbucket.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://bitbucket.com/turbot/steampipe-mod-bitbucket-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://bitbucket.com/turbot/steampipe/labels/help%20wanted)
- [Bitbucket Compliance Mod](https://bitbucket.com/turbot/steampipe-mod-bitbucket-compliance/labels/help%20wanted)
