# AWS CLI - for s3 commands

- Create a Bucket: \$ aws s3 mb s3://tsabunkar-dummy
- List all your buckets: \$ aws s3 ls
- To List all files & folders inside Specific bucket: \$ aws s3 ls s3://tsabunkar-dummy
- Delete a Bucket: \$ aws s3 rb s3://tsabunkar-dummy
- Force delete bucket (subfolders & files in it): \$ aws s3 rb s3://tsabunkar-dummy --force

- Copy file to S3 bucket:

  - \$ cd ~/tejas/play-linux
  - \$ echo "I am ironman" >> ironman
  - \$ aws s3 cp ironman s3://tsabunkar-dummy/
  - \$ aws s3 ls s3://tsabunkar-dummy

- Copy File from S3 to local:

  - \$ rm -f ironman
  - \$ aws s3 cp s3://tsabunkar-dummy/ironman .

- Copy a directory to S3 bucket:

  - \$ aws s3 cp foo s3://tsabunkar-dummy/foo --recursive
  - \$ aws s3 ls s3://tsabunkar-dummy/foo/

- To remove a file/directory from S3 bucket:
  - \$ aws s3 rm s3://tsabunkar-dummy/ironman
- To move a file/directory from S3 bucket to local Machine :
  - \$ aws s3 mv s3://tsabunkar-dummy/avengers ./MyFile
  - \$ aws s3 mv s3://tsabunkar-dummy/avengers ./MyFile
- To sync local file system to S3 bucket:
  - \$ aws s3 sync . s3://tsabunkar-dummy/play-linux (play-linux dir not there it will first create it)
  - \$ aws s3 ls s3://tsabunkar-dummy
  - \$ aws s3 ls s3://tsabunkar-dummy/play-linux/foo/home/tejas/tejas/play-linux/

---

Resource : https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html

---

Syntax :

- aws s3 cp <src> <dest>
- aws s3 mv <src> <dest>
- aws s3 rm <path>
- aws s3 sync <source> <target> [--options]

---

# Advance s3 commands

- \$ aws s3 rm --recursive s3://tsabunkar-dummy/ (Remove all the previous files inside bucket)
- \$ aws s3 cp --recursive dist/portfolio/ s3://tsabunkar-dummy/ --acl public-read
  (--acl public-read ==> assuming your S3 bucket is configured to be publicly readable, this will ensure that the uploaded files are too.)

---
