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
`dockerfile`
# Use a lightweight Python base image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Python script into the container
COPY hello.py .

# Run the script when the container starts
CMD ["python3", "hello.py"]

# Build Docker Image:

`docker build -t hello-devops:latest .`

# How to Run:

`docker run --rm hello-devops`


## Step-5: Deploy with Nomad

1. Install Nomad and start a local agent (for testing):
   nomad agent -dev

2. Submit the job file:
   nomad job run nomad/hello.nomad

   # Step-6: Monitoring with Grafana Loki

# How I started Loki (commands run)
1) Change to monitoring folder:
   cd monitoring

2) Start Loki + Promtail + Grafana:
   docker compose up -d
   # or: docker-compose up -d

3) Verify containers:
   docker ps

4) (Optional) Start a test log generator:
   docker run -d --name test-logger busybox sh -c "while true; do echo 'hello from test-logger $(date)'; sleep 5; done"
   # Or on systems where docker container files are not available to promtail:
   echo "Hello from Promtail $(date)" >> /tmp/test.log

# How I view logs
A) Grafana UI:
   - Open http://localhost:3000 (default admin/admin)
   - Add data source: Loki, URL http://loki:3100 (or http://localhost:3100)
   - Explore → run queries: {job="docker"} or {job="local-test"}

B) Direct Loki API:
   curl -G "http://localhost:3100/loki/api/v1/query" --data-urlencode 'query={job="docker"}'

C) Check Promtail activity:
   docker compose logs -f promtail

# Notes / Troubleshooting:
- On Windows/ Docker Desktop, /var/lib/docker/containers isn't available on the host; use WSL2 or use the 'local-test' __path__ (/tmp/*.log) as a workaround.
- Ensure Promtail has read access to the log paths (mounted as :ro in compose).
- If no logs appear, inspect promtail logs and verify Loki is reachable on port 3100.
