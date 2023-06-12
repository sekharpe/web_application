# Base image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --silent

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Serve the production-ready app with a lightweight web server
FROM nginx:alpine

# Copy the built app from the previous stage
COPY --from=0 /app/build /usr/share/nginx/html

# Expose port 80 (default for HTTP)
EXPOSE 80

# Start the web server
CMD ["nginx", "-g", "daemon off;"]
