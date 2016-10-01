class Molden < Formula
  desc "Package for displaying Molecular Density (HOMEBREW_MAKE_JOBS=1)"
  homepage "http://www.cmbi.ru.nl/molden/"
  url "ftp://ftp.cmbi.ru.nl/pub/molgraph/molden/molden5.7.tar.gz"
  sha256 "4c7a6b550fefb3d71a7072c4a3a3e4793a927b62c2713180589b9481df546694"

  depends_on :x11
  depends_on :fortran

  def install
    inreplace "makefile", "X11R6", "X11"
    system "make"
    bin.install "molden", "gmolden", "ambfor/ambfor", "ambfor/ambmd", "surf/surf"
  end

  test do
    system bin/"molden", "-h"
  end
end
