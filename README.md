# Meslab Tap

## How do I install these formulae and casks?

`brew install meslab/tap/<formula>` or `brew install --cask meslab/tap/<cask>`.

Installing by the fully qualified name trusts only that formula or cask.
Homebrew only loads formulae and casks from non-official taps once they are
trusted, so to install by the short name, trust the item first:

```sh
brew tap meslab/tap
brew trust --formula meslab/tap/<formula>
brew install <formula>

brew trust --cask meslab/tap/<cask>
brew install --cask <cask>
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "meslab/tap"
brew "meslab/tap/<formula>", trusted: true
cask "meslab/tap/<cask>", trusted: true
```

## Available packages

- [`storysquish`](https://story-squish.github.io/storysquish/): scene board
  for planning and drafting novels. A cask on macOS and a formula built from
  source on Linux, so use `--cask` or `--formula` with its short name.

- [`pzpass`](https://github.com/pzpass/pzpass): password generator and
  encrypted password vault, built from source with Zig; installs `pzp`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
