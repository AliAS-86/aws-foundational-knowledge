---

# AWS CLI and SDK Setup Prerequisites

**Before you can effectively use the AWS CLI and AWS SDK for learning, you need to set up a secure and well-configured AWS account. The steps below ensure that you follow AWS best practices while getting started with these tools.**

---

## **Prerequisites**

1. **Create an AWS Account**:
    - Sign up for an [AWS Free Tier account](https://aws.amazon.com/free/) if you don't have one.

2. **Secure the Root User**:
    - After creating your account, sign in to the AWS Management Console using the root user credentials.
    - Immediately secure your root account by:
      - Enabling **MFA** (Multi-Factor Authentication).
      - Creating a **strong password**.
      - Securely storing the root credentials.

    ⚠️ **Warning**:
    Do not use the root user for daily activities. The root account has unrestricted access to all resources in your AWS account. To comply with the [Principle of Least Privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege), proceed to the next step to create an administrator account.

3. **Create an Administrator Account**:
    Choose one of the following options:

    | **Method**                         | **Purpose**                                                                 | **Instructions**                                                                                          | **Additional Notes**                                                                                   |
    |------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
    | **IAM Identity Center (Recommended)** | Use short-term credentials to access AWS securely.                          | Follow [Getting Started with IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/getting-started.html). | Configure CLI programmatic access by following [CLI with IAM Identity Center](https://docs.aws.amazon.com/cli/latest/userguide/sso-configure.html). |
    | **IAM User (Not Recommended)**     | Use long-term credentials (less secure, easier for basic setups).           | Follow [Create an IAM User for Emergency Access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html).            | Configure programmatic access by following [Manage Access Keys for IAM Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html). |

ℹ️ **Important Notes**
- IAM Identity Center provides centralized access management using short-term credentials, reducing security risks compared to IAM users with long-term credentials. It is strongly recommended to use IAM Identity Center for improved security. Learn more about its features [here](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html#features).

⚙️ **Setup the Administrative Account**
- Instructions to set up IAM Identity Center using console & AWS CLI: [04-setup-iam-identity-center](./04-setup-iam-identity-center.md)
- Instructions to set up IAM user in console & AWS CLI: [04-setup-iam-user](./04-setup-iam-user.md)

---
