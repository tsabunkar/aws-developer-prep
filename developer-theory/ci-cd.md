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
