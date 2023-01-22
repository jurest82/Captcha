# README

- [README](#readme)
  - [Summary](#summary)
  - [Setup](#setup)
    - [Development container](#development-container)
    - [Environment variables](#environment-variables)
  - [Execution](#execution)
  - [Testing](#testing)
  - [Technical documentation](#technical-documentation)
  - [Contribution guidelines](#contribution-guidelines)
    - [Code review](#code-review)
    - [Other guidelines](#other-guidelines)
  - [Glossary](#glossary)
    - [Service environment variables: `.envs/config.env`](#service-environment-variables-envsconfigenv)
    - [Serverless Framework deployment variables](#serverless-framework-deployment-variables)

---

## Summary

`Captcha`: repository contains a software stack that allows solver captchas using AWS Textract.

## Setup

### Development container

This steps are tailored to work with Visual Studio Code, but you are free to chose a different IDE and make necesary adjustments to the setup.

1. Install `ms-vscode-remote.remote-containers` extension. If you don't know how to do that follow this steps: <https://code.visualstudio.com/docs/editor/extension-gallery#_install-an-extension>
2. Open this project's folder in Visual Studio Code. The extension will detect a container configuration and will ask you if you want to reopen the project un the container. Accept.

### Environment variables

In `.envs` folder you'll need to create env files with the variables [here](#glossary).

---
## Contribution guidelines

### Code review

- Use known standards where situation allows it.
- Use known solutions for known problems.

### Other guidelines

- Investigate known and proven solutions before manufacturing your own.
- Check if our cloud provider offers a service you could use to solve the problem: evaluate ease of use, costs, maturity and reviews.
- If you need to use a library make sure it's mature, has continous releases, it's stable.
- If a solution starts to get too messy, it's probably not the right solution.

---

## Glossary

### Service environment variables: `.envs/config.env`

- `DEVELOPER`: username

### Serverless Framework deployment variables

- `stage`: Means the deployment stage. Values can be `dev`, `test` or `prod`
- Other deployment options can be set through CLI command. More info [here](https://www.serverless.com/framework/docs/providers/aws/cli-reference/deploy/)