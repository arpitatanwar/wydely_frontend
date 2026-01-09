# Vercel Deployment Guide

This project is configured for deployment on Vercel.

## Configuration Files

- `vercel.json` (at root) - Vercel deployment configuration with automatic directory handling
- `package.json` - Contains the `build` script for production builds
- `.nvmrc` - Specifies Node.js version 18
- `engines` field in `package.json` - Ensures Node.js >= 18.0.0

## Deployment Steps

### Option 1: Deploy via Vercel Dashboard (Recommended)

1. Go to [vercel.com](https://vercel.com) and sign in
2. Click "Add New Project"
3. Import your GitHub repository: `arpitatanwar/wydely_frontend`
4. Vercel will automatically detect the `vercel.json` configuration:
   - **Build Command**: `cd Wydely-Whatsapp && npm run build` (auto-configured)
   - **Output Directory**: `Wydely-Whatsapp/.expo/web` (auto-configured)
   - **Install Command**: `cd Wydely-Whatsapp && npm install` (auto-configured)
   - **Node Version**: 18 (specified in `.nvmrc` and `package.json`)
5. Click "Deploy"

**Note**: You can optionally set **Root Directory** to `Wydely-Whatsapp` in the dashboard, but it's not required as the commands handle the directory change automatically.

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

- The build output directory is `Wydely-Whatsapp/.expo/web` (configured in vercel.json at root)
- All commands automatically change into the `Wydely-Whatsapp` directory
- The project uses Expo SDK 52 with Metro bundler
- Node.js version 18 is specified via `.nvmrc` and `package.json` engines field
- Make sure all environment variables (if any) are configured in Vercel's project settings
- The app will be accessible via a Vercel URL after deployment

## Troubleshooting

If you encounter build issues:
1. Check that Node.js version is compatible (Vercel uses Node 18.x by default)
2. Ensure all dependencies are listed in `package.json`
3. Check Vercel build logs for specific error messages
