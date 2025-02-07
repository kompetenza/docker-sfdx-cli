# Use a small node image
FROM node:18-buster

# Install dependencies (git, ca-certificates, openssh, openssl, jq, gettext, xmlstarlet, curl)
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

# Install the required npm version (only if necessary, check if node:alpine already ships with compatible npm)
RUN npm install -g npm@11.1.0

# Install Salesforce CLI globally
RUN npm install -g @salesforce/cli

# Check if the Salesforce CLI is installed correctly and in PATH
RUN which sf
RUN sf version

# Check installed CLI version and plugins
RUN sf plugins --core

# Revert to low privilege user (ensure node user can access the installed packages)
USER node
