# Deployment Guide - Hostinger

## Quick Start

Upload only these files/folders to your Hostinger hosting:

```
index.html          ← The gallery page
images/             ← All your images (48 PNG files)
.htaccess           ← Server configuration (optional but recommended)
```

**Do NOT upload:**
- `gallery_config.json` (development only)
- `generate_gallery.py` (development only)
- `README.md`, `CLAUDE.md`, `DEPLOY.md` (documentation)

## Step-by-Step Deployment

### Method 1: File Manager (Easiest)

1. Log into your Hostinger control panel
2. Navigate to **File Manager**
3. Go to the `public_html` folder (or your domain's root folder)
4. Upload these files:
   - `index.html`
   - `.htaccess`
5. Upload the entire `images/` folder
6. Visit your domain to verify

### Method 2: FTP/SFTP

1. Connect to your Hostinger via FTP:
   - Host: Your domain or FTP hostname
   - Username: Your FTP username
   - Password: Your FTP password
   - Port: 21 (FTP) or 22 (SFTP)

2. Navigate to `public_html` or your domain folder

3. Upload:
   - `index.html`
   - `.htaccess`
   - `images/` folder (with all contents)

4. Set permissions if needed (usually 644 for files, 755 for folders)

5. Visit your domain to verify

### Method 3: Command Line (Advanced)

If you have SSH access:

```bash
# From your local directory
rsync -avz --exclude='*.json' --exclude='*.py' --exclude='*.md' \
  --include='index.html' --include='.htaccess' --include='images/' \
  ./ your-username@your-host:/path/to/public_html/
```

## After Deployment

### Verify Your Gallery

Visit: `https://yourdomain.com`

Check that:
- Gallery loads properly
- All images display
- Slider interactions work
- Layout is responsive on mobile

### Common Issues

**Gallery shows but images don't load:**
- Check that the `images/` folder uploaded completely
- Verify folder permissions (should be 755)
- Check file names are correct (case-sensitive on Linux servers)

**Blank page:**
- Check that `index.html` uploaded successfully
- View browser console for errors (F12)
- Verify file permissions (should be 644)

**.htaccess errors:**
- If you get a 500 error, rename `.htaccess` to `htaccess.bak` temporarily
- Contact Hostinger support about enabling required modules

## Future Updates

When you want to update the gallery:

1. **Locally**: Edit `gallery_config.json` and run `python3 generate_gallery.py`
2. **Upload**: Only upload the new `index.html` and any new images
3. **No need to re-upload**: `.htaccess` or unchanged images

### Adding New Images

1. Generate locally (as above)
2. Upload just the new image files to `images/` folder on Hostinger
3. Upload the updated `index.html`
4. Clear your browser cache to see changes

## File Sizes & Optimization

Current gallery:
- Total size: ~75 MB (48 PNG images)
- Individual PNGs: 116 KB to 2.5 MB each

**Optional optimization** (before uploading):
- Convert PNGs to WebP for smaller sizes
- Compress images without quality loss
- Hostinger typically handles sites up to 100GB, so 75MB is fine

## Security Notes

The `.htaccess` file:
- Prevents direct access to `.json`, `.py`, and `.md` files
- Disables directory browsing
- Enables compression and caching

These settings are optional but recommended for better performance and security.

## Domain Setup

If you're using a custom domain:
1. Point your domain to Hostinger nameservers (done in domain registrar)
2. Wait for DNS propagation (up to 48 hours)
3. Enable SSL certificate in Hostinger control panel (free with Let's Encrypt)
4. Access via `https://yourdomain.com`

## Support

For Hostinger-specific issues:
- Hostinger Knowledge Base: https://support.hostinger.com
- Live Chat: Available 24/7 in control panel
- Common upload limit: 256 MB per file (your files are well under this)
