# Best Assistant Infra

## Instructions

![Pasted image 20241030191250](https://github.com/user-attachments/assets/32c4a0b2-cfc5-418e-a0f6-1a4e12d6f01f)

> Best Assistant is a digital communications company. It helps businesses with everything related to digital marketing. The company plans to write a web portal that allows you to register and send the requirement form via the web. The company's architecture proposed the following stack:
>
> A Front-End application in Angular hosted on **S3**
> This application allows you to launch HTTP requests to a serverless function (on Lambda in Python Flask)
> The document uploaded via angular web interface is stored in **S3** and the file name is formatted as `name_date`
>
>The BestAssistant DevOps team’s objectives are to:
>
> 1. Make Angular application work properly locally via Docker
> 2. Make Python flask application work properly locally
> 3. Automate the Flask BackEnd application upload to the Lambda (first manually for testing later via Terraform)
> 4. Expose the Lambda via Lambda Function URL and then via API Gateway
> 5. Create a pipeline (CI/CD) via AWS Pipeline/Code Build/Github Action => **S3**

![Pasted image 20241030223413](https://github.com/user-attachments/assets/79f23aae-b806-4c4b-b083-30dd9fe8977c)

## Prerequisites

- AWS CLI
- Terraform Installed

## Installation
