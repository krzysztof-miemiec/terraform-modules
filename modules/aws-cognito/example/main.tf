resource "aws_ses_email_identity" "sender" {
  email = "no-reply@boldare.com"
}

# ----------------------------------------------------------------------------------------------------------------------
# COGNITO USER POOL
# ----------------------------------------------------------------------------------------------------------------------

module "cognito" {
  source = "../"

  name = "boldare"

  email_source_arn = aws_ses_email_identity.sender.arn
  email_reply      = "no-reply@boldare.com"

  attributes = [
    {
      name                     = "email"
      type                     = "String"
      required                 = true
      mutable                  = false
      developer_only_attribute = false
      constraints              = {
        min_length = "0"
        max_length = "2048"
      }
    },
    {
      name                     = "boldare_user_id"
      type                     = "String"
      required                 = false
      mutable                  = false
      developer_only_attribute = false
      constraints              = {
        min_length = "1"
        max_length = "256"
      }
    }
  ]

  tags = {
    Envrionment = "dev"
  }
}
