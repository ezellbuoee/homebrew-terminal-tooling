class TerminalTooling < Formula
  desc "Ghostty + Zellij + yazi + starship terminal setup, themed Catppuccin Mocha"
  homepage "https://github.com/ezellbuoee/terminal-tooling"
  url "https://github.com/ezellbuoee/terminal-tooling/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d17e97bc7987cd14e8ece228a5ed653483d0d754c46c68752967b3adeef850da"
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
