# use small node image
FROM node:alpine

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

RUN npm install -g npm@11.1.0
# install latest sfdx from npm
RUN npm install @salesforce/cli --global
RUN sf --version
RUN sf plugins --core

# revert to low privilege user
USER node
