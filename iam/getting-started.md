# IAM

- Login to AWS Account
- Services > Security, Identity, & Compliance > IAM
- Here you can find IAM users sign-in link, to use console
- Security Status :
  - Activate MFA on your root account (Enable another layer of authentication)
  - Create Individual IAM users (Bcoz we dont want all of users login into AWS console with root account, this we need to restrict access and give them only required access)

---

# Creating group, roles, policies

## Activating MFA on root account

- Security Status > Activate MFA on your root Account > Manage MFA
- MFA > Activate MFA
- Select a type of MFA device to assign > Virtual MFA Device
- (Now to check the list of devices which supports MFA) > Google Authenticator > Add New > Scan barcode opens in Mobile
- In AWS website > Setup virtual MFA Device > Use your virtual MFA app and your device's camera to scan the QR code > (Scan QR Code)
- Type two consecutive MFA codes below
  - Type both the consecutive codes which is appearing on our Google Authenticator Mobile phone
- Assign Virtual MFA
- Goback to > https://console.aws.amazon.com/iam/home#/home

## Creating Individual IAM users
