# Creating A DynamoDB Table Lab

- Service > Security, Identity, & Compliance > IAM
- (Create Role for dynamoDB)
- Roles > Create Role
- AWS Service > EC2 > Next
- Search: Dynamodb --> (Select) AmazonDynamoDBFullAccess > next
- Role name: db-admin > create role
- Service > Compute > EC2
- Running Instances > Launch Instance
- Amazon Linux 2 AMI > Next
- Configure Instance Details
  - IAM Role : db-admin (select)
  - Advanced Details
    - User data : (add bash script - [./bash-script])
- Add Tags
  - key: Name, Value: dynamodb-ec2
  - next
- Configure Security Group
  - Create a new security group
  - Add SSH and HTTP
  - Review and Launch
- Launch
- Select Key Pair : Create a new security group (Which you have already created for existing key pair)
- (Using your local machine login to EC2 instance -> Check connect)
- \$ cd /var/www/html
- \$ ls
- \$ sudo su
- (See the dynamodb directory and test.php is created)
- https://docs.aws.amazon.com/sdk-for-php/v3/developer-guide/getting-started_installation.html
- (Install Composer for Linux)
- https://getcomposer.org/download/
- (Run the above commands in EC2 instance) ==> [./php-composer.txt]
- \$ ls
- \$ cd dynamodb
- \$ ls
- \$ nano createtables.php (edit region- 'region' => 'eu-west-1' to 'us-east-1')
- \$ nano uploaddata.php (edit region- 'region' => 'eu-west-1' to 'us-east-1')
- Service > Database > DyanmoDB
- (You can see no table present)
- (Go to EC2 instance created) --> (Copy IPv4 public IP)
- (Open new tab) > 100.26.158.178/dynamodb/createtables.php [Create the tables]
- (Response table created)
- 100.26.158.178/dynamodb/uploaddata.php [Add data to the tables]
- (Now check the Tables tab in DynamoDB) (4 tables would be created)

- Can also use EC2 CLI to run sql queries
  - \$ aws dynamodb get-item --table-name ProductCatalog --region us-east-1 --key '{"Id":{"N":"205"}}'

---

# Scan v/s Query API

- Service > Database > DyanmoDB
- Tables Section
- (Select) ProductCatalog
- Items tab
- (Select dropdown) Query
- [Play with how you can search/query particular id]
- (Select dropdown) Scan
- Start Search - (Entier table)
- [play with Add filter]
  - Price, Number, > , 100
  - Start Search
