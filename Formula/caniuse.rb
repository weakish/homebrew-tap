require "language/node"

class CaniuseCmd < Formula
  desc "caniuse for the command line"
  homepage "https://github.com/sgentle/caniuse-cmd"
  url "https://registry.npmjs.org/caniuse-cmd/-/caniuse-cmd-1.3.1.tgz"
  version "1.3.1"
  sha256 "5331f4d073be8850d0f6155219ebeea7c544176d425f277a6ea6cd788bab281e"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end