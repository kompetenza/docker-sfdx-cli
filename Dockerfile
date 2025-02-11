# use small node image
# FROM node:alpine

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
# RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

# install latest sfdx from npm
# RUN npm install sfdx-cli --global
# RUN sfdx --version
# RUN sfdx plugins --core
# RUN npm install -g @salesforce/cli
# RUN sf version

# revert to low privilege user
# USER node

FROM busybox

# Installing necessary dependencies
RUN apk add --no-cache nodejs npm

# Install Salesforce CLI
RUN npm install -g @salesforce/cli

# Verify installation
RUN sfdx --version

# revert to low privilege user
USER node
