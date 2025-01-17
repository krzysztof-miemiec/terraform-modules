# AWS Cert Lambda  
AWS Cert Lambda module creates infrastructure that provides certificates for a domain in a Route53 zone.  
Certificates are stored on S3 bucket (encrypted by KMS key) and are verified using DNS method.  
It is based on `certbot` and `letsencrypt.org`. CloudWatch events are used to trigger lambda according  
to `refresh_frequency_cron` (once every 12 hours by default).

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6, < 0.14 |
| aws | >= 2.49, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | >= 2.49, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain\_names | The domain name to use in the DNS A record for the Vault ELB (e.g. vault.example.com). Make sure that a) this is a domain within the var.hosted\_zone\_domain\_name hosted zone and b) this is the same domain name you used in the TLS certificates for Vault. Only used if var.create\_dns\_entry is true. | `list(string)` | `null` | no |
| hosted\_zone\_id | Identifier of a Hosted Zone in Route53. Lambda will get permissions to modify entries in this Hosted Zone for certificate validation purpose. | `string` | n/a | yes |
| name\_prefix | Name prefix for all AWS resources that are created with this module. | `string` | n/a | yes |
| owner\_email | E-mail of the domain owner. Lets Encrypt uses that e-mail address to send reminders regarding domain expiration. Using an alias is recommended, as it let's you avoid having a single person as a manager, i.e. devops-team@domain.org | `string` | n/a | yes |
| refresh\_frequency\_cron | CRON expresstion that determines when Vault should restart in order to refresh TLS certificates. Default: Run every 12 hours | `string` | `"0 */12 * * ? *"` | no |
| s3\_bucket\_name | Name of existing S3 bucket which will be used to store TLS certificates obtained from Let's Encrypt. | `string` | n/a | yes |
| s3\_bucket\_prefix | Path to certificates on exiting S3 bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_arn | ARN of Lambda Function |
| lambda\_iam\_role\_arn | ARN of Lambda's IAM Role, that has all required policies in place. |

