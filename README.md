# homebrew-terminal-tooling

Homebrew tap for [terminal-tooling](https://github.com/ezellbuoee/terminal-tooling):
Ghostty + Zellij + yazi + starship, themed Catppuccin Mocha.

```bash
brew install ezellbuoee/terminal-tooling/terminal-tooling
terminal-tooling install
```

## Releases

The `Update formula` workflow checks terminal-tooling for a new `vX.Y.Z` tag every
hour and points the formula at it. To publish a release, bump `VERSION` in
terminal-tooling and push a matching tag; run the workflow from the Actions tab
to pick it up right away.
