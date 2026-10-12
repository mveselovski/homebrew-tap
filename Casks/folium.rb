cask "folium" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "f91174bce8a57982e3a2f156c3201ae0d9a4835eb6096f3536a55797f3a7380b",
         intel: "338774f233465e7cb5b14da759ac7a5a5307007ec2f295cae76bb541bd73f496"

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
