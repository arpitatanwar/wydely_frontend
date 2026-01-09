# Vercel Deployment Guide

This project is configured for deployment on Vercel.

## Configuration Files

- `vercel.json` - Vercel deployment configuration
- `package.json` - Contains the `build` script for production builds

## Deployment Steps

### Option 1: Deploy via Vercel Dashboard (Recommended)

1. Go to [vercel.com](https://vercel.com) and sign in
2. Click "Add New Project"
3. Import your GitHub repository: `arpitatanwar/wydely_frontend`
4. Configure the project:
   - **Root Directory**: Set to `Wydely-Whatsapp` (since the project is in a subdirectory)
   - **Framework Preset**: Other (or leave as default)
   - **Build Command**: `npm run build` (already configured in vercel.json)
   - **Output Directory**: `.expo/web` (already configured in vercel.json)
   - **Install Command**: `npm install` (already configured in vercel.json)
5. Click "Deploy"

### Option 2: Deploy via Vercel CLI

1. Install Vercel CLI globally:
   ```bash
   npm i -g vercel
   ```

2. Navigate to the project directory:
   ```bash
   cd Wydely-Whatsapp
   ```

3. Run the deployment command:
   ```bash
   vercel
   ```

4. Follow the prompts to complete the deployment

### Option 3: Automatic Deployments via Git

Once connected to Vercel, every push to your main branch will automatically trigger a new deployment.

## Important Notes

- The build output directory is `.expo/web` (configured in vercel.json)
- The project uses Expo SDK 52 with Metro bundler
- Make sure all environment variables (if any) are configured in Vercel's project settings
- The app will be accessible via a Vercel URL after deployment

## Troubleshooting

If you encounter build issues:
1. Check that Node.js version is compatible (Vercel uses Node 18.x by default)
2. Ensure all dependencies are listed in `package.json`
3. Check Vercel build logs for specific error messages
