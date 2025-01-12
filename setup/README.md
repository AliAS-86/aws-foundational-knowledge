# Setting up the AWS Foundational Knowledge Fortress 🏰
---
Welcome to the **AWS Foundational Knowledge Fortess!** setup section, following this section, you'll set up a secure environment to help you build your learning foundation for AWS. Think of this setup as constructing a fortress where each step secures and equips you for success. We'll focus on:
- Setting up your AWS account skeleton.
- Securing it with best practices.
- Equipping your fort with tools like AWS CLI and AWS SDK.
This section emphasizes the Separation of Concerns (SoC) principle. so here you'll set up the environment, and then you can build your knowledge blocks in the **[knowledge]**(../knowledge_by_product/) section.

---
## Build the frame and the walls 🛠️
Setting up your environment is like setting up your home fort, two things are must to be done first:
1. Build the fort frame, and that's setting up your [AWS Free Tear Account](https://aws.amazon.com/free/)
2. First step to secure your empty frame by building walls, and that's by securing your root user with **Multi-Factor Authentication (MFA)** and using strong passwords

The later steps can be done in few orders depending on what level of challenge you desire. The final results will be the same!

---
## Choose Your Setup Mode
Your learning path can be adjusted based on how challenging and realistic you want the setup to be. Each mode provides the same final result but varies in complexity and security.

**setup Mode Comparison Table**
| Mode                | Recommended For                   | Security Level          |
|---------------------|-----------------------------------|-------------------------|
| [Basic Mode](#basic-mode-not-recommended-)        | Beginners, temporary setups       | Low (root user access)  |
| [Intermediate Mode](#intermediate-mode-recommended-for-most-learning-goals-️) | Most learning scenarios           | Medium (IAM identities) |
| [Advanced Mode](#advances-mode-recommended-for-advanced-learning-)     | Multi-account organizations setup | High (IAM Identity Center) |

### Basic Mode *(Not recommended)* 💀
⚠️ *Warning: this mode is easy and quick at first, but it likely to cause some headache later. it's like having only the door to protect your fort and giving the people that helping you with building your fort your own credentials to open that door, they can use it later to gain unstrictly access to your fort and whatever exist inside it. Amazon AWS does not recommend the use of root user for daily activities on AWS accounts, so if you use mode make sure it's for learning purposes and with no critical, personal or business, data involved*

1. Install AWS CLI v2 by following the instruction in [aws-cli-setup](./03-aws-cli-setup.md#install-aws-cli).
1. Use root user's credentials to configure the CLI tool by following instructions in [aws-cli-setup](./03-aws-cli-setup.md#configure-aws-cli-with-iam-user)
2. Install AWS SDK by following instructions in [aws-sdk-setup](./04-aws-sdk-setup.md)

ℹ️ *Note: Once you create an IAM user during your learning, and skilling up journey, make sure to configure the CLI again with the IAM user credentials and delete the root user profile*

### Intermediate Mode *(Recommended for Most Learning Goals)* 🛡️
This mode provides better security by using IAM identities. IAM users allow you to assign specific permissions to individuals, minimizing risks compared to using the root user.

1. As a root user, create IAM admin identities (group, user and role) by following instructions in [setup-iam-identities](./01-setup-iam-identities.md).
2. Install AWS CLI v2 by following the instruction in [aws-cli-setup](./03-aws-cli-setup.md#install-aws-cli).
2. Configure AWS CLI tool by following instructions in [aws-cli-setup](./03-aws-cli-setup.md#configure-aws-cli-with-iam-user).
3. Install AWS SDK by following instructions in [aws-sdk-setup](./04-aws-sdk-setup.md).

### Advances Mode *(Recommended for Advanced Learning)* 🏰
This mode is designed for multi-account setups and advanced learners. You'll use **IAM Identity Center** to manage access across multiple accounts while following the [Principle of Least Privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege).

1. Follow the instructions in [setup-iam-identity-center](./02-setup-iam-identity-center.md) to perform the following activities:
    - With root user, [Enable IAM Identity Center](./02-setup-iam-identity-center.md#1-enable-iam-identity-center)
    - For learning purpose, you can enable **Identity Center** in a single AWS account, but if you have the setup and want advance your skills you can create an [AWS organization](./03-setup-iam-identity-center.md#1-aws-organization-setup-guide) using your AWS account.
2. Install AWS CLI v2 by following the instruction in [aws-cli-setup](./03-aws-cli-setup.md#install-aws-cli).
3. Configure AWS CLI tool by following instructions in [aws-cli-setup](./03-aws-cli-setup.md#configure-aws-cli-with-iam-identity-center-administrative-account)

## Installing AWS SDK
For all modes, follow the detailed instructions in [AWS SDK Setup](./04-aws-sdk-setup.md) to install and configure the SDK for your preferred programming language.
