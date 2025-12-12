class Devgod < Formula
  desc "devgod CLI"
  homepage "https://github.com/jeethsoni/devgod-cli"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeethsoni/devgod-cli/releases/download/v0.1.1/devgod_darwin_arm64"
      sha256 "ac999aefeaf4f922d4a3d27125db44cc2660d43792a293884347f8585d45fe3d"
    else
      url "https://github.com/jeethsoni/devgod-cli/releases/download/v0.1.1/devgod_darwin_amd64"
      sha256 "b19f2381a0688d032be6eff5027619229abd019dd38307c4e4399579d8323763"
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
