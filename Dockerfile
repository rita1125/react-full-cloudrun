
# Use official Node.js image
FROM node:20-alpine

ENV NODE_ENV=production

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy app source
COPY . .

# Build Next.js app
RUN npm run build

# Expose the port and start the app
EXPOSE 3000
CMD ["npm", "start"]
