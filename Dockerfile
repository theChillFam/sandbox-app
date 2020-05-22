FROM node:latest
# Create app directory
WORKDIR /usr/src/app
# Copy over package*.json file
COPY package*.json ./
# npm install
RUN npm install
RUN npm install -g serve
# Copy src and public folders
COPY src src
COPY public public
# Expose port 3000
EXPOSE 5000
# Build production server
RUN npm run build
# Start react app
CMD [ "serve", "-s", "build" ]