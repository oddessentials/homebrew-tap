class TerminalAiChat < Formula
  desc "Terminal client for your ChatGPT web session"
  homepage "https://github.com/oddessentials/terminal-ai-chat-releases"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.3.1/terminal-ai-chat-aarch64-apple-darwin"
      sha256 "c5992c42731759bb14c2a64c2a7ed9fcfbedd95f2e093cee4b893cda7066e7bc"
    end
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.3.1/terminal-ai-chat-x86_64-apple-darwin"
      sha256 "26b537568c09e533d6ac25b330427229955c865f58e3b0c8f6f687fe4cb88100"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.3.1/terminal-ai-chat-x86_64-unknown-linux-musl"
      sha256 "f6d71449dbc4cd113f305bcb30f036c560beb450d24d2c779ceecf2321634350"
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
