# HEIC → JPG

**Turn your iPhone and camera photos into JPGs on Windows. Unzip, double-click, done.**

Your phone saves photos as `.heic`, and half the apps, sites and printers out there won't open them. This little tool converts a whole folder of them to regular `.jpg` in one go, at full quality, without installing anything.

## Why you'll like it

- **Nothing to install.** ImageMagick is built in and runs straight from the folder.
- **One click.** Double-click the script, or drag a folder of photos onto it.
- **Safe.** Your originals are never touched. JPGs go into a new `converted` folder.
- **Smart.** Shows progress like `[3/120]` and skips photos it already converted, so you can run it again anytime.

## How to use it

1. Click **Code → Download ZIP** at the top of this page, then unzip it anywhere.
2. Put `convert-heic.bat` in your photo folder and double-click it,
   **or** drag your photo folder onto `convert-heic.bat`.
3. Open the new `converted` folder. Your JPGs are in there.

> Keep all the files together in one folder. The script uses the `magick.exe` sitting next to it.

## What's inside

| File | What it does |
| --- | --- |
| `convert-heic.bat` | The converter you double-click |
| `magick.exe` + `.xml` files | Portable ImageMagick 7.1.2 (Q16, x64) |
| `LICENSE.txt` | ImageMagick license |

## Requirements

Windows 10 or 11. That's it.

---

Built on [ImageMagick](https://imagemagick.org), used under its license (see `LICENSE.txt`).
