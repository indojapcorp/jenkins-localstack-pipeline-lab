FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y \
  awscli \
  python3-pip \
  unzip \
  terraform \
  && rm -rf /var/lib/apt/lists/*

# Optional: Install CDK
RUN npm install -g aws-cdk

USER jenkins
