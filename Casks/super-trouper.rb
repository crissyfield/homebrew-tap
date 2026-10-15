cask "super-trouper" do
  version "0.5.0"

  on_arm do
    sha256 "d25082e7c989c04f193b5291d454ca6284053972707ed2b8174c24abe42884b2"
    url "https://github.com/crissyfield/super-trouper/releases/download/v#{version}/super-trouper-#{version}-darwin-arm64.tar.xz"
  end

  on_intel do
    sha256 "4ddb02d4d6d6e01638f5dfe912ed30e3aa0cb511dc805125c2ac2160cd7c6303"
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
