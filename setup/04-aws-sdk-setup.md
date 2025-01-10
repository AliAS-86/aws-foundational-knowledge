```markdown
# AWS SDK Setup Guide for Developers

## Python

### Official SDK
Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for Python. It allows Python developers to write software that makes use of services like Amazon S3 and Amazon EC2.

- **Documentation:** Find the latest, most up-to-date documentation at [Boto3 Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html), including a list of supported services.
- **Boto3 on GitHub:** [https://github.com/boto/boto3](https://github.com/boto/boto3)
- **Boto3 on AWS:** [AWS SDK for Python (Boto3)](https://aws.amazon.com/sdk-for-python/)

---

## Getting Started

The steps below are sourced from the [Boto3 GitHub Repository](https://github.com/boto/boto3).

### Prerequisites
Ensure you have a supported version of Python installed on your system.

### Setup Steps

1. **Create a virtual environment**
    ```bash
    python -m venv .venv
    ```
2. **Activate the virtual environment**
    ```bash
    . .venv/bin/activate
    ```
3. **Install Boto3**
    ```bash
    python -m pip install boto3
    ```

**or install from source with:**
    ```bash
    git clone https://github.com/boto/boto3.git
    cd boto3
    python -m pip install -r requirements.txt
    python -m pip install -e .
    ```

After installation is done, you can:
- set up credentials (in e.g. ~/.aws/credentials):
    ```ini
    [default]
    aws_access_key_id = YOUR_KEY
    aws_secret_access_key = YOUR_SECRET
    ```

- set up a default region (in e.g. ~/.aws/config):
    ```ini
    [default]
    region=us-east-1
    ```

**Note:** Other credential configuration methods can be found here: [Boto3 Credentials Guide](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html)


```