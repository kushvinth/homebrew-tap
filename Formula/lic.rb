class Lic < Formula
  include Language::Python::Virtualenv

  desc "Minimal interactive license generator"
  homepage "https://github.com/kushvinth/lic"
  url "https://github.com/kushvinth/lic/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f38bc99981e42a9dc33d68dcfa5ff5ea09abca61e7864b780cd849bbd0ff404d"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"lic", "--help"
  end
end
