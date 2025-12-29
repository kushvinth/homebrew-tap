class Lic < Formula
  include Language::Python::Virtualenv

  desc "Interactive license generator using GitHub's official API"
  homepage "https://github.com/kushvinth/lic"
  url "https://github.com/kushvinth/lic/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f38bc99981e42a9dc33d68dcfa5ff5ea09abca61e7864b780cd849bbd0ff404d"
  license "MIT"

  depends_on "pipx"
  depends_on "python@3.12"

  def install
    # Set PIPX_HOME to install within Homebrew's prefix
    ENV["PIPX_HOME"] = libexec/"pipx"
    ENV["PIPX_BIN_DIR"] = libexec/"bin"
    
    # Use pipx to install the package
    system Formula["pipx"].opt_bin/"pipx", "install",
           "--python", Formula["python@3.12"].opt_bin/"python3.12",
           buildpath
    
    # Link the installed binary
    bin.install_symlink libexec/"bin/lic"
  end

  test do
    system bin/"lic", "--version"
  end
end
