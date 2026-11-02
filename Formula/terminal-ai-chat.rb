class TerminalAiChat < Formula
  desc "Terminal client for your ChatGPT web session"
  homepage "https://github.com/oddessentials/terminal-ai-chat-releases"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.2.0/terminal-ai-chat-aarch64-apple-darwin"
      sha256 "acb28935299999cda41060660822f8254220a73fd789187c55f5a7da0d413a0d"
    end
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.2.0/terminal-ai-chat-x86_64-apple-darwin"
      sha256 "c76dadfca94b7518315e1628dc80d0e01d6309a43e18a106dde5934c1b981482"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.2.0/terminal-ai-chat-x86_64-unknown-linux-musl"
      sha256 "b2a6d6a60dea607f8cc2b675d41a0bfa37a86d1b6b2e491758c01a719521a858"
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
