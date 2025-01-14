## Getting and Updating Account Password Policy
```bash
# Assuming that aliases where created for aws-vault exec default -- aws (as aws-cli) and aws-vault --debug exec default -- aws (as aws-cli-debug)
# Get account password policy
aws-cli iam get-account-password-policy
# Update account password policy based on proided custom password config file
aws-cli iam update-account-password-policy --cli-input-json file://knowledge_by_product/iam/iam/iam-config-files/iam-password-policy.json
```