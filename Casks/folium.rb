cask "folium" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "62f6419a39834e19292c78b13d753c8216a953434699fa611a54169e6781d390",
         intel: "35c84f0ff295f56ae9370f1ae806469bb843e96dc51979550747001d5a8ffd47"

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
