# Complete Vercel Deployment Guide

This is a comprehensive step-by-step guide to deploy your Wydely WhatsApp Frontend project on Vercel.

## Prerequisites

- A GitHub account
- The repository `arpitatanwar/wydely_frontend` is already on GitHub
- A Vercel account (you can sign up for free at [vercel.com](https://vercel.com))

---

## Step 1: Sign Up / Sign In to Vercel

1. Go to [https://vercel.com](https://vercel.com)
2. Click **"Sign Up"** (or **"Log In"** if you already have an account)
3. Choose **"Continue with GitHub"** to connect your GitHub account
4. Authorize Vercel to access your GitHub repositories

---

## Step 2: Import Your Project

1. After logging in, you'll see the Vercel dashboard
2. Click the **"Add New..."** button (usually in the top right)
3. Select **"Project"** from the dropdown
4. You'll see a list of your GitHub repositories
5. Find and click on **`arpitatanwar/wydely_frontend`**
6. Click **"Import"**

---

## Step 3: Configure Project Settings

After importing, you'll see the **"Configure Project"** page. Here's what to set:

### Basic Configuration

1. **Project Name**: 
   - Default: `wydely-frontend` (you can change this if you want)
   - This will be part of your deployment URL (e.g., `wydely-frontend.vercel.app`)

2. **Root Directory**: 
   - **IMPORTANT**: Click **"Edit"** next to Root Directory
   - Change it to: `Wydely-Whatsapp`
   - This tells Vercel where your `package.json` is located

3. **Framework Preset**: 
   - Leave as **"Other"** or **"No Framework"**
   - Vercel will use the settings from `vercel.json`

### Build Settings (Auto-detected from vercel.json)

The following settings should be **automatically detected** from your `vercel.json` file:

- **Build Command**: `cd Wydely-Whatsapp && npm run build`
- **Output Directory**: `Wydely-Whatsapp/.expo/web`
- **Install Command**: `cd Wydely-Whatsapp && bash install.sh`
- **Development Command**: `cd Wydely-Whatsapp && npm run web`

**Note**: If these aren't auto-detected, you can manually enter them, but they should appear automatically.

### Environment Variables

1. If your app uses environment variables (API keys, endpoints, etc.):
   - Click **"Environment Variables"**
   - Add each variable:
     - **Name**: e.g., `API_URL`
     - **Value**: e.g., `https://api.example.com`
     - **Environment**: Select Production, Preview, and/or Development
   - Click **"Add"** for each variable

2. If you don't have environment variables, skip this step.

---

## Step 4: Deploy

1. Review all your settings
2. Click the **"Deploy"** button at the bottom
3. Vercel will start the deployment process
4. You'll see a build log in real-time

---

## Step 5: Monitor the Deployment

1. You'll see the build progress with logs
2. The build process will:
   - Clone your repository
   - Run the install command (`cd Wydely-Whatsapp && bash install.sh`)
   - Run the build command (`cd Wydely-Whatsapp && npm run build`)
   - Deploy the output to Vercel's CDN

3. **If the build succeeds**: 
   - You'll see a success message
   - Your app will be live at a URL like: `https://wydely-frontend.vercel.app`

4. **If the build fails**:
   - Check the build logs for errors
   - Common issues:
     - Missing environment variables
     - Build errors in your code
     - npm install failures (should be handled by the retry script)

---

## Step 6: Access Your Deployed App

1. Once deployment is complete, you'll see:
   - **Production URL**: `https://your-project-name.vercel.app`
   - **Deployment Status**: "Ready"

2. Click on the URL to open your deployed app in a browser

3. You can also find this URL later in your Vercel dashboard

---

## Step 7: Configure Custom Domain (Optional)

If you want to use your own domain:

1. Go to your project in Vercel dashboard
2. Click on **"Settings"** tab
3. Click on **"Domains"**
4. Enter your domain name
5. Follow the DNS configuration instructions
6. Vercel will automatically set up SSL certificates

---

## Automatic Deployments

After the initial setup:

- **Every push to `main` branch** → Automatically deploys to production
- **Every push to other branches** → Creates a preview deployment
- **Every pull request** → Creates a preview deployment with a unique URL

You don't need to manually deploy again unless you want to redeploy a specific version.

---

## Project Structure on Vercel

Your project structure that Vercel will use:

```
wydely_frontend/                    (Repository root)
├── vercel.json                     (Vercel configuration - auto-detected)
└── Wydely-Whatsapp/                (Root Directory set in Vercel)
    ├── package.json                (Dependencies and scripts)
    ├── install.sh                  (Install script with retry logic)
    ├── .npmrc                      (npm configuration)
    ├── .nvmrc                      (Node version: 18)
    ├── app.json                     (Expo configuration)
    └── src/                        (Your source code)
```

---

## Troubleshooting

### Build Fails with npm Install Error

- The `install.sh` script should handle retries automatically
- If it still fails, check the build logs for specific errors
- You may need to check if all dependencies are correctly listed in `package.json`

### Build Fails with "Module not found"

- Ensure all dependencies are in `package.json`
- Check that the Root Directory is set to `Wydely-Whatsapp`

### Build Succeeds but App Shows Blank Page

- Check the Output Directory is correct: `Wydely-Whatsapp/.expo/web`
- Verify the build actually created files in that directory
- Check browser console for JavaScript errors

### Environment Variables Not Working

- Ensure environment variables are set in Vercel dashboard
- Make sure they're set for the correct environment (Production/Preview/Development)
- Redeploy after adding new environment variables

### Need to Redeploy

1. Go to your project in Vercel dashboard
2. Click on **"Deployments"** tab
3. Find the deployment you want to redeploy
4. Click the **"..."** menu
5. Select **"Redeploy"**

---

## Quick Reference: Vercel Dashboard Settings

When configuring your project, these are the key settings:

| Setting | Value |
|---------|-------|
| **Root Directory** | `Wydely-Whatsapp` |
| **Framework Preset** | Other / No Framework |
| **Build Command** | `cd Wydely-Whatsapp && npm run build` |
| **Output Directory** | `Wydely-Whatsapp/.expo/web` |
| **Install Command** | `cd Wydely-Whatsapp && bash install.sh` |
| **Node Version** | 18 (from `.nvmrc`) |

---

## Support

If you encounter issues:

1. Check the build logs in Vercel dashboard
2. Review the error messages carefully
3. Ensure all configuration matches this guide
4. Check Vercel's documentation: [vercel.com/docs](https://vercel.com/docs)

---

## Summary Checklist

- [ ] Signed up/Logged in to Vercel
- [ ] Connected GitHub account
- [ ] Imported `arpitatanwar/wydely_frontend` repository
- [ ] Set Root Directory to `Wydely-Whatsapp`
- [ ] Verified build settings (auto-detected from vercel.json)
- [ ] Added environment variables (if needed)
- [ ] Clicked "Deploy"
- [ ] Build completed successfully
- [ ] App is accessible at the Vercel URL

---

**Your app should now be live on Vercel!** 🚀
