# Use an official Node.js runtime as a parent image
FROM node:18.13.0

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build your React app
RUN npm run build

# Expose the port on which your React app will run
EXPOSE 3000

# Define the command to start your app
CMD ["npm", "start"]
