# General Notes on Security and Identity & Access Management (IAM) Service
---
This document can serve as a notes aggregator from reading documents, taking cources, watching youtube videos.

## Introduction to Security Domain

### Security Matters
If you are a big corporate or an individual, you have data that needs to be protected
- Big corporate: Personnel identification data, proprietary software base code or data, secret data, etc.
- Individuals: Personal identification records, medical resources, bank information, etc.

Data is not safe whenever it is online and another person has access to it.
- assigning correct permssion roles and atttributes to the users so the don't have permissions that they don't need
- assigning roles and permissions based on the user role help with protecting data to be modified or deleted mistakingly or maliciously

### Principle of least privilege
- Grant minimum permissions to user based on their job needs then grant any addition permissions as the need for them arise ✅
- Grant broad permissions then start blocking the permissions that were granted ❌

### Authentication and authorization
The foundation of **Identity & Access Management AIM** rely on:
Authentication: is a basic computer concept. A user, application or system need to prove their identity before getting access IT resources. Just like providing identification in the airport to access the gate and the plane
Authorization: The process of determining what permissions a user should be granted. After a user has been authenticated, they must be authorized to access the IT resources and data that they are requesting

### Security layers
A successful security of IT system ensures that security measures starts from the protection of the physical data center down to the security of the documents stored in the servers of the data center

#### Perimeter layer
AWS data center physical security begins at the perimeter layer. Examples of the security features, that can vary by location, are:
- Security guards
- Fencing
- Security feed
- Intrusion detection technology
- Other measures

The process of granting access to AWS, or any other data centers, must ensure the enforcement of **Principle of Least Privilege**

#### Environment layer
This security layer is dedicated to enviromental considerations:
- Site selection: mitigate enviromental risks of the site like flooding, extreme weather, seismic activity, etc.
- Site construction
- Site operations and sustainability.

#### Infrastructure layer
This security layer covers the data center building and the equipment and systems inside it and help protecting it and ultimately protecting your data
- Backup power systems: UPS units provide power backup for critical and essential loads, generators provide backup power to entire facility
- HVAC system: Provide constant operating temperature for servers and HW
- Fire supression equipment
- Other equipment and systems

#### Data layer
The data layer security is the most critical point of protection because it is the only area that holds customer data.
As stated in the shared responsibility model, the data security and protection IN the cloud is the user responsibility, but the security and protection OF the cloud is AWS responsibility, specially the protection of the media where your data live.

- Storage devices are decommissioned by using the **National Institute of Standards and Technology** techniques to destroy customer data
- AWS is audited by external auditors to confirm that established rules needed to obtain security certifications are followed.
- AWS servers can notify employees of any attempts to remove data. In the unlikely event of a breach, the server is automatically disabled.

### AWS shared Responsibility model:
The statement of the model is simple:
**AWS** is responsible for the security **OF** the Cloud:
- Physical security of data centers
- HW and SW infrastructure
- Network infrastructure
- Virtualization infrastructure

**Customers** are responsible for the security **IN** the Cloud:
Customers are in control and responsible for the security of everything that they create and put IN the AWS cloud.
- When using AWS services, customers maintain complete control over their data and content.
- Managing security requirements of the contents.
- Managing security of services they use.
- Managing who has access to what
- Managing how access are granted, managed, and revoked.

AWS might provide a managed polices and role, but it is the customer responsibility to enable it and use it.

#### Examples of the implementation of the **Shared Responsibility Model**

# Shared Responsibility Examples

| **Responsibility**                      | **Amazon Simple Storage Service (Amazon S3)**                              | **Amazon Elastic Compute Cloud (Amazon EC2)**                      | **Amazon Virtual Private Cloud (Amazon VPC)**                     |
|-----------------------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------|
| **Customer (security IN the cloud)**    | - Bucket access policy<br>- Data encryption<br>- File delete protection (versioning and multi-factor authentication)<br>- User access | - Patching guest operating system<br>- Security group configurations<br>- Encrypting volumes<br>- IAM instance profile assignment for roles<br>- User access | - Security group configurations<br>- Network access control list (Network ACL) configurations<br>- Configuring for public or private access<br>- User access |
| **AWS (security OF the cloud)**         | Protecting the infrastructure to run the services: This includes the hardware, software, networking, and physical facilities infrastructure. | Protecting the infrastructure to run the services: This includes the hardware, software, networking, and physical facilities infrastructure. | Protecting the infrastructure to run the services: This includes the hardware, software, networking, and physical facilities infrastructure. |

---

## Introduction to AWS Identity and Access Management (IAM)

### What is IAM
**IAM** is an AWS core security service that provide access control management to AWS services and resources. This includes **How** users can access your AWS account and **What** they can access and do. With IAM you can centrally manage detailed permissions and analyze access to refine permissions across AWS.

### What are IAM Identities
#### **Users**
- An IAM **user** represents a specific person or application that uses IAM to interact with AWS offerings and services.
- IAM user can sign in to the **AWS Management Console**.
- IAM user can complete tasks and requests to AWS services using **AWS CLI** and **AWS APIs** through **AWS SDKs**
- IAM user credentials include:
    - name and password to access the **AWS Management Console**
    - Up to access keys to programmatically access AWS services and resources with **AWS CLI**, **AWS SDKs**, or direct HTTPS calls using APIs for individual AWS services
- IAM enables customers to manage manage passwords by configuring a password policy, which is set of rules that desfine the type of password that an IAM user can set, like password minimum length, what characters to use, expireation, password changing by users, prevent password reuse, etc.
- By default IAM user has **no permissions** when created for the first time.
- Customer can give IAM user permissions by creating **IAM polices** and attach them to the **IAM user**
    - **IAM polices** are JSON documents that defines specific actions that the user can perform on a specific AWS service or resource
        - Sample of IAM policy json
        ```json
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": [
                        "s3:GetObject",
                        "s3:PutObject"
                    ],
                    "Resource": "arn:aws:s3:::example-bucket/*"
                }
            ]
        }
        ```
        - **Version:** 
            - Specifies the policy language version. Use "2012-10-17" as it is the latest version.
        - **Statement:** 
            - Contains the individual permission rules.
        - **Effect:** 
            - **Allow** to grant permissions defined in the policy.
            - **Deny** to explicitly deny permissions defined in the policy.
        - **Action:** 
            - Specifies the actions allowed on the resource. In this example 2 actions are granted:
            - **"s3:GetObject":** Grants permission to retrieve objects from the S3 bucket.
            - **"s3:PutObject":** Grants permission to upload objects to the S3 bucket.
        - **Resource:** 
            - Specifies the ARN of the resource the policy applies to.
            - In this example: "arn:aws:s3:::example-bucket/*" allows access to all objects (/*) in the bucket example-bucket.
            
#### **Groups**
- **IAM group** is a group of IAM users that have the same permissions.
- IAM polices can be attached to an IAM group. All IAM users in that group will inheret the policy instead of attaching policy to each individual user.
- A new user can be granted the policies and permissions related to their roles by simply adding the user to the related group, same for user changing roles and users being removed.
- Groups can not be nested.
- There are no default group created by default to contain all the account users
- Within the account, groups names must be unique.
- Group names aren't distinguished by case, for example you can't create groups named ADMINS and admin or Admin.

#### **Roles**
- **IAM role** another IAM identity that you can create in your account that has specific permissions. Like IAM users and groups, you can attach an IAM policy to the role to determine what the role can and can't do in your AWS account.
- IAM roles can be **Assumed** by:
    - IAM user
    - AWS service
    - External user authenticated by an external identity provider (IdP) service.
- When a user or service **assumes** the role they will inhirit the policies attached to that role temporarily till the role is **returned**
- Using roles has the benefit of specified security credentials not being tied directly to an entity.
- Unlike IAM users, IAM roles do not have a name and password, are not associated with a unique user, and can be used by anyone needs it for a short term access.
- IAM users and AWS services don't have access to roles that they can assume automatically.
- Access to assuming roles need to be configured in the **trust policy** of the role, it is a JOSN file that, in addition to the usual statement, effect, action keys, the definition of a **Principal** and a **Condition** keys that define who can assume the role and under what condition
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {"AWS": "arn:aws:iam:123456789012:root"},
            "Action": "sts:AssumeRole",
            "Condition": {"Bool": {"aws:MultiFactorAuthPresent": "true"}}
        },
        {
            "Effect": "Allow",
            "Principal": {
                "service": [
                    "ec2.amazonaws.com"
                ]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
}
```
- **Federated users** are users authenticated outside of AWS (e.g., in an enterprise identity system) and granted access to AWS resources without needing individual IAM user accounts.
    - **Identity Source:** Federated users are managed in external directories or SSO systems like:
        - Active Directory
        - Okta
        - Google Workspace
        - SAML 2.0-compliant providers
    - **Temporary Credentials:** Instead of creating long-term IAM credentials, federated users assume an IAM role to obtain short-term credentials for specific actions in AWS.
    - **Use Cases:**
        - Granting AWS access to large workforces without managing separate IAM users.
        - Managing partners or third-party access.
        - Enabling Single Sign-On (SSO) for AWS.

### IAM Monitoring Features
- Monitoring your security access is important, and IAM provide tools that enable customers perform that.
    
    - **IAM Analyzer Tool** is a tool that help customers to identify the resources in their organization and accounts that are shared with external entities (e.g., other AWS accounts, organizations, or public access). This helps with identifying unintended access to the organization resources and data, which might be a swcurity risk.
        - Achieving least privilege is a continous cycle to grant the right fine-grained permissions as your requirements evolve. **IAM access analyzer** helps with stramline permissions management throughout each step of the cycle.
        - It can be generated manually from the **IAM Console** or programmatically using AWS CLI
        - Benefits of IAM Access Analyzer tool:
            - Analyzer's findings can be used to determine weather the access is intended and safe.
            - Provides recommendations to tighten security configurations.
            - Analyzer's findings can be used to preview how the polices in place effects access to the AWS resources before deploying permissions.
    
    - **IAM Credential Reports** is a tool that provides a downloadable report that lists all IAM users in AWS account and their credential-related details (e.g., password, access keys, MFA devices, etc.)
        - It can be generated manually from the **IAM Console** or programmatically using AWS CLI or SDK
        - Details included in the report:
            - Password enabled and last used.
            - Access keys and their statuses (e.g., active, last used).
            - MFA enabled/disabled.
            - Whether the account follows best practices for secure credentials.

### IAM Cost Effectness
- IAM is free of charge, customer won't be charged to create identities, polices, and attaching polices to identites.
- Charges are on actions that identites perform on services, like Amazon Elastic Compute Cloud (EC2) service, using the attached polices and permissions

### Multi-factor Authentication
Is a security layer that can be added to the user login process. With MFA enabled the user will need to enter a second form of authentication using code generating apps or a hardware key device.
When MFA is enabled, both login credentials and MFA code are required to perform a successful sign-in.
AWS CLI support MFA as well.

### IAM Identity Center
AWS **IAM Identity Center** is core security service and part of the AWS security best practice.
AWS explicitly recommend **IAM Identity Center** as a best practice to manage access accross multiple AWS accounts and applications
It aligns with the **Principle of Lease Privilege** by enabling centralized identity and access management with short-term credentials, reducing security risks.
Although, it mainly utilized for managing access across multiple AWS accounts, IAM Identity Center can be used with single AWS account as well.
IAM Identity Center enable **Single Sign-On (SSO)** for users to log in to AWS services like EC2 management console without the need for long term IAM credentials.
Also users can use temporary credentials generated to access AWS resourced programmatically via tools like AWS CLI or SDK.

### The Security of Service Operations vs Service Provisioning
When considering **AWS service operations** vs **service provisioning**, the type of credentials needed depends on whether you're **interacting with AWS services** (provisioning or managing resources) or **operating on the resources** after they've been provisioned.
Below is a breakdown of the credentials required for both cases in terms of IAM users/roles and IAM Identity Center users.

#### 1. Service Provisioning
**Definition**: Provisioning involves creating, modifying, or deleting AWS resources, such as launching an EC2 instance, creating an S3 bucket, or configuring a VPC.

**Credentials Needed for Service Provisioning**
| **Type of User**          | **Credentials**                                                                 | **Description**                                                                                     |
|---------------------------|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| **IAM User/Role**         | - Access Keys (for CLI/SDK/API).<br>- Console Login Credentials (username/password). | IAM users/roles need programmatic access keys or console login credentials to provision resources. |
| **IAM Identity Center User** | - Temporary Credentials (generated via Identity Center for CLI/SDK).<br>- SSO Session (via Identity Center portal). | Identity Center users authenticate via SSO to provision resources and generate temporary credentials for CLI/SDK use. |

**Recommended Approach for Provisioning**
- Use **IAM Identity Center users** with **permission sets** to generate temporary credentials.
- **IAM users** can be used as well but with following best practices
    - Rotate access keys regularly.
    - Assign least privilege permissions (e.g., restrict to specific services like EC2, S3, or VPC).

#### 2. Service Operations
**Definition**: Operations involve interacting with AWS-provisioned resources, such as installing software, managing files, or executing commands on an EC2 instance.

**Credentials Needed for Service Operations**
| **Type of User**           | **Credentials**                                                                     | **Description**                                                                                     |
|----------------------------|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| **IAM User/Role**          | - Access Keys (for API-level operations, e.g., sending commands via Systems Manager).<br>- Session Credentials (e.g., via AWS CLI AssumeRole). | IAM users/roles may be used to perform resource-specific operations programmatically via CLI or Systems Manager. |
| **IAM Identity Center User** | - Temporary Credentials (generated via Identity Center for CLI/SDK).<br>- SSO Session (for console-based operations). | Identity Center users can access tools like AWS Systems Manager or SSO-based CLI credentials to interact with resources. |
| **Instance-Level Credentials** | - Key Pairs (for SSH access).<br>- Session Manager Session (no SSH required). | Key pairs are required for SSH, but Session Manager (via Systems Manager) is recommended for better security and accountability. |


**Recommended Approach for Sevice Operations**
- ❌ Instances can be provisioned with sets of key pairs that can be used to connect to the instances, but this method is not recommended because it doesn't provide any accountability to who using it. 
- ✅ **IAM users/roles** may be used to perform resource-specific operations programmatically via CLI using **Access Keys**
- ✅ **IAM Identity Center users** can access tools like **AWS CLI and AWS SDKs** to interact with resources using **temporary credentials** and **SSO Sessions**

### IAM Use Cases:
- Apply detailed permissions: AWS IAM let's you create and apply permissions based on user attributes, such as department, job role, and team name, by using attribute-based access control
- Manage per-account and application access: With AWS IAM, you can manage per-account identities. This means that you can provide multi-account access and application assignments across AWS
- Establish organization-wide guardrails on AWS: AWS IAM provides you with the ability to establish organization-wide and preventive guardrails on AWS. You can do this by using service control policies to establish permissions guardrails for IAM users and roles, and implement a data perimeter around your account in AWS organizations.
- Set, verify, and right-size permissions: AWS IAM is built to help you set, verify, and right-size user permissions in accordance with the least privilege principle policy. You can streamline permissions management and use accross-account findings as you set, verify, and refine polices on the journey toward least privilege.

### IAM Identities vs IAM Entities
**IAM Identities**: Objects used to define permissions and access control.
**IAM Entities**: Principals (actors) making requests to AWS resources.

#### Key Differences:
| **Aspect**             | **IAM Identities**                              | **IAM Entities**                               |
|------------------------|-------------------------------------------------|------------------------------------------------|
| **Definition**         | Objects used to define permissions and access control. | Principals (actors) making requests to AWS resources. |
| **Purpose**            | To define "who can do what" in the AWS environment. | To represent "who is performing the action" at runtime. |
| **Examples**           | IAM Users, Groups, Roles.                       | IAM Users, IAM Roles (assumed), Federated Identities, AWS Services. |
| **Runtime Behavior**   | Permissions and policies are defined here.      | These entities execute actions based on permissions granted by identities. |


#### Practical Relationship
- **IAM Identities** like users, groups, and roles define permissions (e.g., "What actions can this user perform?").
- When these identities interact with AWS services (e.g., making an API request or assuming a role), they become **IAM Entities**.

### Root User
- **Root User** is the user created by default when an AWS account created
- **Root User** has complete access to all AWS services and resources in the account.
- This Identity access your account by signing in with the email address and password provided during the account creation
- The following best practices should be followed to ensure the safety of the root user
    - Choose strong password
    - Enable MFA for the root user
    - Never share root user password or access keys with anyone
    - Disable or delete the access keys associated with the root user
    - Create a power IAM user With full access to the AWS account, except for billing for administrative tasks.

### IAM Policies
- **IAM Policy** is statement of permissions that is granted to an entity. It can be attached to any IAM entity such as users, groups, or roles.
- **Policies** Specify what the **Effect** is when the user requests access AWS resources, what **Actions** the user is allowed to execute, and what **Resources** these actions are allowed on.
- **Policy Types**:
    - Identity-based policies
    - Resource-based policies
    - Permissions boundaries
    - Organizations SCPs
    - Organizations RCPs
    - Access control lists (ACLs)
    - Session policies
- **Statement**, **Effect**, **Actions**, **Resources** are the main keys in the policy, and permission json files.
- **Entity** can have multiple policies attached to it (like an IAM user has IAM policy granting access only to EC2 service, and a second policy grant the same user aaccess to only S3 service).
- The order inwhich the policies are evaluated has no effect on the outcome of the evaluation.
- The final result of evaluationg attached policies are either **Allow** or **Deny** the user request.
- If there is a conflict in granted permissions, an explicit deny take precedence over an allow statement.
- It might be confusing to differentiat between a policy and permission when thier json files are viewed, but the main difference is that a permission json file defines a policy's structure and permissions and it is located outside of AWS, once uploaded to AWS the permission json file become a new active policy or it updates an existing customer managed policy.

#### Key Distinction Between Policies and Permission JSON Files
| **Aspect**             | **Policy**                                                                                       | **Permission JSON File**                                                                           |
|------------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| **Purpose**            | A formal AWS object that defines permissions and controls access to AWS resources.               | A local or external JSON file used to define a policy before applying it to AWS.                 |
| **Where It Exists**    | Stored in AWS (e.g., IAM, S3 bucket policy, etc.).                                               | Exists locally, often in a project folder or repository.                                         |
| **Usage**              | Actively enforces permissions when attached to an IAM entity (user, group, or role).             | Used for creating or updating a policy in AWS. It must be uploaded or referenced in the AWS CLI/SDK to take effect. |
| **Type of Entity**     | A managed or inline policy object in AWS.                                                        | A static JSON file defining permissions for a potential policy.                                  |
| **How It’s Accessed**  | Managed through AWS Console, AWS CLI, or SDK.                                                    | Stored and managed outside AWS, often in version control systems.                                |
| **Examples in Use**    | - IAM user policy<br>- S3 bucket policy<br>- EC2 instance role policy                            | - JSON file in a local folder<br>- Input for the `aws iam create-policy` CLI command             |

#### IAM Policy Example:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": ["dynamodb:*", "s3:*"],
            "Resource": [
                "arn:aws:dynamodb:region:account-number-without-hyphens:table/table-name",
                "arn:aws:s3:::bucket-name",
                "arn:aws:s3:::bucket-name/*"
            ]
        },
        {
            "Effect": "Deny",
            "Action": ["dynamodb:*", "s3:*"],
            "NotResource": [
                "arn:aws:dynamodb:region:account-number-without-hyphens:table/table-name",
                "arn:aws:s3:::bucket-name",
                "arn:aws:s3:::bucket-name/*"
            ]
        }
    ]
}
```
- **Identity-Based Policies**: Identity-based policies are JSON permissions policy documents that control what actions an identity (users, groups of users, and roles) can perform, on which resources, and under what conditions. Identity-based policies can be further categorized:
    - **Managed policies**: Standalone identity-based policies that you can attach to multiple users, groups, and roles in your AWS account. There are two types of managed policies:
        - **AWS Managed Policies**
        - **Customer Managed Policies**
    - **Inline policies**: Policies that you add directly to a single user, group, or role. Inline policies maintain a strict one-to-one relationship between a policy and an identity. They are deleted when you delete the identity.

- **Resource-Based Policies**: Resource-based policies are JSON policy documents that you attach to a resource such as an Amazon S3 bucket. These policies grant the specified principal permission to perform specific actions on that resource and defines under what conditions this applies. Resource-based policies are inline policies.
    - There are no managed resource-based policies.
    - In Resource-based policy, the IAM entity to be granted or revoked permissions are specified as a principal in the policy JSON file.
    - There are no managed resource based policies.