cask "bind-manager" do
  version "1.0.3"
  sha256 "67b3b1fca73bd7b1c766e6aa975d40dca7e474efa7709865b0ff63f01bca77b3"

  url "https://github.com/box-kr/bind-manager/releases/download/v#{version}/BindManager-#{version}.zip"
  name "Bind Manager"
  desc "macOS Utility for monitoring listening network ports and their processes"
  homepage "https://github.com/box-kr/bind-manager"

  app "BindManager.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/BindManager.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.andrew.BindManager.plist",
  ]
end
