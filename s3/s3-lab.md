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
