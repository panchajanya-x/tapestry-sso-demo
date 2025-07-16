#!/bin/bash

# Google Cloud Setup Script for Tapestry SSO Demo
# Project ID: x-tapestry-exp-sosekowsky

set -e

PROJECT_ID="x-tapestry-exp-sosekowsky"
SERVICE_NAME="tapestry-sso-demo"
REGION="us-west4"

echo "🚀 Setting up Google Cloud for Tapestry SSO Demo"
echo "Project ID: $PROJECT_ID"
echo "Service: $SERVICE_NAME"
echo "Region: $REGION"

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ Google Cloud CLI is not installed."
    echo "Please install it from: https://cloud.google.com/sdk/docs/install"
    echo "Or on macOS: brew install google-cloud-sdk"
    exit 1
fi

echo "✅ Google Cloud CLI found"

# Login and set project
echo "🔐 Logging in to Google Cloud..."
gcloud auth login

echo "📋 Setting project to $PROJECT_ID..."
gcloud config set project $PROJECT_ID

# Enable required APIs
echo "🔧 Enabling required APIs..."
gcloud services enable cloudbuild.googleapis.com
gcloud services enable run.googleapis.com
gcloud services enable containerregistry.googleapis.com

echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Go to Cloud Build → Triggers in Google Cloud Console"
echo "2. Create a new trigger:"
echo "   - Name: tapestry-sso-demo-deploy"
echo "   - Event: Push to a branch"
echo "   - Branch: ^main$"
echo "   - Configuration: Cloud Build configuration file"
echo "   - File: /cloudbuild.yaml"
echo "3. Connect your GitHub repository: panchajanya-x/tapestry-sso-demo"
echo "4. Grant Cloud Run Admin permissions in Cloud Build Settings"
echo "5. Push your code to main branch to deploy!"
echo ""
echo "🌐 Your app will be available at:"
echo "https://$SERVICE_NAME-[HASH].$REGION.run.app"
