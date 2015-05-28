require "formula"

class Packmol < Formula
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-15.133.tar.gz"
  sha1 "ae8a045a3ef43b8dbaafbd3cff0020ccbe232303"

  env :std

  depends_on :fortran

  resource "examples" do
    url "http://www.ime.unicamp.br/~martinez/packmol/examples/examples.tar.gz"
    sha1 "4ba51772c8cf9051e0f0339f5d3c1a28a482d8ff"
  end
  
  def install
    system "./configure"
    system "make"
    bin.install("packmol")
    (share/"packmol").install "solvate.tcl"
    (share/"packmol/examples").install resource("examples")
  end

  test do
    cp share/"packmol/examples/interface.inp", testpath
    cp share/"packmol/examples/water.xyz", testpath
    cp share/"packmol/examples/chlor.xyz", testpath
    cp share/"packmol/examples/t3.xyz", testpath
    system "packmol < interface.inp"
  end
end
