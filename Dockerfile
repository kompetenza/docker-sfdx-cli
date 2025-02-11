# use small node image
FRO#M node:alpine
FROM node:16-alpine

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

RUN node -v
RUN npm -v
RUN npm install -g npm@11.1.0
# install latest sfdx from npm
# RUN npm install sfdx-cli --global
# RUN sfdx --version
# RUN sfdx plugins --core
RUN npm install -g @salesforce/cli
RUN sf version

# revert to low privilege user
USER node
