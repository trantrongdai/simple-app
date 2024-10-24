FROM node:18

#create app directory
WORKDIR /app

# install dependencies 
# A Wildcard to make sure that we will copy both package.json and package-lock.json
COPY package*.json /app/

RUN apt-get update && apt-get install -y build-essential python3 && rm -rf /var/lib/apt/lists/*

RUN npm install --legacy-peer-deps --unsafe-perm --verbose

RUN npm install

# Bundle app source
COPY . . 

EXPOSE 8080
CMD ["npm", "start"]
