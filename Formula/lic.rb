class Lic < Formula
  desc "Minimal interactive license generator"
  homepage "https://github.com/kushvinth/lic"
  url "https://github.com/kushvinth/lic/archive/refs/tags/v1.1.2.tar.gz" 
  sha256 "5fe078e0180ef1900ddd86dd4bb4543b51dff4b66e25593be82a612a3f2bd8d9"
  license "MIT"

  depends_on "python@3.12"
  depends_on "uv"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"

    # Create venv WITHOUT pip (Homebrew style)
    system python, "-m", "venv", libexec

    # Install project using uv
    system Formula["uv"].opt_bin/"uv", "pip", "install",
           "--python", libexec/"bin/python",
           "--no-cache",
           buildpath

    # Expose CLI
    bin.install_symlink libexec/"bin/lic"
  end

  test do
    system bin/"lic", "--help"
  end
end
