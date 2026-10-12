cask "folium" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "4a04ba28ad813cd85e92ff939269763d188f7440090b4c5909465d6db53ec204",
         intel: "3f60a4d0caff1592f5b0b4293b605830d4e3489fe308eb04ab110ee6be3e55d4"

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
