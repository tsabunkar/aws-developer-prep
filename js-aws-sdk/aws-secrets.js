const {
  SecretsManagerClient,
  GetSecretValueCommand,
} = require('@aws-sdk/client-secrets-manager');

// a client can be shared by difference commands.
fetchScretesFromScretesManager = async function () {
  console.log('Trying to fetch Your Secrets');
  const client = new SecretsManagerClient({ region: 'us-east-2' });

  const command = new GetSecretValueCommand({
    SecretId: 'local/typeorm-lib/postgress',
  });

  // async/await.
  try {
    // process data.
    const response = await client.send(command);
    const parsedResponse = JSON.parse(response.SecretString);
    console.log(parsedResponse);
    console.log(data);
  } catch (error) {
    // error handling.
  } finally {
    // finally.
  }
};

fetchScretesFromScretesManager();
