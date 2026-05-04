# Urban Sage Gallery Generator

This gallery uses an automated generation process that creates the HTML from a configuration file.

## How It Works

1. **gallery_config.json** - Configuration file defining which images to show and how
2. **generate_gallery.py** - Python script that generates index.html from the config
3. **images/** - Directory containing your before/after images

## Usage

### Regenerate the Gallery

Simply run:

```bash
python3 generate_gallery.py
```

This will regenerate `index.html` based on your current `gallery_config.json`.

### Adding New Images

1. Add your images to the `images/` directory:
   - For comparisons: `step_N_before.png` and `step_N_after.png`
   - For solo images: `step_N_after.png`

2. Edit `gallery_config.json` to add your new item:

   ```json
   {
     "step": 25,
     "type": "slider",
     "caption": "Urban Sage - Step 25"
   }
   ```

   Or for a solo image:

   ```json
   {
     "step": 26,
     "type": "solo",
     "caption": "Magazine Cover Title"
   }
   ```

3. Run the generator:

   ```bash
   python3 generate_gallery.py
   ```

4. Open `index.html` in your browser to view the updated gallery

### Configuration Options

#### Item Types

- **`slider`** - Interactive before/after comparison slider
  - Requires: `step_N_before.png` and `step_N_after.png`
  - Use for: Photo edits, enhancements, background changes

- **`solo`** - Single image display
  - Requires: `step_N_after.png`
  - Use for: Magazine covers, movie posters, dioramas, ID badges, total conversions

#### Config Structure

```json
{
  "title": "Urban Sage",
  "footer": "© 2025 Seed 13 Productions",
  "items": [
    {
      "step": 1,
      "type": "slider",
      "caption": "Urban Sage - Step 1"
    }
  ]
}
```

### Reordering Items

Simply rearrange the items in `gallery_config.json` and regenerate. The gallery will display items in the order they appear in the config file.

### Changing Styles

Edit the `<style>` section in `generate_gallery.py` to customize colors, layout, fonts, etc. Then regenerate the gallery.

## File Structure

```
.
├── README.md                 # This file
├── gallery_config.json       # Gallery configuration
├── generate_gallery.py       # Generation script
├── index.html               # Generated gallery (don't edit directly!)
├── CLAUDE.md                # Documentation for Claude Code
└── images/                  # Image assets
    ├── step_1_before.png
    ├── step_1_after.png
    └── ...
```

## Tips

- **Don't edit index.html directly** - Your changes will be overwritten when you regenerate
- **Version control** - Keep `gallery_config.json` in git, regenerate `index.html` as needed
- **Backup** - The script overwrites `index.html`, so make backups if needed
- **Custom captions** - Use descriptive captions for magazine covers, posters, etc.

## Requirements

- Python 3 (standard library only, no external dependencies)
- Modern web browser to view the gallery
