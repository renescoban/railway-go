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

### 🚀 Quick Deployment (Nixpacks)

Railway will automatically detect your Go project and use Nixpacks for deployment:

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Deploy Go backend with Nixpacks"
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

### ✨ Why Nixpacks?

- **No Docker registry issues** - Railway's native build system
- **Faster deployments** - Optimized for Go applications
- **Automatic dependency detection** - No manual configuration needed
- **Better resource management** - Railway handles optimization
- **More reliable** - No network timeouts or registry problems

### 🔧 Configuration Files

Your deployment is configured via:
- **`nixpacks.toml`** - Build and runtime configuration
- **`railway.toml`** - Railway-specific settings
- **`.dockerignore`** - (Kept for future Docker use if needed)

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
├── railway.toml      # Railway deployment config
├── nixpacks.toml     # Nixpacks build configuration
├── go.mod           # Go module file
├── go.sum           # Go dependencies checksum
├── .gitignore       # Git ignore rules
├── .dockerignore    # Docker ignore rules (kept for compatibility)
└── README.md        # This file
```
