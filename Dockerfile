FROM alpine:3.8

# File Author / Maintainer
LABEL authors="Matt Koster <mattkoster@gmail.com>"

# Update & install required packages
RUN apk add --update nodejs bash git

# Install app dependencies
COPY package.json /bird/package.json
RUN cd /bird; npm install

# Copy app source
COPY . /bird

# Set work directory to /bird
WORKDIR /bird

# set port
ENV PORT 7301

# expose the port to outside
EXPOSE  7301

# start command as per package.json
CMD ["npm", "start"]
