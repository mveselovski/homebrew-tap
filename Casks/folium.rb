cask "folium" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "cdeafddc04233796cd28c927dd2e308d48ddb331dec898f35ca62b268171deb8",
         intel: "43684d5cc8c7cbcbfd932fefcb0763352df7b11a73677995afd8c13da166dabc"

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
