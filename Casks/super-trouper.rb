cask "super-trouper" do
  version "0.1.0"

  on_arm do
    sha256 "7ece1cc0f0a90241deefe277ecd706688d6ac7afa86479d9dad46b5ab158169a"
    url "https://github.com/crissyfield/super-trouper/releases/download/v#{version}/super-trouper-#{version}-darwin-arm64.tar.xz"
  end

  on_intel do
    sha256 "0d189a804c955fae203667437e9537559ce4b2d53dbdc1a998a53b06eb1f4689"
    url "https://github.com/crissyfield/super-trouper/releases/download/v#{version}/super-trouper-#{version}-darwin-amd64.tar.xz"
  end

  name "super-trouper"
  desc "Frida reverse-engineering MCP server"
  homepage "https://github.com/crissyfield/super-trouper"

  depends_on macos: :ventura
  binary "super-trouper"

  # Remove the download quarantine until release binaries are signed and notarized.
  postflight_steps do
    run "xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/super-trouper"]
  end
end
