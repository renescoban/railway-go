#!/bin/bash
# Deployment troubleshooting script

echo "🚀 Go Backend Deployment Troubleshooting"
echo "======================================="

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found. Install it with: npm install -g @railway/cli"
    exit 1
fi

# Check if logged in
echo "🔍 Checking Railway login status..."
if ! railway whoami &> /dev/null; then
    echo "❌ Not logged in to Railway. Run: railway login"
    exit 1
fi

echo "✅ Railway CLI is ready"

# Check local build
echo "🔍 Testing local build..."
if command -v go &> /dev/null; then
    if go build -o main .; then
        echo "✅ Local build successful"
        rm main
    else
        echo "❌ Local build failed"
        exit 1
    fi
else
    echo "⚠️  Go not installed locally, skipping local build test"
fi

# Show deployment options
echo ""
echo "📋 Deployment Options:"
echo "1. Use Nixpacks (recommended): Commit and push changes, Railway auto-deploys"
echo "2. Use Docker: Rename Dockerfile.backup to Dockerfile if Nixpacks fails"
echo "3. Manual deploy: railway up"
echo ""

# Ask user for preference
read -p "Choose deployment method (1/2/3): " choice

case $choice in
    1)
        echo "📦 Using Nixpacks deployment..."
        echo "Commit your changes and push to trigger auto-deployment"
        ;;
    2)
        echo "🐳 Switching to Docker deployment..."
        if [ -f "Dockerfile.backup" ]; then
            mv Dockerfile.backup Dockerfile
            echo "✅ Switched to backup Dockerfile"
            echo "Commit and push to deploy"
        else
            echo "❌ Dockerfile.backup not found"
        fi
        ;;
    3)
        echo "🚀 Manual deployment..."
        railway up
        ;;
    *)
        echo "❌ Invalid choice"
        ;;
esac
