require "formula"

class Packmol < Formula
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-15.133.tar.gz"
  sha1 "ae8a045a3ef43b8dbaafbd3cff0020ccbe232303"

  env :std

  depends_on :fortran

  def install
    system "./configure"
    system "make"
    bin.install("packmol")
    (share/"packmol").install("solvate.tcl")
  end
end
