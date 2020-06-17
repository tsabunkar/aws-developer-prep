# Creating - Customer Master Key (CMK)

- Services > Security, Identity, & Compliance > IAM
- (Create users assign a group and give this users encryption keys)
- Groups > Create New Group
- Group Name : myKMSGroup
- Attach Policy : AdministratorAccess > Create Group
- Users > Add user
- User name: MyKeyManager
- Select AWS access type
  - Access type: (Select both)- Programmatic access & AWS Management Console access
  - Console password: Custom password (iamgroot)
  - Require password reset : (Unselect)
  - Next
- Add user to group : (select) myKMSGroup
- Create User
- User name: MyEncrypter (Create one more user)
- Select AWS access type
  - Access type: (Select both)- Programmatic access & AWS Management Console access
  - Console password: Custom password (iamgroot)
  - Require password reset : (Unselect)
  - Next
- Add user to group : (select) myKMSGroup
- Create User
- Services > (search for) kms
  - Create key
  - Configure key
    - Key type: Symmetric
    - Advanced options: KMS
  - Add labels
    - Alias: myEncrypKey
    - Tags: Key - team, value - finance
  - Define key administrative permissions
  - Key administrators: (select) MyKeyManager
  - Define key usage permissions: (select) MyEncrypter
  - Finish
- (had generated key policy in json format- [keyPolicy.json])
- (These are steps to create encryption key)
- NOTE:
  - Administrative Permissions: IAM users/roles that can administer (but not use) the key through the KMS API.
  - Usage Permissions: IAM users/roles that can use the key to encrypt and decrypt data

---

# KMS API Calls

- EC2 > Launch Instance > Start : dynamodb-ec2 (just EC2 instance not sepcific to anything)
- Service > IAM > Users (tab)
- MyEncrypter (select)
- Securtiy credentials (tab)
- Access keys (Make access key inactive) > Make inactive
- Create access key > Copy - Secret access key (paste in notepad)
- EC2 > Goto running instance - Connect - using local CLI
- \$ sudo su -l root
- \$ echo "Hello SABUNKAR" > secret.txt
- \$ cat secret.txt (Now we want to encrypt this other user, other than root)
- \$ aws configure (You should have access key ID, Secret Access key - csv file)
- (Default Region: us-east-1 )
- KMS > Customer managed keys > (select) myEncrypKey > Copy KeyID ---used---> <YOURKEYIDHERE>

- \$ aws kms encrypt --key-id <YOURKEYIDHERE> --plaintext fileb://secret.txt --output text --query CiphertextBlob | base64 --decode > encryptedsecret.txt
- \$ ll
- \$ cat encryptedsecret.txt (encrypted file)

- \$ aws kms decrypt --ciphertext-blob fileb://encryptedsecret.txt --output text --query Plaintext | base64 --decode > decryptedsecret.txt
- \$ ll
- \$ cat decryptedsecret.txt

- \$ aws kms re-encrypt --destination-key-id <YOURKEYIDHERE> --ciphertext-blob fileb://encryptedsecret.txt | base64 > newencryption.txt
- \$ ll
- \$ cat newencryption.txt

- \$ aws kms enable-key-rotation --key-id <YOURKEYIDHERE> (this will rotate the key)

---

# KMS key disable and deletion

- Service > KMS
- (Select the key) > Key Action > Disable
- (If you want to delete it)
- (Select the key) > Key Action > Schedule key deletion
- (It will take 7 days to delete the key)
