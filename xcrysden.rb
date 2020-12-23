class Xcrysden < Formula
  desc "Crystalline and molecular structure visualisation program"
  homepage "http://www.xcrysden.org/"
  url "http://www.xcrysden.org/download/xcrysden-1.5.60.tar.gz"
  sha256 "a695729f1bb3e486b86a74106c06a392c8aca048dc6b0f20785c3c311cfb2ef4"

  depends_on "gcc"
  depends_on "agiliopadua/extras/tcl-tk-x11"
  depends_on "fftw"
  depends_on "wget" => :build
  depends_on "libx11"

  # Fix togl -accum false in Tcl and modify Make.sys
  patch do
    url "https://gist.githubusercontent.com/agiliopadua/1f9fd5e8a598018f03b6/raw/178a0d79ea71d8d59d5c2a02180752cc7292cb5c/xcrysden-homebrew.patch"
    sha256 "0609b2cf58c5523f644c9b1191e5da1bd2bba3bf73c4dad7dd78df6308112cb9"
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
    <<~EOS
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
