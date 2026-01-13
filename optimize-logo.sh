#!/bin/bash
# Script to optimize sweatpance logo for web use

# Check if ImageMagick is installed
if command -v convert &> /dev/null; then
    echo "Optimizing logo with ImageMagick..."
    # Resize to 600px width (2x for retina displays) and optimize
    convert img/sweatpance-logo.png -resize 600x -strip -quality 85 img/sweatpance-logo-optimized.png

    # Replace original with optimized version
    mv img/sweatpance-logo-optimized.png img/sweatpance-logo.png

    echo "✅ Logo optimized successfully!"
    ls -lh img/sweatpance-logo.png

# Try with Node.js and sharp
elif command -v node &> /dev/null; then
    echo "Trying with Node.js..."
    npm install sharp --no-save

    node -e "
    const sharp = require('sharp');
    sharp('img/sweatpance-logo.png')
        .resize(600, null, { fit: 'inside' })
        .png({ quality: 85, compressionLevel: 9 })
        .toFile('img/sweatpance-logo-optimized.png')
        .then(() => {
            const fs = require('fs');
            fs.renameSync('img/sweatpance-logo-optimized.png', 'img/sweatpance-logo.png');
            console.log('✅ Logo optimized successfully!');
        })
        .catch(err => console.error('Error:', err));
    "

# Try with Python and Pillow
elif command -v python3 &> /dev/null; then
    echo "Trying with Python..."
    pip3 install Pillow --user

    python3 -c "
from PIL import Image

# Open and resize logo
img = Image.open('img/sweatpance-logo.png')
width = 600
height = int(img.height * (width / img.width))
img_resized = img.resize((width, height), Image.Resampling.LANCZOS)

# Optimize and save
img_resized.save('img/sweatpance-logo.png', 'PNG', optimize=True, quality=85)
print('✅ Logo optimized successfully!')
"
else
    echo "❌ No image optimization tools found."
    echo "Please install ImageMagick, Node.js with sharp, or Python with Pillow"
    exit 1
fi
