class TerminalAiChat < Formula
  desc "Terminal client for your ChatGPT web session"
  homepage "https://github.com/oddessentials/terminal-ai-chat-releases"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.3.0/terminal-ai-chat-aarch64-apple-darwin"
      sha256 "83a42d301904add8cd901924e663fb500a80370aaf9143e27bbdff130518e1df"
    end
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.3.0/terminal-ai-chat-x86_64-apple-darwin"
      sha256 "bede11ab557ae1cfd34e126f20bf991a231fae3db6653a8669be820d021b8e16"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.3.0/terminal-ai-chat-x86_64-unknown-linux-musl"
      sha256 "cc544133238ed12fb8129f14411ff34d625c5b5d72a2894044f20b1725fe86aa"
    end
  end

  def install
    bin.install Dir["terminal-ai-chat-*"].first => "terminal-ai-chat"
  end

  def caveats
    <<~TEXT
      Install the private browser runtime once, and again whenever terminal-ai-chat asks for it after an upgrade:
        terminal-ai-chat setup
    TEXT
  end

  test do
    assert_equal "terminal-ai-chat #{version}", shell_output("#{bin}/terminal-ai-chat --version").strip
  end
end
