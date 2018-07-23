class Xcrysden < Formula
  desc "Crystalline and molecular structure visualisation program"
  homepage "http://www.xcrysden.org/"
  url "http://www.xcrysden.org/download/xcrysden-1.5.60.tar.gz"
  sha256 "a695729f1bb3e486b86a74106c06a392c8aca048dc6b0f20785c3c311cfb2ef4"

  depends_on "gcc"
  depends_on "tcl-tk"
  depends_on "fftw" => "with-fortran"
  depends_on "wget" => :build
  depends_on :x11

  # Fix togl -accum false in Tcl and modify Make.sys
  patch do
    url "https://gist.githubusercontent.com/agiliopadua/1f9fd5e8a598018f03b6/raw/9e63c78c0767e9f542f7833bbfb1be339c963035/xcrysden-macosx.patch"
    sha256 "3a93bf9189c2f6e613308725c8fd299f12b35cf44a272b27bc337e8a3d8696f3"
  end

  def install
    cp "system/Make.macosx-x11", "Make.sys"

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

  test do
    system bin/"xcrysden", "--version"
  end
end
