# Published by scripts/publish-cask.sh in tanishqagg-dev/wassup. Don't edit by hand.
cask "wassup" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "89e463f54025102668b3697caca08484132cd68d06781091576b6f23db635630"
      url "https://github.com/tanishqagg-dev/wassup/releases/download/v0.1.0/wassup_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "dfc469d19c654d42662a07a85c11639afd771b04c704a81d7230c0b73eb1695f"
      url "https://github.com/tanishqagg-dev/wassup/releases/download/v0.1.0/wassup_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f7acad9365ddeacc77f89a9a7aa5a904d966a5b7d4b0d958d59c67f7fbe034dd"
      url "https://github.com/tanishqagg-dev/wassup/releases/download/v0.1.0/wassup_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "b83dd17768ddcff080418fa9a8caf781d7a3b03d7333427a5e6ca4d2b6a9e906"
      url "https://github.com/tanishqagg-dev/wassup/releases/download/v0.1.0/wassup_#{version}_linux_amd64.tar.gz"
    end
  end

  name "wassup"
  desc "WhatsApp from your terminal and your AI apps"
  homepage "https://github.com/tanishqagg-dev/wassup"

  livecheck do
    skip "Published on each release."
  end

  binary "wassup"

  # The CLI binary isn't notarized; drop the quarantine bit so macOS runs it.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/wassup"]
    end
  end

  zap :not_required
end
