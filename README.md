# Go Backend API

A simple Go backend API with REST endpoints, ready for deployment on Railway.

## API Endpoints

- `GET /` - Welcome message
- `GET /api/health` - Health check endpoint
- `GET /api/users` - Get list of users

## Local Development

1. Make sure you have Go installed
2. Run the server:
   ```bash
   go run main.go
   ```
3. Visit `http://localhost:8080` to test the API

## Deployment on Railway

### Prerequisites
- Railway account (https://railway.app)
- Railway CLI installed (optional, but recommended)

### Deployment Steps

1. **Connect your repository to Railway:**
   - Go to https://railway.app
   - Click "New Project"
   - Choose "Deploy from GitHub repo"
   - Connect your GitHub account and select this repository

2. **Railway will automatically detect:**
   - The `Dockerfile` for containerization
   - The `railway.toml` configuration
   - Environment variables and port settings

3. **Environment Variables (optional):**
   - Railway automatically sets the `PORT` environment variable
   - Add any additional environment variables in Railway dashboard under "Variables"

4. **Deploy:**
   - Railway will build and deploy automatically when you push to your main branch
   - Or manually trigger deployment in the Railway dashboard

5. **Check your deployment:**
   - Once deployed, Railway will provide a URL (e.g., `https://your-app.railway.app`)
   - Test the endpoints:
     - `https://your-app.railway.app/` - Welcome message
     - `https://your-app.railway.app/api/health` - Health check
     - `https://your-app.railway.app/api/users` - Users list

### Using Railway CLI (Alternative)

If you prefer using CLI:

1. Install Railway CLI:
   ```bash
   npm install -g @railway/cli
   ```

2. Login to Railway:
   ```bash
   railway login
   ```

3. Initialize Railway project:
   ```bash
   railway init
   ```

4. Deploy:
   ```bash
   railway up
   ```

## Project Structure

```
.
├── main.go           # Main application file
├── Dockerfile        # Docker configuration
├── railway.toml      # Railway deployment config
├── go.mod           # Go module file
├── .gitignore       # Git ignore rules
└── README.md        # This file
```
