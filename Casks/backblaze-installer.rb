cask "backblaze-installer" do
  version "9.0.0.750"
  sha256 "3e4df3b0cc3dc84acca9722647a2e43e0db8b3e46be2823c25f5c42fa6d0b1b2"

  url "https://secure.backblaze.com/mac/install_backblaze.dmg"
  name "Backblaze"
  desc "Data backup and storage service"
  homepage "https://backblaze.com/"

  livecheck do
    url "https://secure.backblaze.com/api/clientversion.xml"
    regex(/mac[._-]version=.*?(\d+(?:\.\d+)+)/i)
  end

  auto_updates true

  installer manual: "Backblaze Installer.app"

  uninstall launchctl: [
              "com.backblaze.bzbmenu",
              "com.backblaze.bzserv",
            ],
            delete:    [
              "#{appdir}/Backblaze.app",
              "#{appdir}/BackblazeRestore.app",
              "/Library/Logs/DiagnosticReports/bzbmenu_*.*_resource.diag",
              "/Library/PreferencePanes/BackblazeBackup.prefPane",
            ]

  zap trash: [
    "/Library/Backblaze.bzpkg",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.backblaze.*.sfl*",
    "~/Library/Logs/BackblazeGUIInstaller",
    "~/Library/Preferences/com.backblaze.bzbmenu.plist",
  ]
end
