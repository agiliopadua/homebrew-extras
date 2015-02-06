require "formula"

class Packmol < Formula
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-14.225.tar.gz"
  sha1 "024c2ef3df4adc584301b6124646f80b200984c8"

  env :std

  depends_on :fortran

  def install
    system "./configure"
    system "make"
    bin.install("packmol")
    (share/"packmol").install("solvate.tcl")
  end
end
