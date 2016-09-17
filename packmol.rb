class Packmol < Formula
  desc "Packing optimization for molecular dynamics simulations"
  homepage "http://www.ime.unicamp.br/~martinez/packmol/"
  url "http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-16.228.tar.gz"
  sha256 "ffdb8f3e772926402719dfc0186a36f3753af0917a0c4c12a117b8acbb244cb4"

  env :std

  depends_on :fortran

  resource "examples" do
    url "http://www.ime.unicamp.br/~martinez/packmol/examples/examples.tar.gz"
    sha256 "97ae64bf5833827320a8ab4ac39ce56138889f320c7782a64cd00cdfea1cf422"
  end

  def install
    system "./configure", "gfortran"
    inreplace "Makefile", "usegencan.o : usegencan.f90", "usegencan.o : usegencan.f90 sizes.o"
    system "make"
    bin.install("packmol")
    pkgshare.install "solvate.tcl"
    (pkgshare/"examples").install resource("examples")
  end

  test do
    cp pkgshare/"examples/interface.inp", testpath
    cp pksghare/"examples/water.xyz", testpath
    cp pkgshare/"examples/chlor.xyz", testpath
    cp pkgshare/"examples/t3.xyz", testpath
    system bin/"packmol < interface.inp"
  end
end
