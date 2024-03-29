# .NET Lambda Layer

This provides an AWS Lambda Layer containing .NET 5. This does not do everything that the hosted runtimes do, it simply invokes a non-self contained, executable assembly that interacts with the Lambda Runtime API in order to reduce package sizes.

[Available on the Serverless Application Repository](https://console.aws.amazon.com/lambda/home?region=us-east-1#/create/app?applicationId=arn:aws:serverlessrepo:us-east-1:918601311641:applications/dotnet-lambda-layer)

**Current .NET Version**: 7.0.302

## News

The latest version of the layer has a couple breaking changes:

- The layer name has been renamed to `dotnet`
- Layer versions will now coincide with their respective .NET versions.
- The layer is now published to SAR via a different account, as a result of an account re-org.

## Usage

After deployed, you can add the layer to your Lambda.  You can see [a CloudFormation example of this here](https://github.com/cythral/lambdajection/blob/master/examples/CustomRuntime/cloudformation.template.yml).  

The handler scheme is the same as if you were using an AWS-hosted runtime: `Assembly::Class::Method`, however the runtime layer will ignore the class and method and simply execute the assembly given in the scheme.  The invoked assembly should handle interacting with the Lambda Runtime API (this can be done using the [RuntimeSupport package](https://github.com/aws/aws-lambda-dotnet/tree/master/Libraries/src/Amazon.Lambda.RuntimeSupport)).

## Manual Installation

This section can be ignored if you are deploying from the serverless application repository.

### Prerequisites

- [dotnet-install script](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script)
- The AWS CLI
- An AWS Account and IAM Credentials

### Building & Deploying

1. Run [build.sh](./build.sh) to run installation of the .NET runtime to the bin folder
2. Run `aws cloudformation package` on the deploy/dotnet-lambda-layer.template.yml file
3. Run `aws cloudformation deploy` on the packaged template

See the manual pages for the AWS CLI for specific options to use on the package and deploy commands.  You can also setup a CodeBuild project that builds the layer using the provided `buildspec.yml` file.

Please note that this repo uses a [custom CICD system built with step functions](https://github.com/cythral/cfn).  The CICD template and ASL file will not work out-of-the-box without this system.  A self-contained CodePipeline template be provided in the future.

