# Docker Setup Instructions

This project contains a frontend and backend application that can be containerized and deployed using Docker and Docker Hub.

## Project Structure

```
Exam/
├── frontend2/           # Frontend (HTML + JavaScript)
│   ├── Dockerfile
│   ├── .dockerignore
│   └── index.html
├── backend2/            # Backend (Node.js + Express)
│   ├── Dockerfile
│   ├── .dockerignore
│   ├── package.json
│   └── server.js
├── docker-compose.yml   # Multi-container orchestration
└── DOCKER_SETUP.md      # This file
```

## Prerequisites

1. Docker installed on your system
2. Docker Hub account
3. Git repository (forked from the original)

## Step 1: Create Docker Hub Repository

1. Go to [Docker Hub](https://hub.docker.com)
2. Sign in to your account
3. Click "Create Repository"
4. Name it using your index number (e.g., `your-index-number`)
5. Set visibility to Public or Private as required
6. Click "Create"

## Step 2: Build and Push Docker Images

### Option A: Using Docker Compose (Recommended)

1. **Build the images:**
   ```bash
   docker-compose build
   ```

2. **Tag images for Docker Hub:**
   ```bash
   # Replace 'your-username' with your Docker Hub username
   # Replace 'your-index-number' with your actual index number
   
   docker tag exam_frontend your-username/your-index-number-frontend:latest
   docker tag exam_backend your-username/your-index-number-backend:latest
   ```

3. **Login to Docker Hub:**
   ```bash
   docker login
   ```

4. **Push images to Docker Hub:**
   ```bash
   docker push your-username/your-index-number-frontend:latest
   docker push your-username/your-index-number-backend:latest
   ```

### Option B: Build Individual Images

1. **Build backend image:**
   ```bash
   cd backend2
   docker build -t your-username/your-index-number-backend:latest .
   ```

2. **Build frontend image:**
   ```bash
   cd ../frontend2
   docker build -t your-username/your-index-number-frontend:latest .
   ```

3. **Login and push:**
   ```bash
   docker login
   docker push your-username/your-index-number-backend:latest
   docker push your-username/your-index-number-frontend:latest
   ```

## Step 3: Run the Application

### Using Docker Compose (Local Development)

```bash
# Start both services
docker-compose up

# Run in background
docker-compose up -d

# Stop services
docker-compose down
```

### Using Individual Containers

```bash
# Start backend
docker run -d -p 5000:5000 --name backend your-username/your-index-number-backend:latest

# Start frontend
docker run -d -p 80:80 --name frontend your-username/your-index-number-frontend:latest
```

## Step 4: Access the Application

- **Frontend:** http://localhost
- **Backend API:** http://localhost:5000/api/hello

## Step 5: Push Changes to Git Repository

1. **Add all files:**
   ```bash
   git add .
   ```

2. **Commit changes:**
   ```bash
   git commit -m "Add Docker configuration and Dockerfiles"
   ```

3. **Push to your forked repository:**
   ```bash
   git push origin main
   ```

## Docker Hub Repository Structure

Your Docker Hub repository should contain:
- `your-index-number-frontend:latest` - Frontend container
- `your-index-number-backend:latest` - Backend container

## Troubleshooting

### Common Issues:

1. **Port conflicts:** Make sure ports 80 and 5000 are not in use
2. **Docker login issues:** Ensure you're logged in with `docker login`
3. **Build failures:** Check Dockerfile syntax and file paths
4. **Network issues:** Ensure containers can communicate via the app-network

### Useful Commands:

```bash
# Check running containers
docker ps

# View container logs
docker logs container-name

# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)
```

## Verification

To verify everything is working:

1. Run `docker-compose up`
2. Open http://localhost in your browser
3. Click "Call Backend" button
4. You should see "Hello from Node.js Backend!" message

This confirms that the frontend and backend are properly connected through Docker networking.
