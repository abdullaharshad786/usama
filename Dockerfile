FROM ubuntu:20.04

# Set DEBIAN_FRONTEND to noninteractive
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=$DEBIAN_FRONTEND

# Update and install dependencies
RUN apt-get update && apt-get install -y curl gnupg nano git

# Install npm
RUN apt-get install -y npm

# Install Node.js 16.x
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Install TypeScript
RUN npm install -g typescript

# Install RxJS
RUN mkdir rxjs && cd rxjs && npm i rxjs && npm install reflect-metadata && npm install @types/node && npm install underscore

# Install Angular
RUN npm install -g @angular/cli

# Install React
RUN mkdir product && cd product && npx -y create-react-app product-list --template typescript  && cd product-list && npm install @mui/material @emotion/react @emotion/styled && npm install @mui/icons-material

# Install Vue
RUN npm install -g @vue/cli

# Add TS4E folder and its contents
COPY TS4E /

RUN cd angular-application && npm install

RUN cd jestSimple && npm install && npm install jest --save-dev && npm install ts-jest --save-dev && npx ts-jest config:init && npm install typescript --save-dev && npm i --save-dev @types/jest && npm install jsdom --save-dev && npm install jquery && npm install @types/jsdom --save-dev && npm install @types/jquery --save-dev

RUN cd jestWatch && npm install && npm install jest --save-dev && npm install ts-jest --save-dev && npx ts-jest config:init && npm install typescript --save-dev && npm i --save-dev @types/jest

RUN cd protractor && npm install && npm install jest --save-dev && npm install ts-jest --save-dev && npx ts-jest config:init && npm install typescript --save-dev && npm i --save-dev @types/jest && npm install jsdom --save-dev && npm install jquery && npm install @types/jsdom --save-dev && npm install @types/jquery --save-dev && npm install -g protractor && webdriver-manager update && apt install default-jdk -y