# Setup IAM Identity Center using AWS console
---
This guide shows the steps to enable **IAM Identity Center**, create an **administrative user and group**, and assign **Permission Sets**.

## Purpose of IAM Identity Center Setup:
- AWS IAM Identity Center simplifies centralized user access management for AWS accounts and integrated applications, enabling single sign-on (SSO) for streamlined authentication.

## Benefits of Using IAM Identity Center for Account and Permission Management:
- Centralized user and group management across multiple AWS accounts.
- Single Sign-On (SSO) for seamless access to cloud applications and AWS Management Console.
- Simplified auditing and compliance through centralized reporting.
- Predefined permission sets to enforce consistent policies across accounts.

## Steps to Setup IAM Identity Center:

### 1. **Enable IAM Identity Center:**
    - Sign in to the AWS Management Console as the root user.
    - Navigate to IAM Identity Center (under Services or search for "IAM Identity Center").
    - Click **Enable IAM Identity Center**.
    - Follow the prompts to complete the setup:
        - Choose whether to enable IAM Identity Center for an AWS Organization or a single AWS account.
            - **AWS organization account:** Recommended for learning real-world scenarios, as it allows centralized management of multiple accounts and access control across an organization. [AWS Organization Setup Guide](#1-aws-organization-setup-guide)
            - Suitable for general learning with a single account, but offers limited functionality compared to an organization setup.

### 2. **Create Admin Group:**
    - In the **IAM Identity Center dashboard**, go to **Groups**.
    - Click **Create group**.
    - **Group name:** Enter group name (e.g., Admins).
    - **Description:** *optional* - Group description detailing the permissions assigned to this group.
    - **Add users to group:** *optional* - Add workforce users to this group. If you have no users, they can be assigned to groups when creating users.
    - Click **Create group**.

### 3. **Create Admin User:**
    - In the **IAM Identity Center dashboard**, go to **Users**.
    - Click **Add User**.
    - Fill in the user details:
        - **Username:** This username will be required for this user to sign in to the AWS access portal. The username can't be changed later.
        - **Password:** 
            - Select between sending an email to the user with password setup instructions or
            - Generate a one-time password (OTP) that can be shared with this user.
        - **Email address:** To send the invitation to the user.
        - **First & Last names:** For the user.
        - **Display name:** This is typically the full name of the workforce user (first and last name), is searchable, and appears in the users list.
    - Click **Next** to add users to group(s): *optional* - Select group(s) or just skip by clicking **Next**.
    - Review all information and click **Add user**.
        - Upon successful user addition, you will get a message: "The user "example@email.com" was successfully added. The user will receive an email with a link to set up a password and instructions to connect to the AWS access portal. The link will be valid for up to 7 days. You can grant this user permissions to accounts or applications so that they can access their assigned AWS accounts and cloud applications when they sign in to the AWS access portal."
        - **Important Notes:** In a newly created organization, there will be no users available. Even the management account will need to be added as a user to the organization before being able to set permissions, so first create a user with your management account.
    - Assign the user to the Admins group created earlier.
    - Send the activation email to the user.
    - Complete the user setup by following the activation link.

### 4. **Create Permission Sets:**
    - In the **IAM Identity Center dashboard**, navigate to **Permission sets**.
    - Click **Create permission set**.
    - **Permission set Type:** Select **Predefined permission set**.
    - Select the **Policy for predefined permission set:** To create the admin user, select **AdministratorAccess**.
    - Click **Next** to specify permission set details:
        - **Permission set name:** AdministratorAccess - The name that you specify for this permission set appears in the AWS access portal as an available role. After users in IAM Identity Center sign in to the AWS access portal and select an AWS account, they can choose the role.
        - **Description:** *optional* - Add a short explanation for this permission set.
        - **Session duration:** The length of time a user can be logged on before the console logs them out of their session. Select a duration of 1 to 12 hours.
    - Click **Next** to review and create.
    - Review the information and click **Create**.

### 5. **Assign Permission Sets to Group:**
    - **AWS Organization:** Displays the organizational structure, select the desired account to set the permission to.
    - **Permission sets:** Select the set and review the set information.
    - Click **Assign**.

## Additional Guides

## 1. **AWS Organization Setup Guide:**
    - Sign in to the AWS Management Console using your root user or a user with the necessary permissions.
    - Navigate to AWS Organizations: In the AWS Management Console, search for "Organizations" in the Services menu or use the URL: [AWS Organizations Console](https://console.aws.amazon.com/organizations/).
    - Create an Organization:
        - Click **Create an Organization**.
        - Choose one of the following modes:
            - **All Features:** Enables full functionality, including Service Control Policies (SCPs).
            - **Consolidated Billing Only:** Limited to managing billing across accounts.
    - Click **Create Organization** to confirm.
    - Verify the Organization Setup: Once created, your AWS account becomes the management account of the organization. Setup IAM Identity Center using AWS console
