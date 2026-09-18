cask "super-trouper" do
  version "0.3.0"

  on_arm do
    sha256 "138d42f60ee04f4a33c072df1ca79535e46cf31482dacaf59c73cb2ed0ac20e2"
    url "https://github.com/crissyfield/super-trouper/releases/download/v#{version}/super-trouper-#{version}-darwin-arm64.tar.xz"
  end

  on_intel do
    sha256 "8e48b97ec3954f7dfd0a7703d6cd0bdf5d77a89a7fa7ed9a5233b41dd92eed30"
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
