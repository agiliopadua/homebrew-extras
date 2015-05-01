require "formula"

class Packmol < Formula
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-15.084.tar.gz"
  sha1 "9aff285e346d95332e1d905bd41cc05a2f65267c"

  env :std

  depends_on :fortran

  def install
    system "./configure"
    system "make"
    bin.install("packmol")
    (share/"packmol").install("solvate.tcl")
  end
end
