require "formula"

class Xcrysden < Formula
  homepage "http://www.xcrysden.org/"
  url "http://www.xcrysden.org/download/xcrysden-1.5.60.tar.gz"
  version "1.5.60"
  sha1 "388cf837aa757e612f36a12eb7fb592c36cfd6f3"

  depends_on :x11
  depends_on :fortran
  depends_on "homebrew/dupes/tcl-tk" => "with-x11"
  depends_on "fftw" => "with-fortran"
  depends_on "wget" => :build
  
  # Fix togl -accum false in Tcl and modify Make.sys
  patch do
    url "https://gist.githubusercontent.com/agiliopadua/1f9fd5e8a598018f03b6/raw/9e63c78c0767e9f542f7833bbfb1be339c963035/xcrysden-macosx.patch"
    sha1 "d1298dcdc43eb54d2783ce99f3ae639e2a840d78"
  end

  def install
    system "cp", "system/Make.macosx-x11", "Make.sys"

    ENV.deparallelize
    system "make", "xcrysden"

    args = %W[
      prefix=#{prefix}
    ]
    
    system "make", *args, "install"
  end

  def caveats
    <<-EOS.undent
      XCrySDen can be user-customized. Create $HOME/.xcrysden/ directory
      and copy the "custom-definitions" and "Xcrysden_resources" files
      from the Tcl/ subdirectory of the XCrySDen root directory.
      These can be then modified according to user preference.

      For more info about customization, see: http://www.xcrysden.org/doc/custom.html
    EOS
  end
end
