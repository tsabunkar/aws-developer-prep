# Making Alexa Skill

- S3 > Create bucket > bucket name : tsabunkar-alexskill (Give Public Access)
- Select the bucket > Permission > Bucket Policy
- (copy+paste the content ./bucket-policy.json)
- Save
- (Use this bucket to save our mp3 files)
- (Copy the bucket name ==> tsabunkar-alexskill)
- Service > Machine Learning > Amazon Polly
- (Add some text) > Synthesize to S3
  - S3 output bucket : tsabunkar-alexskill
  - Synthesize
- Goto- S3 synthesis tasks (tab) [If status is completed]
- Goto- S3 bucke created -> You can see the mp3 file, download here
- Service > Compute > Lambda
- Create function
- (Select) Browse Serverless App repository
- public applications (tab) > (select) alexa-skills-kit-nodejs-factskill
- Deploy (This will deploy alexskill to lambda)
- (select function) serverlessrepo-alexa-skil-alexaskillskitnodejsfact-1FOZ2ZXVFP7BB
- (You can see trigger as - Alexa skills kit)
- (copy the ARN of this function)
  arn:aws:lambda:us-east-1:494039644227:function:serverlessrepo-alexa-skil-alexaskillskitnodejsfact-1FOZ2ZXVFP7BB
- Goto - https://developer.amazon.com/
- Amazon Alexa > Create Alexa Skills > Console > create skill
  - Skill name: tsabunkarStudyBuddy
  - Choose a model to add to your skill: Custom
  - Choose a method to host your skill's backend resources: Provision your own
  - Create skill
  - Choose a template > Fact Skill > Choose
- Invocation (tab) [MainTab: Build]
  - Skill Invoation Name: tsabunkar space facts
  - Save Model
- Endpoint (tab)
  - Default Region: <copy_paste_lambda_arn>
  - Save
- Intents > GetNewFactIntent
  - Sample Utterances: <add_new_utterance>
  - a tsabunkar space fact (Add this utterance)
  - save model
  - Build Model
- [MainTab: Test]
  - Skill testing is enabled in: Development
  - Alexa Simulator: Open a tsabunkar space fact
- (Now, Need to point our fact --> S3 bucket which was generated by poly)
- Goto S3 bucket > (select) tsabunkar-alexskill
- (select) the mp3 file downloaded
- (copy+past) Object URL
  - https://tsabunkar-alexskill.s3.amazonaws.com/60f8b5f1-cd99-4b72-b30b-545a3828e618.mp3
- Goto Lambda Function > (select) serverlessrepo..
  - (Search) : Space Facts
  - ```
    FACTS:
      [
        '<audo src = \"https://tsabunkar-alexskill.s3.amazonaws.com/60f8b5f1-cd99-4b72-b30b-545a3828e618.mp3\" />',
      ],
    ```
  - Save
- Goto alexa developer console
  - Alexa Simulator: Open a tsabunkar space fact
  - (Now you will listen audio fact which was created by poly service)