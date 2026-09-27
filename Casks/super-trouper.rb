cask "super-trouper" do
  version "0.4.0"

  on_arm do
    sha256 "898243842b1e2eceefe61cfb862e2e1de329d786dd24b0cc0aa5d8d9577feb63"
    url "https://github.com/crissyfield/super-trouper/releases/download/v#{version}/super-trouper-#{version}-darwin-arm64.tar.xz"
  end

  on_intel do
    sha256 "0a120acc5f28f3691deb5b7213d888da82fe88869a1cbc98e5f7647b659e4e91"
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
