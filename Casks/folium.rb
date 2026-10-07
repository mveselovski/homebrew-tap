cask "folium" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "b92bf802a068b66e57345ea2d108f9fa251bbf2f2ec3c9be1f7f4f551f6afcd7",
         intel: "57910233d96aafc288135ecb8a8a9c04fa5cea96c28ccaae840743a50b58fcfa"

  url "https://github.com/mveselovski/folium/releases/download/v#{version}/Folium-#{version}-#{arch}.dmg"
  name "Folium"
  desc "Local document browser for md, docx, xlsx, csv, html and txt files"
  homepage "https://github.com/mveselovski/folium"

  depends_on macos: :ventura

  app "Folium.app"

  zap trash: [
    "~/Library/Caches/io.github.mveselovski.folium",
    "~/Library/HTTPStorages/io.github.mveselovski.folium",
    "~/Library/Preferences/io.github.mveselovski.folium.plist",
    "~/Library/Saved Application State/io.github.mveselovski.folium.savedState",
    "~/Library/WebKit/io.github.mveselovski.folium",
  ]
end
