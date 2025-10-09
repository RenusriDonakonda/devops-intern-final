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
```bash
python3 hello.py

## 🐚 Step 2 — Linux & Scripting Basics

This step adds a shell script that prints system information.

### Script Location
`scripts/sysinfo.sh`

### What the Script Does
- Prints the **current user** (`whoami`)
- Prints the **current date and time** (`date`)
- Prints **disk usage** in human-readable format (`df -h`)

### How to Run
From the project root:
```bash
./scripts/sysinfo.sh

## 🐳 Step 3 — Docker Basics

### Build Docker Image
```bash
docker build -t hello-devops:latest .

###Run Docker Container
docker run --rm hello-devops

###Expected Output:
Hello, DevOps!
