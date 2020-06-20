# ElasticBeanStalk-

## Depolying Applications With Elastic Beanstalk

- Services > Compute > Elastic Beanstalk
- Create Application
- Create a web app
  - Application name : helloCloudGuru
  - Platform : PHP
  - Application code : (Select) Upload your code
  - Source code origin : (Select) Choose file --> Upload zip file [./original-src-code.zip]
  - Create Application (Take 5mins)
  - http://hellocloudguru-env.eba-spptmcav.us-east-1.elasticbeanstalk.com/ (Web app)
  - Go to EC2 - (you can see a new instance has been started by this bean stalk and its running)

---

# Updating Elastic Beanstalk (Uploading Version of Application)

- Service > Elastic Beanstalk > Applications (tab)
- (Select require enviro) Actions > View Application versions
- Upload Btn
  - Version label : hellocloudguru-source-2
  - Decription : Version-2 of application
  - (Upload new version of the application - modifiy some file)
  - Upload
- Applications > (click) helloCloudGuru > Hellocloudguru-env
- Configuration (tab)
- Rolling updates and deployments > Edit
  - Deployment policy : At all once (2 options)
- (To deploy new application version)
  - Applications > (click) helloCloudGuru
  - Application version (tab)
  - (select) hellocloudguru-source-2
  - Actions > Deploy
  - Deploy
- To delete above application
  - Applications > (click) helloCloudGuru
  - Actions > Delete application
  - Delete

---
