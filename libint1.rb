class Libint1 < Formula
  desc "Evaluation of molecular integrals over Gaussian functions"
  homepage "https://github.com/evaleev/libint/"
  url "https://github.com/evaleev/libint/archive/v1.zip"
  version "1.2.1"
  sha256 "807cc66c9cc1eb7a8266e807641abbb6c10cd5fee35f2bd3914d7b10cea97489"

  depends_on "automake" => :build
  depends_on "autoconf" => :build

  option "with-max-am54",
         "Max angular momentum 5(h) for energies and 4(g) for derivatives (defaults g and f)"
  
  def install
    args = %W[
         --prefix=#{prefix}
    ]
    
    args << "--with-libint-max-am=5" << "--with-libderiv-max-am1=4" if build.with? "max-am54"

    # system "aclocal", "-I", "lib/libtool"
    system "aclocal"
    system "autoconf"
    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
