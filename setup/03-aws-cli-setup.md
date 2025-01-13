# AWS CLI Setup
---

## Purpose of AWS CLI Setup:
- The AWS Command Line Interface (CLI) enables users to interact with AWS services programmatically from the terminal, allowing efficient resource management and automation.

## Benefits of Using AWS CLI for Handling AWS Operations:
- Streamlined and repeatable resource management via commands and scripts.
- Support for automation of workflows, reducing manual intervention.
- Cross-platform compatibility for flexibility in development environments.
- Direct integration with other tools for enhanced DevOps workflows.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account
- Access to a terminal or command line interface

## Install AWS CLI

### On macOS

```sh
brew install awscli
```

### On Windows

Download the MSI installer from the [AWS CLI MSI installer for Windows](https://aws.amazon.com/cli/).

### On Linux

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Step 2: Verify Installation

To verify that the AWS CLI is installed correctly, run:

```sh
aws --version
```

You should see output similar to:

```
aws-cli/2.0.0 Python/3.7.3 Linux/5.4.0-1029-aws botocore/2.0.0
```

## Configure AWS CLI with IAM User:

### Install aws-vault
[AWS Vault](https://github.com/99designs/aws-vault) is an open-source tool to securely store and access AWS credentials in a development environment.
I don't want to store the IAM credentials unsecurely, so I am using aws-vault for enhanced security

```bash
# install dependencies and brew tool
$sudo apt update
$sudo apt install build-essential procps curl file git -y
$/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Adding brew to my system PATH
$echo >> ~/.bashrc
$echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
$eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install aws-vault
brew install aws-vault
```

### Add AWS IAM User Credentials to AWS Vault
Below can be done to add the IAM power user access keys to the vault

```bash
# Adding default profile
aws-vault add default
# You will be prompted to enter the access key ID and the secret access key that you retrieved when creating the access key in the console
# this might take some time to finish
```

```bash
aws configure
```

You will be prompted to enter your AWS Access Key ID, Secret Access Key, region, and output format.

## Configure AWS CLI with IAM Identity Center Administrative Account

Unlike IAM users, which use long-term credentials (access key and secret access key), IAM Identity Center does not provide direct access keys. Instead, it enables users to access specific AWS accounts and roles by creating CLI profiles. These profiles utilize short-term credentials (lasting between 1 to 12 hours) to authenticate the user's access to AWS resources within the assigned account and role.

```sh
aws configure sso # configure sso connection for identity center account
$SSO session name (recommended): # A label for this SSO session, used to manage multiple sessions or profiles.
$SSO start URL [None]: # The URL for your IAM Identity Center (SSO) portal, where users authenticate.
$SSO region [None]: #The AWS region where IAM Identity Center is configured.
$SSO registration scopes [sso:account:access] # Scopes in the context of AWS IAM Identity Center (SSO) define what permissions an application or tool (like the AWS CLI) can request and use when authenticated via IAM Identity Center. [sso:account:access] is the default registration scope for AWS CLI
```
After entering the last configuration the SSO authorization page will open in the browser, it might ask for permission first.
When you click allow access, the CLI uses **sso:account:access** to fetch all the accounts and roles the user has access/assigned to.
The configuration process now move to configure the CLI automatically

```sh
$CLI default client Region [None]: # The region where CLI commands will execute by default. This can be different from the SSO region, or could be the same.
$CLI default output format [None]: # The format for CLI command outputs. Options include: json (default), table, text
$CLI profile name [<some auto generated name>]: # Enter a profile name for the CLI, or keep the default name <some auto generated name>

# Final output of aws configure sso:
#
#To use this profile, specify the profile name using --profile, as shown:
#aws s3 ls --profile admin-default
# To check the profile info
$nano ~/.aws/config

# this config file contains sessions info for user and CLI profiles
#[profile default-admin]
#sso_session = default-admin
#sso_account_id = <account ID>
#sso_role_name = <role name the user of the account using>
#region = <compute reagion where CLI run>
#output = json
#[sso-session default-admin]
#sso_start_url = https://<your-instance-id>.awsapps.com/start
#sso_region = <compute reagion where identity center configured>
#sso_registration_scopes = sso:account:access
```

## Test Configuration

To test your configuration, run a simple AWS CLI command, such as listing your S3 buckets:

```sh
aws s3 ls
```

If your setup is correct, you should see a list of your S3 buckets.

## Additional Resources

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)

## Next Steps

After setting up the AWS CLI, you may want to set up the AWS SDK for your preferred programming language. Follow the instructions in the [AWS SDK Setup Guide](./04-aws-sdk-setup.md) to get started.