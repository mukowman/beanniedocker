FROM node:10

# Change working directory
WORKDIR "/app"

# Update packages and install dependency packages for services
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean \
 && echo 'Finished installing dependencies'

# Copy package.json and package-lock.json
RUN git clone https://github.com/beanni/beanni.git
#COPY package*.json ./

# Install npm production packages 
RUN npm install
RUN npm run build

COPY . /app

ENV NODE_ENV production
#ENV PORT 3000

#EXPOSE 3000

USER node

CMD ["npm", "run", "fetch"]
