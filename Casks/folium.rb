cask "folium" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "06dfcc89873e1278b3046e986a8139824f5b65562354eabacd2df14604a5a8fb",
         intel: "ee2d8e6f9166dd764124dc1ca8cd64c135267d69b2619a0d2b63a11ddbe6c6ae"

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
