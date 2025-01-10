# Setup IAM Identity Center using console and AWS CLI
---
This Guide is to show steps to Enable **IAM Identity Center** and create an **administrative user** and assign necessary permissions.

---

1. Enable IAM Identity Center:
    - Sign in to the AWS Management Console as the root user.
    - Navigate to IAM Identity Center (under Services or search for "IAM Identity Center").
    - Click Enable IAM Identity Center.
    - Follow the prompts to complete the setup:
        - Select between enabling Identity Center with AWS organization account or AWS account
            - AWS organization account: Recommended for learning real-world scenarios, as it allows centralized management of multiple accounts and access control across an organization. [AWS Organization Setup Guide](#aws-organization-setup-guide)
            - Suitable for general learning with a single account, but offers limited functionality compared to an organization setup.

2. Create Admin Group:
    - In the **IAM Identity Center dashboard**, go to **Groups**.
    - Click **Create group**.
    - **Group name**: 
        - Enter group name (e.g., Admins).
    - **Description**: *optional*
        - Group description detailing the permissions assigned to this group.
    - **Add users to group**: *optional*
        - Add workforce users to add to this group.
        if you have no users, They can be assigned to groups when creating users
    - Click **Create group**.

3. Create Admin User:
    - In the **IAM Identity Center dashboard**, go to **Users**.
    - Click **Add User**.
    - Fill in the user details:
        - Username: This username will be required for this user to sign in to the AWS access portal. The username can't be changed later.
        - Password: 
            - Select between sending an email to the user with password setup instructions or
            - Generate a one-time password (OTP) that can be shared with this user
            - Email address: to send the invitation to the user
            - First & Last names for the user
            - Display name: This is typically the full name of the workforce user (first and last name), is searchable, and appears in the users list.
    - Click **Next** to add users to group(s): *optional*
        - Select group(s) or just skip by clicking **Next**
    - Review all information are correct and click **Add user**
        - Upon successfull user addition you will get a message:
            "The user "example@email.com" was successfully added.
            The user will receive an email with a link to set up a password and instructions to connect to the AWS access portal. The link will be valid for up to 7 days. You can grant this user permissions to accounts or applications so that they can access their assigned AWS accounts and cloud applications when they sign in to the AWS access portal."

        **Important Notes**: 
        - in newly created organization there will be no users available, even the management account will need to be added as a user to the organization before being able to set permissions, so first create a user with you management account.

    - Assign the user to the Admins group created earlier.
    - Send the activation email to the user.
    - Complete the user setup by following the activation link.


**Additional Guides**
1. AWS Organization Setup Guide
    - Sign in to the AWS Management Console:
        Use your root user or a user with the necessary permissions.
    - Navigate to AWS Organizations:
        In the AWS Management Console, search for "Organizations" in the Services menu or use the URL: [AWS Organizations Console](https://console.aws.amazon.com/organizations/).
    - Create an Organization:
        - Click Create an Organization.
        - Choose one of the following modes:
            - All Features: Enables full functionality, including Service Control Policies (SCPs).
            - Consolidated Billing Only: Limited to managing billing across accounts.
    - Click Create Organization to confirm.
    - Verify the Organization Setup:
        - Once created, your AWS account becomes the management account of the organization.