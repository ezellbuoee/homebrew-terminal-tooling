class TerminalTooling < Formula
  desc "Ghostty + Zellij + yazi + starship terminal setup, themed Catppuccin Mocha"
  homepage "https://github.com/ezellbuoee/terminal-tooling"
  url "https://github.com/ezellbuoee/terminal-tooling/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ad809c739af87048aa71ec45fbdc30e75522c9f70c1ec852a3a7286344e96d73"
  head "https://github.com/ezellbuoee/terminal-tooling.git", branch: "main"

  depends_on :macos

  def install
    libexec.install Dir["*"], ".gitignore"
    bin.install_symlink libexec/"bin/terminal-tooling"
  end

  def caveats
    <<~EOS
      Run the installer to set up the tools and copy the configs into your home folder:
        terminal-tooling install

      It replaces ~/.zshrc and several ~/.config folders; the old files are
      backed up to ~/.config-backup-<timestamp>/ first.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/terminal-tooling version")
  end
end
