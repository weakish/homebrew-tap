cask "paragon-extfs-installer" do
  version "12.1.19"
  sha256 "094b8bd8c56abf91ffa03155a3503b98c23e94904854380823a1033ce2200e82"
  url "https://dl.paragon-software.com/demo/trial_extfs#{version.major}.dmg"
  name "extFS for Mac by Paragon Software"
  desc "Read/write support for ext2/3/4 formatted volumes"
  homepage "https://www.paragon-software.com/home/extfs-mac/"

  livecheck do
    url :url
    strategy :extract_plist do |items|
      items["com.paragon-software.filesystems.extfs"].short_version
    end
  end

  depends_on macos: ">= :sierra"

  installer manual: "FSInstaller.app"

  uninstall launchctl: "com.paragon-software.extfs*",
            quit:      "com.paragon-software.extfs*",
            signal:    [
              ["KILL", "com.paragon-software.extfs.FSMenuApp"],
              ["KILL", "com.paragon-software.extfs.notification-agent"],
            ],
            kext:      "com.paragon-software.filesystems.extfs",
            pkgutil:   "com.paragon-software.pkg.extfs"

  zap trash: [
    "~/Library/Application Support/com.paragon-software.extfs.*",
    "~/Library/Caches/com.paragon-software.extfs.fsapp",
    "~/Library/HTTPStorages/com.paragon-software.extfs.*",
    "~/Library/Preferences/com.paragon-software.extfs.fsapp.plist",
    "~/Library/Saved Application State/com.paragon-software.extfs.fsapp.savedState",
    "~/Library/WebKit/com.paragon-software.extfs.fsapp",
  ]
end
