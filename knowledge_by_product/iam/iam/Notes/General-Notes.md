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

#### **Roles**
- **IAM role** another identity that is similar to IAM user as of being an identity with permission polices that determine what the identity can and can't do in AWS.
- Unlike IAM users, IAM roles do not have a name and password, are not associated with a unique user, and can be used by anyone needs it for a short term access.

### IAM Monitoring Features
- Monitoring your security access is important, and IAM provide tools that enable customers perform that.
    
    - **IAM Analyzer Tool** is a tool that help customers to identify the resources in their organization and accounts that are shared with with external entity (e.g., other AWS accounts, organizations, or public access). This helps with identifying unintended access to the organization resources and data, which might be a swcurity risk.
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