# GitHub Actions Terraform Workflow

This GitHub Actions workflow automates Terraform operations for AWS infrastructure deployment with manual approval gates.

## Workflow Overview

```
  terraform (init & plan)
         ↓
     approval (manual review)
         ↓
      apply (auto-approve after approval)
```

## Workflow Stages

### 1. **Terraform Init & Plan** (`terraform` job)

- Checks out code
- Sets up Terraform v1.5.0
- Configures AWS credentials via OIDC
- Runs `terraform init` in the `terraform-assignment` directory
- Generates and uploads terraform plan artifact

### 2. **Manual Approval** (`approval` job)

- Waits for manual approval in the `production` environment
- **This step requires a reviewer to approve before proceeding**
- Uses GitHub environment protection rules

### 3. **Terraform Apply** (`apply` job)

- Downloads the saved plan artifact
- Applies with `-auto-approve` (safe because plan was already reviewed)
- Uploads apply output for records

## How to Use

### Trigger the Workflow

1. Go to **Actions** tab in your GitHub repository
2. Select **Terraform AWS** workflow
3. Click **Run workflow**
4. Choose `plan` from the dropdown (default)
5. Click **Run workflow**

### Approve the Deployment

1. The workflow will run init and plan
2. Go to **Deployments** tab and navigate to the `production` environment
3. Click **Review deployments**
4. Review the plan output
5. Click **Approve and deploy** to proceed with apply
6. Click **Reject** to cancel

## Prerequisites

Before running this workflow, you need to set up:

### 1. **AWS IAM Role for GitHub Actions** (OIDC)

```bash
# Create IAM role with trust relationship to GitHub
# Add this trust policy:
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::AWS_ACCOUNT_ID:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:GITHUB_ORG/GITHUB_REPO:*"
        }
      }
    }
  ]
}
```

### 2. **Replace Values in Workflow**

Update the following in `.github/workflows/terraform.yml`:

- `role-to-assume`: Your AWS IAM role ARN
- `aws-region`: Your AWS region
- `TF_VERSION`: Your Terraform version

### 3. **GitHub Environment Protection** (Optional but Recommended)

1. Go to repository **Settings** → **Environments**
2. Create `production` environment
3. Add **Required reviewers** (click "Add reviewer")
4. Click **Enable deployment branches** if needed

## Workflow Inputs

Currently accepts manual workflow dispatch. Can be extended with:

- Environment selection (dev/prod)
- Terraform variables
- Action choice (plan/apply/destroy)

## Artifacts

- **tfplan**: Terraform plan file (used for apply)
- **apply-output**: Terraform state and logs after apply

## Security Considerations

✅ Uses AWS OIDC (no long-lived credentials stored)  
✅ Requires manual approval before apply  
✅ Plan is reviewed before execution  
✅ Uses GitHub environment protection rules

## Troubleshooting

**Error: "couldn't find resource"**

- Check AWS role permissions and subnet/role ARNs in main.tf

**Approval button not showing**

- Ensure `production` environment is created in Settings
- Ensure reviewers are assigned

**Terraform init fails**

- Check backend configuration in `backend.tf`
- Verify AWS credentials and S3 bucket access

## Next Steps

To add more features:

- Add environment variables for dev/prod
- Add Terratest integration
- Add cost estimation
- Add Slack notifications
- Add auto-cleanup workflows
