# use small node image
FROM node:alpine

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl coreutils

# install latest sfdx from npm
# RUN npm install sfdx-cli --global
# RUN sfdx --version
# RUN sfdx plugins --core
RUN npm install -g npm@11.1.0
RUN npm install -g @salesforce/cli
RUN sf version
RUN sf plugins --core

# revert to low privilege user
USER node

