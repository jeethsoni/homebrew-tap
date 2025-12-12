class Devgod < Formula
  desc "devgod CLI"
  homepage "https://github.com/jeethsoni/devgod-cli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeethsoni/devgod-cli/releases/download/v0.1.0/devgod_darwin_arm64"
      sha256 "ad78292f89fd178cdd6bf01411c8637a2a7e9a6869e78e2e3d84251ee1a64c83"
    else
      url "https://github.com/jeethsoni/devgod-cli/releases/download/v0.1.0/devgod_darwin_amd64"
      sha256 "63644891c0daa174552bb476be94f2b7f94a0a2b2c3b9eff69701d653a803002"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "devgod_darwin_arm64" => "devgod"
    else
      bin.install "devgod_darwin_amd64" => "devgod"
    end

    bin.install_symlink "devgod" => "dg"
  end

  test do
    system "#{bin}/devgod", "--help"
    system "#{bin}/dg", "--help"
  end
end
