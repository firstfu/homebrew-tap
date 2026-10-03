cask "docklens" do
  version "1.0.10"
  sha256 "31c8c464c771b096b5adea1f559158465f80eb02c6f01992ada68d825fcdd01e"

  url "https://github.com/firstfu/DockLens-app/releases/download/v#{version}/DockLens.zip"
  name "DockLens"
  desc "Dock window previews: hover an icon to see and manage all of its windows"
  homepage "https://github.com/firstfu/DockLens-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

  app "DockLens.app"

  zap trash: [
    "~/Library/Caches/com.firstfu.DockLens",
    "~/Library/HTTPStorages/com.firstfu.DockLens",
    "~/Library/Preferences/com.firstfu.DockLens.plist",
    "~/Library/Saved Application State/com.firstfu.DockLens.savedState",
  ]

  caveats <<~EOS
    DockLens is not notarized yet. The first time you open it, macOS blocks it:
    open System Settings > Privacy & Security, scroll down and click "Open Anyway".
    Then allow Accessibility when asked (Screen Recording is optional).
  EOS
end
