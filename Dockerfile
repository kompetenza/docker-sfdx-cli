# use small node image
FROM node:alpine

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl coreutils

# install latest sfdx from npm
# RUN npm install sfdx-cli --global
# RUN sfdx --version
# RUN sfdx plugins --core

#RUN npm install -g npm@11.4.0
#RUN npm install -g sfdx-coverage-to-cobertura
#RUN npm install -g @salesforce/cli

RUN npm install -g npm@8
RUN npm install -g @salesforce/cli
RUN npm install -g sfdx-coverage-to-cobertura

RUN sf version
RUN sf plugins --core
RUN sf plugins install sfdx-git-delta

# revert to low privilege user
USER node

RUN npm install -g npm@8
RUN npm install -g @salesforce/cli
RUN npm install -g sfdx-coverage-to-cobertura
