This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Prerequisites

- VS Code
- Node.js
- Docker Desktop

## Getting Started

First, open VS Code.

Open a terminal in VS Code and navigate to your desired directory:

```bash
cd "../directory_name"
```

Create a project directory and navigate into the directory you have created:

```bash
mkdir project_directory
cd project_directory
```

## Create Next.js Application

Initialize your Next.js app:

```bash
npx create-next-app@latest .
```

When prompted, select the options that fit your application needs.

Wait for the installation to complete, this may take a few minutes.

## Create Dockerfile

In VS Code, create a new file called `Dockerfile` in your project root.

Add the following content to your `Dockerfile`:

```dockerfile

# Sets the runtime to Node.js with version specified
FROM node:18-alpine

# Sets the working directory inside the container
WORKDIR /rhodes_mason_site

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Expose port 7775
EXPOSE 7775

# Start the application
CMD ["npm", "start", "--", "-p", "7775"]
```

## Create .dockerignore File

Create a `.dockerignore` file in your project root.

Add the following content to your `.dockerignore` file:

```dockerignore
node_modules
npm-debug.log
.next
.git
.gitignore
README.md
Dockerfile
.dockerignore
.env.local
.env.development.local
.env.test.local
.env.production.local
```

## Build Docker Image

Open Docker Desktop

In your terminal, run the following command with your desired Docker image name and build context:

```bash
docker build -t image_name ."
```

Wait for the build to complete, this may take several minutes.

## Run Docker Container

Run the container using the specified name and port:

```bash
docker run -d -p 7775:7775 --name container_name image_name
```

## Test

Open your browser and navigate to `http://localhost:7775`. You should see the Next.js application running from the Docker container.

Hope this helps!!