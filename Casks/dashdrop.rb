cask "dashdrop" do
  arch arm: "arm64", intel: "x64"
  version "0.0.1"
  sha256 arm: "c6c9e3d6331a4452e746e4365caf3f3f924143db3af6ed0e560f38e8b29b4cf4",
         intel: "35641bef3ae3dc695778f6a3c5373a1752f2547d0bd31ed6dbad7c1aec395da3"

  url "https://dashdrop.s3.ap-south-1.amazonaws.com/dashdrop-#{version}-mac-#{arch}.dmg"
  name "Dashdrop"
  desc "File transfer app"
  homepage "https://dashdrop.s3.ap-south-1.amazonaws.com/index.html"

  livecheck do
    url "https://dashdrop.s3.ap-south-1.amazonaws.com/updates.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :mojave"

  app "dashdrop.app"

  zap trash: [
    "~/Library/Application Support/Dashdrop",
    "~/Library/Caches/com.zedbyte.dashdrop",
    "~/Library/Cookies/com.zedbyte.dashdrop.binarycookies",
    "~/Library/Preferences/com.zedbyte.dashdrop.plist",
  ]
end
