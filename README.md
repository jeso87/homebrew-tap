# jeso87/homebrew-tap

A [Homebrew](https://brew.sh) tap for command-line tools from
[87dash](https://github.com/jeso87).

## Install

```sh
brew install jeso87/tap/shrinker
```

Homebrew expands `jeso87/tap` to this repository, so there is nothing to
`brew tap` first.

## What's here

### `shrinker`

Minifies images and graphics — JPEG, PNG, WebP, AVIF, HEIC, GIF and SVG —
using the same compression engine as the
[Shrinker Pro](https://shrinkerpro.app) app, without a window.

```sh
shrinker photo.jpg                              # a .min copy beside it
shrinker --quality super-low --to webp ./shots  # a whole folder
shrinker --json --quality 85 diagram.jpg        # one JSON line per file
```

It writes a `.min` copy next to each original and only overwrites with
`--in-place`. `--help` lists every flag.

**Requires Apple Silicon and macOS 14 or newer.** Every binary in the payload
is built arm64-only against a 14.0 deployment target, and the formula refuses
to install on anything else rather than leave you with a tool that won't run.

**Licensing.** Shrinker Pro's own code is MIT, but the installed payload also
carries gifsicle (GPL-2.0) and pngquant with libimagequant (GPL-3.0-or-later)
as executables, plus BSD and libpng components. The formula declares all of
them, and `THIRD-PARTY-LICENSES.md` is installed alongside the binaries.
Corresponding source for the GPL components accompanies every release on the
[releases page](https://github.com/jeso87/ShrinkerPro/releases).

## A note on the formulae

Files under `Formula/` are generated during a release — `scripts/release.sh`
in the ShrinkerPro repository fills in the version, the release URL and the
SHA-256 of the exact archive it just notarized. Editing one by hand here means
the next release overwrites your change, and a hand-typed checksum that
doesn't match the archive is an install failure for everyone. Change the
template in that repository instead.

## Issues

Bugs and requests belong on the tool's own tracker:
[jeso87/ShrinkerPro/issues](https://github.com/jeso87/ShrinkerPro/issues).
