#!/usr/bin/env bash
# Points Formula/folium.rb and Casks/folium.rb at the latest Folium release.
# The cask is only updated once both dmgs have been uploaded to the release.
set -euo pipefail

REPO="mveselovski/folium"
TAG="$(gh release view --repo "$REPO" --json tagName --jq .tagName)"
VERSION="${TAG#v}"
CHANGES=()

sha256_of() { curl -fsSL "$1" | sha256sum | cut -d' ' -f1; }

FORMULA=Formula/folium.rb
if [[ "$(sed -n 's|^  url ".*/tags/v\(.*\)\.tar\.gz"$|\1|p' "$FORMULA")" != "$VERSION" ]]; then
  URL="https://github.com/$REPO/archive/refs/tags/$TAG.tar.gz"
  SHA="$(sha256_of "$URL")"
  sed -i -e "s|^  url \".*\"|  url \"$URL\"|" -e "s|^  sha256 \".*\"|  sha256 \"$SHA\"|" "$FORMULA"
  CHANGES+=("formula $VERSION")
fi

CASK=Casks/folium.rb
if [[ "$(sed -n 's/^  version "\(.*\)"$/\1/p' "$CASK")" != "$VERSION" ]]; then
  ASSETS="$(gh release view "$TAG" --repo "$REPO" --json assets --jq '.assets[].name')"
  if grep -qx "Folium-$VERSION-arm64.dmg" <<<"$ASSETS" && grep -qx "Folium-$VERSION-x64.dmg" <<<"$ASSETS"; then
    BASE="https://github.com/$REPO/releases/download/$TAG"
    ARM="$(sha256_of "$BASE/Folium-$VERSION-arm64.dmg")"
    INTEL="$(sha256_of "$BASE/Folium-$VERSION-x64.dmg")"
    sed -i -E \
      -e "s/^  version \".*\"/  version \"$VERSION\"/" \
      -e "s/(arm: *)\"[0-9a-f]{64}\"/\1\"$ARM\"/" \
      -e "s/(intel: *)\"[0-9a-f]{64}\"/\1\"$INTEL\"/" "$CASK"
    CHANGES+=("cask $VERSION")
  else
    echo "Folium $VERSION dmgs not uploaded yet; leaving the cask at its current version"
  fi
fi

ruby -c "$FORMULA" >/dev/null && ruby -c "$CASK" >/dev/null
if (( ${#CHANGES[@]} )); then
  echo "Updated: ${CHANGES[*]}"
  echo "message=folium: update $(IFS=,; echo "${CHANGES[*]}" | sed 's/,/, /g')" >> "${GITHUB_OUTPUT:-/dev/null}"
else
  echo "Already at $VERSION"
fi
