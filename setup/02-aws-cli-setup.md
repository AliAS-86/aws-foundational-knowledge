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

## Configure AWS CLI with IAM User:
Configure AWS CLI using power user access keys, for enhanced security, access keys will be stored in aws-vault.

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
# You will be prompted to enter the access key ID and the secret access key for the IAM user that you want to use to connect to AWS services and resources
# The process of adding default profile for the first time will create a config file under ~/.aws directory, edit the file to add few more details
$nono ~/.aws/config
# Default region (Required):
region = us-east-1
# Add mfa device ID if MFA is enabled for the user (Required)
mfa_serial = arn:aws:iam::xxxxxxxxxxxx:mfa/iam-user
# Add output format (Optional)
output = json
```
The access key ID and secret access key will be stored securely in the backend of the aws-vault service.

```bash
# Test the aws-vault and AWS CLI configuration and communication with AWS account
aws-vault exec default -- aws s3 ls
# IF MFA enabled then you will be prompted to enter MFA code from our assigned device
# If you have no S3 bucket created, there will be no return
# if connection is successful if you don't get error
```
You can add an alias to the **aws-vault exec** command for ease of use by updating 

```bash
# Edit the aliases file
sudo nano ~/.bash_aliases
# Add the following lines
# This alias is for default profile, if you configure aws-vault with different profile name, then use that nameinstead of default
alias aws-cli="aws-vault exec default -- aws"
# to execute the command with --debug
alias aws-cli-debug="aws-vault --debug exec default -- aws"
# Apply changes
source ~/.bashrc
# now try the aliases
aws-cli iam get-account-password-policy
aws-cli-debug iam get-account-password-policy
```

Now you are ready to launch your CLI exercises 🚀 with a fine security best practices 🔒

---
## Additional Resources

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)

## Next Steps

After setting up the AWS CLI, you may want to set up the AWS SDK for your preferred programming language. Follow the instructions in the [AWS SDK Setup Guide](./03-aws-sdk-setup.md) to get started.