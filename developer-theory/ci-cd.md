# CI/CD

- What is CI/CD
  - Stands for Continuous Integration, Continuous Delivery / Deployment
  - Software development Best practice
  - Makes small changes and automate everthing - Small incremental code changes, Automate as much as possible ex- code integration, build, test and deployment
  - Why is it so Cool - Modern companies like - Amazon, Google, Facebook have pioneered this approach to releasing code, successfully applying thousands of changes per day
- Benefits of CI/CD Approach
  - Automatation is good - Fast, repeatable, scalable, enables rapid deployment
  - Manual is bad- Slow, error prone, inconsistent, unscalable, complex
  - small changes - test each code change and catch bugs while they are small and simple to fix
- Continuous Integration Workflow
  - Shared Code Repository: Multiple developers contributing to a shared code repo like GIT, frequently mergeing or integrating code updates
  - Automated Build: When changes appear in the code repo this triggers an automated build of the new code
  - Automated Test: Run automated test to check the code locally before it is committed into the master code repo
- Continuous Delivery & Deployment Workflow
  - Code is Merged : After successful tests, the code gets merged to the master repo
  - Prepared for Deployment: Code is built, tested and packaged for deployment
  - Manual Decision: Humans may be involved in the decision to deploy the code(Where and When to deploy). This is known as Continuous Delivery
  - Or Fully Automated: The system automatically deploys the new code as soon as it has been prepared for deployment. This is known as Continuous Deployment
- AWS Developer Tools
  - CodeCommit: (Source & Version Control) - Source control service enabling teams to collaborate on code, html pages, scripts, images and binaries [Like- Git]
  - CodeBuild : (Automated Build) - Compiles source code, runs tests and produces packages that are ready to deploy [Like- Actions]
  - CodeDeploy : (Automated Deployment) - Automates code deployments to any instance, including EC2, Lambda and on-premises [Like- webhook]
  - CodePipeline : (Manages the Workflow) - End-to-End solution, build, test and deploy your application every time there is a code change
- Exam Tips:
  - Continuous Integration - Integrating or merging the code changes frequently - at least once per day. Think CodeCommit
  - Continuous Delivery - Automating the build, test and deployment functions. Think CodeBuild and CodeDeploy
  - Continuous Deployment - Fully automated release process, code is deployed into Staging or Production as soon as it has successfully passed through the release pipeline. Think CodePipeline
- WHITE PAPER: https://d0.awsstatic.com/whitepapers/DevOps/practicing-continuous-integration-continuous-delivery-on-AWS.pdf

---

# CodeCommit

- [./assets/code-commit.png]
- Exam Tips:
  - Centralized Code Repo: A place to store your source code. Based on Git
  - Enables Collaboration: Manages updates from multiple users
  - Version Control: Tracks and manages code changes Maintains version history

---

# CodeDeploy

- Automated Deployment Service
- Works with EC2 instances, on-premises & Lambda
- Quick release new feature
- Avoid downtime during deployments
- Avoid the risks associated with manual processes
- Code deployments apporaches
  - In-Place:
    - The applications is stopped on each instance and the new release is installed. Also known as a rolling update
    - Steps:
      - The applications is stopped on the first instance
      - The instance will be out of service during the deployment so capcity is reduced.
      - You should configure your Elastic Load Balancer to stop sending the requests to the instance for which deployment is in go on( which is down )
      - CodeDeploy installs the new version, known as a Revision
      - The instance comes back into service
      - CodeDeploy continues to deploy to the next instance
    - How to Rollback in deployment process ?
      - If you change your mind, there's no quick fix
      - With an in-place deployment you'll need to re-deploy the previous version which can be time consuming
  - Blue/Green:
    - New instances are provisioned and the new release is intalled on the new instances. Blue represents the active deployment, green is the new release
    - Steps:
      - Blue represents the current version of our application
      - CodeDeploy provisions new instances
      - The new Revision is deployed to the Green environment
      - The Green instances are registered with the Elastic Load balancer
      - Traffic is routed away from the old environment
      - The Blue environment is eventually terminated
    - How to Rollback in deployment process in Blue/Green?
      - With Blue/Green, its easy
      - Just set the load balancer to direct the traffic back the original environment
      - Thus easy to swtich between the old and new releases
      - Only works if you didn't already termiate your old environment
- Difference b/w in-place and blue/green:
  - In-place:
    - Capacity is reduced during the deployment
    - Lambda is not supported
    - Rolling back involves a re-deploy
    - Great when deploying the first time
  - Blue/Green
    - No capcity reduction
    - Green instances can be created ahead of time
    - Easy to switch between old and new
    - You play for 2 environments untill you terminate the olde servers
- NOTE : Safest Option for code deployment in production environment is - Blue/Green approach
- Configure CodeDeploy using the AppSpec File
  - Configuration File: Defines the parameters to be used during a codeDeploy deployment
  - EC2: For EC2 and on-premises systems, YAML only
  - Lambda: YAML and JSON supported. File Structure depends on weather you are deploying to lambda or EC2
  - AppSpec file Structure:
    - Version: Reserved for future use- Current allowed version value is 0.0
    - OS: Operating System version- linux, windows
    - file: Configuring files, packages- The location of any applications files that need to be copied and where they should be copied to
    - hooks: Lifecycle event hooks- Scripts which need to run at set points in the deployment lifecycle. Hooks have a very specific run order
- Scripts You might run during the deployment process
  - Unzip Files: Unzip application files prior to deployment
  - Run Tests: Run functional tests on a newly deployed application
  - Deal with Load Balancing: De-register and re-register instances with a load balancer
  - [.assets/AppSec.png]
- NOTE: appspec.yml file must be placed at the root of the directory of your revision, otherwise the deployment will fail
- Exam Tips:
  - AppSpec is a Configuration File- Defines the parameter to be used by CodeDeply ex- OS, files, hooks
  - appspec.yml - Should be saved to the root of your revision
  - Hooks - Lifecycle events hooks have a very specific run order.

---

# CodeDeploy Lifecycle Event Hooks

- Lifecycle event hooks are run in a specific order known as the Run order
- Think CodeDeployment lifecycle event hooks in 3 phases (In-Place Deployment)
  - Phase-1 : De-register instances from a Load Balancer (BeforeBlockTraffic, BlockTraffic, AfterBlockTraffic)
  - Phase-2 : The real nuts & bolts of the application deployment (ApplicationStop, DownloadBundle, BeforeInstall, Install, AfterInstall, ApplicationStart, ValidateService)
  - Phase-3 : Re-register instances with the Load balancer (BeforeAllowTraffic, AllowTraffic, AfterAllowTraffic)
- Lifecycle Hooks:
  - BeforeBlockTraffic: Before - Tasks/scripts you want to run on instances before they are de-registered from a load balancer
  - BlockTraffic: block - De-register instances from a Load Balancer
  - AfterBlockTraffic: after - Tasks you want to run on instances after they are de-registered from a Load Balancer
  - ApplicationStop: Gracefully stops the application
  - DownloadBundle: CodeDeploy agent copies the application revision files to a temporary location
  - BeforeInstall: Pre-installation scripts ex- backing up the current version, decrypting files
  - Install: Copy application revision files to final location
  - AfterInstall: Post-install scripts ex- configuration, file permissions
  - ApplicationStart: Start any services that were stopped during ApplicationStop
  - ValidateService: Run tests to validate the service
  - BeforeAllowTraffic: before - Tasks you want to run on instances before they are registered with the load balancer
  - AllowTraffic: Allow - Register instances with a load balancer
  - AfterAllowTraffic: After - Tasks you want to run on instances after they are registered with a Load Balancer

---

# CodePipeline

- A fully Managed CI/CD Service
  - Orchestrates Build, Test & Deployment: The pipeline is triggered everytime there is a change to your code. like a conductor in an orchestra
  - Automated Release Process: Fast, consistent, fewer mistakes. Enables quick release of new features and bug fixes
  - CodePipeline integrates with: CodeCommit, CodeBuild, CodeDeploy, Github, Jenkins, Elastic Beanstalk, CloudFormation, Lambda, Elastic Container Service
- Example CodePipeline Workflow
  - CodePipeline: Workflow is defined- The workflow begins when there is a change detected in your source code.
  - CodeCommit: New Code Appears- New source appears in the codeCommit Repository
  - CodeBuild: Code is Build & Tested- CodeBuild immediately compiles source code, runs tests, and produces packages
  - CodeDeploy: Application Deployed- The newly build application is deployed into a staging or production environment
- ExamTips:
  - Continuous Integration/Continuous Delivery Service: Orchestrates you end-to-end software release process based on a workflow you define
  - Automated: Automatically triggers your pipeline as soon as a change is detected in your source code repository
  - Integrates with AWS & Third-Party Tools: CodeCommut, CodeBuild, CodeDeploy, Github, Jenkins, Elastic Beanstalk, Cloudformation, Lambda, Elastic Container Service

---

# Elastic Container Service

- What are Containers: Similar to a virtual machine, more like a virtual operating environment.
- Standardized: A standardized unit with everything the software needs to run ex- libraries, system tools, code and runtime
- Microservices: Applications are created using independent stateless components or microservice running in containers
- Docker or Windows Containers:
  - Use Docker to create a linux containers and windows containers for windows workload
  - [.assets/running-containerized-microservices-on-aws.pdf]
  - REF: https://d1.awsstatic.com/whitepapers/DevOps/running-containerized-microservices-on-aws.pdf
- Docker Container Architecture: [.assets/docker-container.png]
- Advantages of Containers & Microservices Architecture:
  - Highly Scalable: If the application becomes over loaded, scale only the services you need.
  - Fault Tolerant: A single error in one of your containers shouldn't bring the entier app down.
  - Easy to Maintain: Easier to maintain, update and change than large monolithic applications
- What About ECS ?
  - A container orchestration service which supports Docker and Windows Containers
  - Quickly deploy and scale containerized workloads without having to install, configure, manage and scale your own orchestration platform
  - Similar to Kubernetes, but with deep integration with AWS services ex- IAM, VPC, Route53
  - Ewe can run containers as:
    - Clusters of Virtual Machines: ECS will run your containers on cluster of Virtual Machines
    - Fargate for Serverless: Use Fargate for serverless containers and you don't need to worry about the underlying EC2 instances
    - EC2 For More Control: If you want to controll the installation, configuration and management of your compute environment
- Elastic Container Registry:
  - If we have docker image, and want to deploy docker containers to ECS- first we should create Elastic Container Registry (ECR)
  - ECR - is a place or registry where you store your container images
  - [.assets/ECR.png]
- Other Services with ECS:
  - Amazon Sagemaker: Quickly deploy and scale machine learning models for training and inference jobs
  - Amazon Lex: Uses deep learning to build conversational interfaces ex- chatbots
  - amazon.com - Amazon own recommendation engine is running on ECS
- EXAM TIPS:
  - Containers:
    - Virtual operating environment with everything the software need to run.
    - Includes libraries, system tools, code and runtime
    - Allows applications to be built using independent stateless components or microservices running in multiple containers
  - ECS: (Container Orchestratation) ECS will run your containers on clusters of virtual machines
  - Fargate (Serverless) You don't need to worry about the underlying EC2 instances
  - EC2: (More Control) If you want to controll installation, Configuration and management of your compute environment
  - ECR (Container Registry)- This is where you can store your containers images. Docker or Windows Container

---

# Docker and CodeBuild Lab

- Docker is an Open Source technology which allows you to create applications based on either Linux or Windows containers
- A container is a lightweight standalone executable s/w package which includes everything the software needs to run-code, runtime environment, libraries, environment settings etc
- AWS provides Elastic Container Service as fully managed clustered platform which allows you to run your Docker images in the cloud
- AWS CodeBuild is a fully managed build service which runs a set of commands that you define, ex- compiles code runs tests and produces artifacts that are ready to deploy

---

# Docker and CodeBuild Exam Tops

- Docker commands to build, tag (apply an alias) and push your docker iamge to the ECR repository
  - docker build -t docker-repo .
  - docker tag docker-repo:latest 494039644227.dkr.ecr.us-east-1.amazonaws.com/docker-repo:latest
  - docker push 494039644227.dkr.ecr.us-east-1.amazonaws.com/docker-repo:latest
- Use buildspec.yml to define the build commands and settings used by CodeBuild to run your build
- You can override the settings in buildspec.yml by adding your commands in the console when you launch the build
- If your build fails, check the build logs in the CodeBuild console and you can also view the full CodeBuild log in CloudWatch
