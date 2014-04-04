require "formula"

class Packmol < Formula
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-14.072.tar.gz"
  sha1 "a5a1e6e0ed328b373867e64e2e639887f6401ca7"

  env :std

  depends_on :fortran

  def install
    system "./configure"
    system "make"
    bin.install("packmol")
  end
end
