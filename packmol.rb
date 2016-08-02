require "formula"

class Packmol < Formula
  desc "Packing optimization for molecular dynamics simulations"
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-16.161.tar.gz"
  sha256 "121919adc99f6b5f12f478df75db9893a279405c6b2ee36a3a45e435f97c73f7"
  
  env :std

  depends_on :fortran

  resource "examples" do
    url "http://www.ime.unicamp.br/~martinez/packmol/examples/examples.tar.gz"
    sha256 "97ae64bf5833827320a8ab4ac39ce56138889f320c7782a64cd00cdfea1cf422"
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
    system bin/"packmol < interface.inp"
  end
end
