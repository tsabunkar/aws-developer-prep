# IAM

- IAM consists of the following :
  - Users
  - Groups ( A way to group our users and apply policies to them collectively)
  - Roles
  - Policy Documents
- IAM is universals. It does not apply to regions at this time.
- The "root account" is simply the account created when first setup your AWS account. It has complete Admin access.
- New Users have NO Permissions when first created.
- New Users are assigned Access Key ID & Secret Access Keys when first created. These are not the same as a password, and you cannot use the Access Key ID & Secret Access key to Login in to the AWS Managment Console. but you can use this to access AWS via the APIs and Command Line however you only get to view Access Key ID & Secret Access Key once. If you lose them, you have to regenerate them. So, save them in a secure location.
- Always setup MFA (Multifactor Authentication) on your root account.
- You can create and customise your own password rotation policies.
