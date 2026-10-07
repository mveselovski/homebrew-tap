# mveselovski/homebrew-tap

Homebrew formulae and casks for [Folium](https://github.com/mveselovski/folium), a fast, read-only viewer for folders of Word, Excel, CSV, Markdown, HTML and text documents.

```bash
brew install --cask mveselovski/tap/folium   # macOS app
brew install mveselovski/tap/folium          # command line (macOS and Linux)
```

Using the full `mveselovski/tap/…` name taps this repository and trusts the package in one step, so no separate `brew tap` or `brew trust` is needed.

| | Package |
|---|---|
| [`Casks/folium.rb`](Casks/folium.rb) | Folium.app — signed and notarized, Node.js bundled |
| [`Formula/folium.rb`](Formula/folium.rb) | `folium` command-line tool, with `brew services` support |

## Updates

[`update-folium.yml`](.github/workflows/update-folium.yml) checks for a new Folium release every hour and updates the formula when the release is tagged and the cask once its dmgs are uploaded. Run it by hand from the Actions tab to update immediately.
