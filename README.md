# 3-Tier Infrastructure Deployment Using Terraform Modules on AWS

## Project Overview

This project demonstrates a complete **3-Tier Architecture Deployment** on AWS using **Terraform Modules**.

The infrastructure includes:

- Custom VPC
- Public and Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Web Tier (Nginx)
- Application Tier (PHP)
- Database Tier (Amazon RDS MySQL)

The project is fully automated using Terraform.

---

# Architecture Diagram

```text
                         INTERNET
                              |
                    +----------------+
                    | Internet Gateway|
                    +----------------+
                              |
                     Public Route Table
                              |
                    +------------------+
                    | Public Subnet    |
                    | Web Tier EC2     |
                    | Nginx + HTML Form|
                    +------------------+
                              |
                              |
                    +------------------+
                    | Private Subnet 1 |
                    | App Tier EC2     |
                    | Apache + PHP     |
                    +------------------+
                              |
                              |
                    +------------------+
                    | Private Subnet 2 |
                    | Amazon RDS MySQL |
                    +------------------+
```

---

# Project Structure

```text
3-tier-terraform-project/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── README.md
├── .gitignore
│
├── modules/
│   │
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── web/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── user_data.tpl
│   │
│   ├── app/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── user_data.tpl
│   │
│   └── rds/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

---

# AWS Services Used

- Amazon VPC
- EC2
- Security Groups
- Internet Gateway
- Route Tables
- Amazon RDS MySQL
- Terraform Modules

---

# Prerequisites

Before running this project, install:

## 1. Terraform

Install Terraform from:

https://developer.hashicorp.com/terraform/downloads

Verify:

```bash
terraform -version
```

---

## 2. AWS CLI

Install AWS CLI from:

https://aws.amazon.com/cli/

Verify:

```bash
aws --version
```

---

## 3. Configure AWS Credentials

Run:

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Region: eu-west-1
Output format: json
```

---

# Deployment Steps

## Step 1 — Clone Repository

```bash
git clone <your-github-repo-url>
```

Example:

```bash
git clone https://github.com/yourusername/3-tier-terraform-project.git
```

---

## Step 2 — Move to Project Directory

```bash
cd 3-tier-terraform-project
```

---

## Step 3 — Initialize Terraform

```bash
terraform init
```

This downloads required providers and modules.

---

## Step 4 — Validate Terraform Code

```bash
terraform validate
```

---

## Step 5 — Review Infrastructure Plan

```bash
terraform plan
```

---

## Step 6 — Deploy Infrastructure

```bash
terraform apply -auto-approve
```

Terraform will create:

- VPC
- Subnets
- Route Tables
- Internet Gateway
- Security Groups
- Web EC2
- App EC2
- RDS Database

---

# How the System Works

## 1. Web Tier

- Hosted in Public Subnet
- Runs Nginx
- Displays Registration Form
- Sends form data to App Tier

---

## 2. Application Tier

- Hosted in Private Subnet
- Runs Apache + PHP
- Receives form data
- Connects to MySQL RDS
- Inserts data into database

---

## 3. Database Tier

- Amazon RDS MySQL
- Hosted in Private Subnet
- Accessible only from App Tier Security Group

---

# Terraform Modules

## VPC Module

Creates:

- VPC
- Public Subnet
- Private Subnets
- Internet Gateway
- Route Tables

---

## Web Module

Creates:

- Web EC2 Instance
- Security Group
- Nginx Installation
- HTML Registration Form

---

## App Module

Creates:

- Application EC2 Instance
- Apache + PHP
- submit.php file
- Database Connection

---

## RDS Module

Creates:

- MySQL RDS
- DB Subnet Group
- Database Security Group

---

# Outputs

After deployment Terraform displays:

```text
Web Public IP
RDS Endpoint
App Private IP
```

Open browser:

```text
http://<WEB_PUBLIC_IP>
```

---
