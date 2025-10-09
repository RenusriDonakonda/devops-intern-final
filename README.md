[![CI](https://github.com/RenusriDonakonda/devops-intern-final/actions/workflows/ci.yml/badge.svg)](https://github.com/RenusriDonakonda/devops-intern-final/actions/workflows/ci.yml)

# DevOps Intern Final Assessment

**Name:** Donakonda Renusri 
**Date:** 2025-10-07

## 📘 Project Description
This repository is part of the DevOps Intern Final Assessment.  
It demonstrates a complete DevOps workflow using open-source tools like Linux, GitHub, Docker, CI/CD, Nomad, and monitoring.  
Each step produces real, usable output for the next, simulating a realistic DevOps pipeline.

---

## 🚀 Step 1 — Git & GitHub Setup
In this step, we:
- Initialized a local Git repository.
- Created a new public GitHub repository.
- Added a README file and a sample Python script (`hello.py`).
- Committed and pushed all files to GitHub.

### How to Run
Run the sample script to verify your setup:

`python3 hello.py`

## 🐚 Step 2 — Linux & Scripting Basics

### **Script Location**
`scripts/sysinfo.sh`

What the Script Does:
- Prints the current user (`whoami`)
- Prints the current date and time (`date`)
- Prints disk usage in human-readable format (`df -h`)

### How to Run
From the project root:

`./scripts/sysinfo.sh`



## 🐳 Step 3 — Docker Basics

This step containerizes the `hello.py` script so it can run in any environment using Docker.

---

### **Dockerfile Location**
`Dockerfile`

---

### **Dockerfile Content**
dockerfile
# Use a lightweight Python base image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Python script into the container
COPY hello.py .

# Run the script when the container starts
CMD ["python3", "hello.py"]

###Build Docker Image:

`docker build -t hello-devops:latest .`

###How to Run:

`docker run --rm hello-devops`
