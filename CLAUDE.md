# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is an **automated image gallery generator** for photo editing showcase galleries. The system generates a static HTML gallery from a configuration file that displays before/after image comparisons using interactive sliders and standalone images.

**Current State**: This directory appears to be a **deployment build** containing only the generated output (`index.html`) and images. The development files (`gallery_config.json` and `generate_gallery.py`) are not present in this directory.

## Project Architecture

### Gallery Generation System

The gallery is built using a config-driven generation approach:

1. **gallery_config.json** (not in this directory) - Defines gallery structure, image order, and display types
2. **generate_gallery.py** (not in this directory) - Python script that reads config and generates `index.html`
3. **index.html** - Generated HTML file with embedded CSS and JavaScript (DO NOT edit directly)
4. **images/** - Directory containing before/after image pairs

### Image Naming Convention

Images follow a strict naming pattern:
- Before/after pairs: `step_N_before.png` and `step_N_after.png`
- Solo images: `step_N_after.png` only
- N can be any number (1-99+)

### Gallery Item Types

**Slider** (`type: "slider"`):
- Interactive before/after comparison
- Requires both `step_N_before.png` and `step_N_after.png`
- Users drag to reveal before/after states
- Used for photo edits, enhancements, background changes

**Solo** (`type: "solo"`):
- Single image display
- Requires only `step_N_after.png`
- Used for magazine covers, posters, total conversions

### HTML Structure

The generated `index.html` is a self-contained file:
- **Styles**: Embedded in `<style>` tag (lines 8-108)
  - Dark theme using Zinc color palette (#18181b background)
  - Responsive grid layout (380px min column width)
  - Custom slider implementation with pointer events
- **Markup**: Gallery items generated from config
- **JavaScript**: Vanilla JS slider interaction (lines 244-287)
  - Pointer event-based dragging
  - Clip-path manipulation for before/after reveal

## Development Workflow

### If You Need to Modify the Gallery

Since the development files are missing from this directory, you'll need to:

1. **Create gallery_config.json** first by examining the current `index.html` to understand the current gallery structure
2. **Create generate_gallery.py** - a Python script that reads the config and generates HTML
3. Make changes to the config file
4. Run: `python3 generate_gallery.py`
5. The script overwrites `index.html` with the new gallery

### Adding New Images

1. Add images to `images/` following naming convention: `step_N_before.png` / `step_N_after.png`
2. Update `gallery_config.json` to include the new step
3. Regenerate: `python3 generate_gallery.py`

### Changing Gallery Appearance

Edit the `<style>` section in `generate_gallery.py` (NOT in `index.html` directly), then regenerate.

## Deployment

### Files to Deploy
- `index.html` (required)
- `images/` directory (required)
- `.htaccess` (optional but recommended)

### Do NOT Deploy
- `gallery_config.json` (development only)
- `generate_gallery.py` (development only)
- `README.md`, `CLAUDE.md`, `DEPLOY.md` (documentation)

### Deployment Script
Run `./prepare_deploy.sh` to create a `deploy/` folder with only deployment files.

### Hostinger-Specific
- Upload to `public_html/` directory
- File permissions: 644 for files, 755 for directories
- Total gallery size is ~75MB (48 PNG images)
- Enable SSL via Hostinger control panel

## Technical Details

### No Build Process or Dependencies
- Pure HTML/CSS/JavaScript (no frameworks)
- Python 3 stdlib only (no pip packages)
- No npm, webpack, or build tools

### Slider Implementation
The before/after slider uses:
- `clip-path: inset()` for revealing the before image
- Pointer Events API for drag interaction
- Position calculated as percentage of container width
- Visual indicator: white line with circular handle containing SVG icon

### Responsive Design
- CSS Grid with `repeat(auto-fill, minmax(380px, 1fr))`
- Images use `object-fit: contain` with 2:3 aspect ratio
- Works on desktop and mobile without media queries

## Image Requirements

- Format: PNG (current implementation)
- Aspect ratio: 2:3 (portrait orientation)
- Size: 116 KB to 2.5 MB per image (typical)
- Case-sensitive filenames on Linux servers

## Gallery Configuration Structure

```json
{
  "title": "Gallery Title",
  "footer": "© 2025 Copyright Text",
  "items": [
    {
      "step": 1,
      "type": "slider",
      "caption": "Description text"
    },
    {
      "step": 2,
      "type": "solo",
      "caption": "Another description"
    }
  ]
}
```

## Important Constraints

- **Never edit `index.html` directly** - changes will be overwritten on next generation
- **Step numbers don't need to be sequential** - items display in config order
- **Missing images will break the gallery** - ensure files exist before adding to config
- **File path references are relative** - images must be in `images/` subdirectory
