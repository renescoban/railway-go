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
- GitHub repository

### 🚀 Quick Deployment (Recommended)

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Deploy Go backend"
   git push origin main
   ```

2. **Deploy on Railway:**
   - Go to https://railway.app
   - Click "New Project" → "Deploy from GitHub repo"
   - Connect your GitHub account and select this repository
   - Railway will auto-detect Nixpacks and deploy automatically

3. **Test Your API:**
   - Visit the provided Railway URL
   - Test endpoints: `/`, `/api/health`, `/api/users`

### 🔧 Troubleshooting Deployment Issues

If you encounter build errors, try these solutions:

#### Solution 1: Use Nixpacks (Default)
- This uses Railway's native Go support (recommended)
- More reliable than Docker for Go applications
- Automatically configured via `nixpacks.toml`

#### Solution 2: Use Docker (If Nixpacks Fails)
If Nixpacks fails, switch to Docker:
```bash
mv Dockerfile.backup Dockerfile
git add Dockerfile
git commit -m "Switch to Docker deployment"
git push origin main
```

#### Solution 3: Manual Troubleshooting
Run the troubleshooting script:
```bash
chmod +x deploy.sh
./deploy.sh
```

### Common Issues & Solutions

**❌ "context canceled" error:**
- **Cause:** Network timeouts or Docker registry issues
- **Solution:** Use Nixpacks instead of Docker, or try the backup Dockerfile

**❌ "exit code: 137" error:**
- **Cause:** Memory limits during build
- **Solution:** The optimized Dockerfile handles this better

**❌ Build timeouts:**
- **Cause:** Large dependencies or slow network
- **Solution:** Use Nixpacks for faster builds

### Using Railway CLI (Alternative)

If you prefer CLI deployment:

1. Install Railway CLI:
   ```bash
   npm install -g @railway/cli
   ```

2. Login and deploy:
   ```bash
   railway login
   railway up
   ```

## Project Structure

```
.
├── main.go           # Main application file
├── Dockerfile        # Docker configuration (optimized)
├── Dockerfile.backup # Backup Docker config (if needed)
├── railway.toml      # Railway deployment config
├── nixpacks.toml     # Nixpacks configuration
├── deploy.sh         # Deployment troubleshooting script
├── go.mod           # Go module file
├── go.sum           # Go dependencies checksum
├── .gitignore       # Git ignore rules
├── .dockerignore    # Docker ignore rules
└── README.md        # This file
```
