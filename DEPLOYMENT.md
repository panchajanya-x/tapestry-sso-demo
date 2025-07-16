# Deployment Configuration

**Project ID:** `x-tapestry-exp-sosekowsky`
**Service Name:** `tapestry-sso-demo`
**Region:** `us-west4`

## Quick Deployment Steps:

### 1. Install Google Cloud CLI (if not installed):
```bash
# macOS
brew install google-cloud-sdk

# Or download from: https://cloud.google.com/sdk/docs/install
```

### 2. Run the setup script:
```bash
./setup-gcloud.sh
```

### 3. Set up Cloud Build Trigger:
1. Go to [Cloud Build Triggers](https://console.cloud.google.com/cloud-build/triggers?project=x-tapestry-exp-sosekowsky)
2. Click "Create Trigger"
3. Configure:
   - **Name:** `tapestry-sso-demo-deploy`
   - **Event:** Push to a branch
   - **Source:** Connect GitHub repository `panchajanya-x/tapestry-sso-demo`
   - **Branch:** `^main$`
   - **Configuration:** Cloud Build configuration file
   - **File:** `/cloudbuild.yaml`

### 4. Grant Permissions:
1. Go to [Cloud Build Settings](https://console.cloud.google.com/cloud-build/settings/service-account?project=x-tapestry-exp-sosekowsky)
2. Enable:
   - ✅ Cloud Run Admin
   - ✅ Service Account User

### 5. Deploy:
```bash
git add .
git commit -m "Deploy to Google Cloud Run"
git push origin main
```

### 6. Get your URL:
After deployment, your app will be at:
`https://tapestry-sso-demo-[random-hash].us-west4.run.app`

### 7. Update Auth0:
- Add the Cloud Run URL to your Auth0 app settings
- Update `auth_config.prod.json` with the actual URL
