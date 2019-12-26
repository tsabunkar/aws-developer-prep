# IAM (Identity Access Managment)

- IAM allows you to manage users and their level of access to the AWS Console.
- It is important to understand for administrating a Companys AWS account.

# What does IAM give you ?

- Centralized control of your AWS account
- Shared Access to your AWS account
- Granular Permissions (Enable default level of access to different user)
- Identity Federation (including Acive Directory AD, Facebook, LinkedIn, etc) [Provides user to login with facebook, etc ]
- Multifactor Authentication (One way auth, two way authentication,Google auth token )
- Provides temporary access for users/devices and services, as necessary (Temporary access to S3 buckets or dynamo DB )
- Allows you to set up your own password rotation policy
- Integrates with many different AWS services.
- Supports PCI DSS Compliance. ( related to - Payment card industry )

---

# Terminologies used

- Users : End users who would be using our application (think people)
- Groups : A collection of users under one set of permissions. ( Groups of users who want to access dynamo DB, then we can create this group and make one of IT Admin as Admin of this group who can manage[create, delete] the tables in the dynamodb of that group )
- Roles : You create roles and can then assign them to AWS resources (Role has set of permissions)
- Policies : A document that defines one (or more) permissions (A policy can be attached to a user or group or role)

---

# MFA

- AWS Multi-Factor Authentication (MFA) is a simple best practice that adds an extra layer of protection on top of your user name and password.
- MFA enabled, when a user signs in to an AWS Management Console, they will be prompted for their user name and password (the first factor—what they know), as well as for an authentication code from their AWS MFA device (the second factor—what they have).
- Taken together, these multiple factors provide increased security for your AWS account settings and resources.
- You can enable MFA for your AWS account and for individual IAM users you have created under your account. MFA can be also be used to control access to AWS service APIs.
