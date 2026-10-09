cask "docklens" do
  version "1.0.12"
  sha256 "5430af626370ac56b8872aec965c4db7b80b03016e98d6c80d113f1b9a0595f2"

  url "https://dl.ailoop.uk/docklens/#{version}/DockLens.zip"
  name "DockLens"
  desc "Dock window previews: hover an icon to see and manage all of its windows"
  homepage "https://github.com/firstfu/DockLens-app"

  livecheck do
    url "https://github.com/firstfu/DockLens-app"
    strategy :github_latest
  end

  depends_on macos: :tahoe

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
