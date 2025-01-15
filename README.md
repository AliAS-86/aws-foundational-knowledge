# AWS Foundational Knowledge 🌟

Welcome to **AWS Foundational Knowledge**, a dynamic repository where **learning meets skills' showcasing**! 🚀 This is not just a collection of notes, it's part of my **ongoing learning journey** to deepen my AWS expertise and showcase how theoretical knowledge can be transformed into practical solutions.

## What's Inside? 🤔

- **Deep Dives into AWS Services**: From storage to compute, explore each service's **purpose, benefits, and real-world applications**.
- **Architecture Insights**: Learn how to **integrate services into robust AWS architectures**, aligning with the **AWS Well-Architected Framework** and **Shared Responsibility Model**.
- **Policy Practices**: Understand the **governance and security policies** critical to each service's implementation.
- **Technical Excellence**: Showcase skills with **scripts and examples** using the **AWS CLI and SDK**, demonstrating proficiency in automating and provisioning services.

## Why This Repo? 🌐

This repository is part of my **personal learning journey** to master AWS. Certifications and badges are excellent starting points, but **applied knowledge is the key**. By building this repo, I aim to solidify my understanding while creating a resource that highlights my ability to turn theoretical concepts into actionable solutions.

## How to Use This Repo 📘

### View My Notes and Scripts on AWS Foundational Knowledge
I constructed this repo to cover 2 main resources
- **Setup guide**: How to securely setup the AWS account and the local environement
- **aws-services**: This directory includes subdirectories of products (Security, Storage, Compute, Database, etc.) and services offered under each product (Storage/s3, Storage/efs, Compute/ec2, etc.)
- Under each service there are multiple files where I capture notes, progress, scripts (Using Security / IAM service as an example here):

```markdown
aws-foundational-knowledge/        # Main repo
│
├── README.md                      # Main introduction to the repository - We are here
│
├── Security/                      # Product category
│   ├── IAM/                       # Service folder
│   │   ├── README.md              # Overview of the service
│   │   ├── Architecture/          # Diagrams and architecture design files
│   │   │   └── iam-in-aws--architecture.drawio
│   │   ├── iam-scripts/               # Hands-on learning
│   │   │   ├── iam-cli-scripts.md     # Service-related AWS CLI commands
│   │   │   ├── iam--commands-wrappers # Python scripts that define wrapper functions for the CLI commands
│   │   │   ├── iam-sdk-example.py     # Service-related AWS SDK scripts (I am using AWS SDK boto3 for Python)
│   │   │   └── terraform-example.tf   # Terraform scripts to automate service tasks
│   │   ├── Policies/                  # IAM and service policies and security considerations
│   │   │   └── iam-account-password-policy.json
│   │   ├── Notes/
            ├── General-Notes-md       # General notes, topics, to-dos, best pracices for the service
            └── Exam-Notes.md          # Certification-specific notes and tips

```

To make it easier and keep the repo organized, the helper script **prod_dir_generator.bash** can be used to add directory/subdirectories seeded with the above default files for new product/services that I start to learn or explore

```bash
# The following command will initiate the aws-services with few products defined in a config file
./helper_scripts/product_generator.bash initialize_with_config
# The following command will add a new product directory, i.e. Compute, and Compute services, i.e. EC2.
./helper_scripts/product_generator.bash add_new_product Storage s3 efs ebs
# Once added you can use the new directories to capture you notes and write scripts/code
```

Clone or fork this repo and use the setup directory to:
- [Create IAM power user](./setup/01-iam-identities-setup.md#2-create-the-iam-power-user)
- [Assign MFA Device](./setup/01-iam-identities-setup.md#3-assign-mfa-device)
- [Sign-in as IAM user](./setup/01-iam-identities-setup.md#4-sign-in-with-iam-power-user)
- [Create access keys for the New IAM user](./setup/01-iam-identities-setup.md#5-create-access-keys)

Setup **AWS CLI** with **aws-vault** to secure the user's access keys
- [AWS CLI setup with aws-vault](./setup/02-aws-cli-setup.md)

Select an AWS **product/service** from the [Products directory](./aws-services/) and view my notes and scripts

### Create Your Own AWS Foundational Knowledge Using Template Branch - *Comming Soon*
You can clone the repo template branch *Coming soon*, which will include a template with setup guides and helper scripts but no notes and/or scripts