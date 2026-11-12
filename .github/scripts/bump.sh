#!/bin/bash
# Point Formula/terminal-tooling.rb at the newest vX.Y.Z tag of terminal-tooling.
# Prints the new version when it changed the formula, nothing when it is current.
set -euo pipefail
REPO="https://github.com/ezellbuoee/terminal-tooling"
F="${1:-Formula/terminal-tooling.rb}"

tag="$(git ls-remote --tags --refs --sort=-v:refname "$REPO" 'v*' \
  | sed 's|.*refs/tags/||' | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | head -1)"
[[ -n "$tag" ]] || { echo "no release tag found" >&2; exit 1; }

url="$REPO/archive/refs/tags/$tag.tar.gz"
grep -qF "url \"$url\"" "$F" && exit 0

sha="$(curl -fsSL "$url" | shasum -a 256 | cut -d' ' -f1)"
sed -i.orig -e "s|^  url \".*\"|  url \"$url\"|" -e "s|^  sha256 \".*\"|  sha256 \"$sha\"|" "$F" && rm -f "$F.orig"
echo "${tag#v}"
