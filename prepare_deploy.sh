#!/bin/bash
# Prepare files for Hostinger deployment
# Creates a 'deploy' folder with only the files needed for hosting

echo "🚀 Preparing Workshop Wanderer Gallery for deployment..."

# Create deploy directory
DEPLOY_DIR="deploy"
rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"

# Copy necessary files
echo "📁 Copying files..."
cp workshop-wanderer.html "$DEPLOY_DIR/"
cp .htaccess "$DEPLOY_DIR/"

# Copy images directory
echo "🖼️  Copying images..."
cp -r images "$DEPLOY_DIR/"

# Count files
IMAGE_COUNT=$(find "$DEPLOY_DIR/images" -type f | wc -l | tr -d ' ')
TOTAL_SIZE=$(du -sh "$DEPLOY_DIR" | cut -f1)

echo ""
echo "✅ Deployment files ready in '$DEPLOY_DIR/' folder"
echo "   Files to upload:"
echo "   - workshop-wanderer.html"
echo "   - .htaccess"
echo "   - images/ ($IMAGE_COUNT files)"
echo "   Total size: $TOTAL_SIZE"
echo ""
echo "📤 Next steps:"
echo "   1. Log into Hostinger File Manager"
echo "   2. Navigate to public_html folder"
echo "   3. Upload all files from the '$DEPLOY_DIR/' folder"
echo "   4. Visit your domain to verify"
echo ""
echo "   Or use FTP to upload the contents of '$DEPLOY_DIR/'"
