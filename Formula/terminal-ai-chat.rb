class TerminalAiChat < Formula
  desc "Terminal client for your ChatGPT web session"
  homepage "https://github.com/oddessentials/terminal-ai-chat-releases"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.2.1/terminal-ai-chat-aarch64-apple-darwin"
      sha256 "75eeb35cd6b02034e76b2c0d4c9a113873aa36a4dee9d1964db57a366e3831d8"
    end
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.2.1/terminal-ai-chat-x86_64-apple-darwin"
      sha256 "488160761a98c3bd61686224cf011cd9965f5fbd32142c6108ac00da80c25861"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oddessentials/terminal-ai-chat-releases/releases/download/v0.2.1/terminal-ai-chat-x86_64-unknown-linux-musl"
      sha256 "26d1999c64a717e386a7b0e19c8e650491931abc7acb411c47c8a6e65551c44f"
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
