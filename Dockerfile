# use small node image
FROM node:alpine

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

RUN node -v
RUN npm -v
# install latest sfdx from npm
# RUN npm install sfdx-cli --global
# RUN sfdx --version
# RUN sfdx plugins --core
RUN sudo npm install -g @salesforce/cli
RUN sfdx --version
RUN sf version

# revert to low privilege user
USER node
