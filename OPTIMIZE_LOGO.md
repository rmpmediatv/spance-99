# Logo Optimization Guide

Your current logo is **661KB** and **16667 x 7146 pixels**, which is too large for web use.

## Recommended Specifications
- **Width**: 600px (2x for retina displays, displayed at 300px)
- **File size**: Under 50KB
- **Format**: PNG with transparency

## Option 1: Run the automated script (if on local machine)

```bash
./optimize-logo.sh
```

## Option 2: Use online tools

1. **TinyPNG** - https://tinypng.com/
   - Upload your logo
   - Download the optimized version
   - Replace `img/sweatpance-logo.png`

2. **Squoosh** - https://squoosh.app/
   - Upload your logo
   - Resize to 600px width
   - Adjust quality to reduce file size
   - Download and replace

## Option 3: Manual optimization

### Using ImageMagick (command line):
```bash
convert img/sweatpance-logo.png -resize 600x -strip -quality 85 img/sweatpance-logo.png
```

### Using Photoshop/GIMP:
1. Open `img/sweatpance-logo.png`
2. Image → Scale Image
3. Set width to 600px (maintain aspect ratio)
4. Export as PNG with "Save for Web" option
5. Replace the original file

### Using Online Resizer:
1. Go to https://redketchup.io/image-resizer
2. Upload your logo
3. Resize to 600px width
4. Download and replace

## After Optimization

Commit the optimized logo:
```bash
git add img/sweatpance-logo.png
git commit -m "Optimize sweatpance logo for web performance"
git push
```

The current logo works fine functionally, but optimizing it will improve page load times significantly (from 661KB to ~30-50KB).
