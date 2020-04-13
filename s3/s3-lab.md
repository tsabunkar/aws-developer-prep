# S3 ACLs(Access Control lists) & Policies

- Services > Storage > S3
- Create bucket
- Bucket Name : tsabunkar-test-bucket (Should be Globally unique name)
  <!-- - Advance Settings
    - Versioning : Select (Keeps all the version of the buckets)
    - Server Access logging: Select (Keeps the logging of this bucket)
    - Tags : Project_Name Phoenix -->
- Upload a file (ex- image file)
- (To make this file publicly avaliable) -> (Your complete bucket access settings should be made public)
- Got your bucket > Permissions > Block Public Access
- Edit > De-select the checkbox for - Block all public access
- Save > Confirm
- Permission > Bucket Policy > Policy generator
- Step 1: Select Policy Type > Select Type of Policy : S3 Bucket Policy
- Step 2: Add Statement(s)
  - Effect: Allow
  - Principal: arn:aws:iam::494039644227:user/Tom (Entity which we are allowing/denying the access to) [Entity can be- IAM user, S3 bucket, S3 resource])
    - Let us give access to Only specific user present in IAM users group
    - Services > IAM
    - Users > (Select one of the user) Tom
    - (Copy) User ARN [arn:aws:iam::494039644227:user/Tom]
    - (Paste this ARN in Principal)
  - Actions : (Select) GetBuckeyPolicy
  - Amazon Resource Name (ARN) : arn:aws:s3:::tsabunkar-test-bucket (this ARN name is bucket on which your applying this policy)
  - Add Statement
  - Generate Policy > (This will give us the JSON Format of the bucket policy which you can copy + paste in ur bucket policy editor)

---

# Setup Encryption on S3 Bucket

- Aws Management Console > S3 > Create Bucket
- Bucket Name : tsabunkar-encrypted-files > Create bucket
- (Select) tsabunkar-encrypted-files
- Properties > Default encryption > (Here you can select which encryption technique u want AES-256 or AWS-KMS)

## Using Bicket Policy to do encryption

- Permissions > Bucket Policy > Policy Generator
- Step 1: Select Policy Type
  - Select Type of Policy: S3 Bucket Policy
- Step 2: Add Statement(s)
  - Effect: Deny (We will denying request which don't enforce encryption)
  - Principal: \* (aextrix -> will applied to all the service)
  - Actions: (Select) PutObject
  - Amazon Resource Name (ARN : arn:aws:s3:::tsabunkar-encrypted-files
  - (Click on) Add Conditions (Optional)
  - Add Conditions (Optional)
    - Condition: StringNotEquals
    - Key: S3:x-amz-server-side-encryption
    - Value: aws:kms
    - Click on > Add Condition
  - Add Statement
- Step 3: Generate Policy > Generate Policy
- Copy + paste the generate policy to > Bucket policy editor > Save
  [This bucket policy can viewed: ./s3-bucket-policy-encryption.json ]
- Error : Action does not apply to any resource(s) in statement
  (This error occoured bcoz- you Resource property has some issue i.e.- some services cannot be specified for individual resources, thus we need to apply wild card -> Action will be applied to all the resoruces within the bucket )
  solve : arn:aws:s3:::tsabunkar-encrypted-files/\* (To your Resource property)

## To Test this encryption is working to our bucket

- Upload > Add files
- (Choose any file)
- Set properties (Section) > Encryption: None (You got options, which you can select)
- Next > Upload
- (When we have uploaded the file, It failed > View Details : Forbidden)

- Upload > Add files
- (Choose any file)
- Set properties (Section) > Encryption: AWS KMS master-key > (Select) aws/s3
- Next > Upload
- (Successfull :)

- Upload > Add files
- (Choose any file)
- Set properties (Section) > Encryption: Amazon S3 master-key
- Next > Upload
- (When we have uploaded the file, It failed > View Details : Forbidden)

---

# CORS Configuration Lab

- (Allowing Code/resource which is one s3 bucket to access/reference code/resource which is another S3 bucket)
- Create Bucket
- Bucket Name : tsabunkar-myindex-website
- Bucket settings for Block Public Access : (de-select) Block all public access
- Create Bucket
- (Select) tsabunkar-myindex-website
- Properties > Static website hosting > Use this bucket to host a website
  - Index document: index.html
  - Error document: error.html
  - Save
- (Upload the files present inside -> ./cors-s3-bucket/bucket-1)
- Set permissions > Grant public read access to this object(s)
- Next > Upload
- Goto Properties > Static website hosting > (Click on url endpoint) http://tsabunkar-myindex-website.s3-website-us-east-1.amazonaws.com

## Now we want to access this bucket from Another bucket

- Create Bucket
- Bucket Name : tsabunkar-mycors-testbucket
- Bucket settings for Block Public Access : (de-select) Block all public access
- Create Bucket
- (Select) tsabunkar-mycors-testbucket
- Properties > Static website hosting > Use this bucket to host a website
  - Index document: index.html
  - Error document: error.html
  - Save
- (Upload the files present inside -> ./cors-s3-bucket/bucket-2)
- Set permissions > Grant public read access to this object(s)
- Next > Upload
- Goto Properties > Static website hosting > (Click on url endpoint) http://tsabunkar-mycors-testbucket.s3-website-us-east-1.amazonaws.com/loadpage.html
- (Copy above url)
- (paste into - tsabunkar-myindex-website buckets index.html file inside .load() method) [check ./cors-s3-bucket/index.html file] ==> Upload/Replace this modified index.html file into bucket-1/tsabunkar-myindex-website
- (Now if we visit bucket-1 index.html page - http://tsabunkar-myindex-website.s3-website-us-east-1.amazonaws.com , we can only see- index.html file, but it is not able to load the content from our second bucket ==> This is bcoz CORS issue)
- (To solve this issue- Need to add CORS configuration in bucket-2)
- (Goto bucket-2) tsabunkar-mycors-testbucket > Permission > CORS Configuration
- Add the CORS Configuration as mentioned : ./cors-s3-bucket/CORS_Configuration.txt
- Save

---
