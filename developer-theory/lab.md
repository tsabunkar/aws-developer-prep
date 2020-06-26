# CodeCommit

- Services > Developer Tools > CodeCommit
- Create repository
  - Repository name : test-aws-developer-prep
  - Create
- Clone URL > Clone HTTPS
- ( Copied url -> https://git-codecommit.us-east-1.amazonaws.com/v1/repos/test-aws-developer-prep )
- (Open url local CLI)
- \$ cd /tejas/workspace
- \$ git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/test-aws-developer-prep
- [
  ERROR: 403 -> The requested URL returned error: 403
  git config --global credential.helper '!aws codecommit credential-helper $@'
  git config --global credential.UseHttpPath true
  ]
- \$ cd test-aws-developer-prep
- \$ echo "Hello-world" > Readme.md
- \$ cat Readme.md
- \$ git status
- \$ git add .
- \$ git commit -m "First Commit"
- \$ git push -u origin master
- (To create branch using aws web app)
  - Branches (tab)
  - Create branch
  - Branch name : dev
  - Branch from : master
  - Create branch
- Create pull request
  - (Define Destination Source)
  - Compare
  - Create pull request
  - Merge
  - Fast forward merge
  - Merge pull request
