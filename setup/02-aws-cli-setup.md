# AWS CLI Setup

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account
- Access to a terminal or command line interface

## Step 1: Install AWS CLI

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

## Step 3: Configure AWS CLI

Run the following command to configure the AWS CLI with your credentials:

```sh
aws configure
```

You will be prompted to enter your AWS Access Key ID, Secret Access Key, region, and output format.

## Step 4: Test Configuration

To test your configuration, run a simple AWS CLI command, such as listing your S3 buckets:

```sh
aws s3 ls
```

If your setup is correct, you should see a list of your S3 buckets.

## Additional Resources

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)

## Next Steps

After setting up the AWS CLI, you may want to set up the AWS SDK for your preferred programming language. Follow the instructions in the [AWS SDK Setup Guide](./aws-sdk-setup.md) to get started.