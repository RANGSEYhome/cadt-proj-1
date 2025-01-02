FROM node:18-slim
RUN npm install -g serve
WORKDIR /app

# Copy only the dependency files first
COPY ./frontend/package.json ./frontend/package-lock.json ./
COPY ./frontend/ ./
RUN npm install

# Copy the application files excluding unnecessary items (.dockerignore handles this)
RUN npm run build

EXPOSE 4000

CMD ["serve","-l","4000", "dist"]

# Start the application
# CMD ["npm", "run", "dev"]