class Libint1 < Formula
  desc "Evaluation of molecular integrals over Gaussian functions"
  homepage "https://github.com/evaleev/libint/"
  url "https://github.com/evaleev/libint/archive/v1.zip"
  version "1.1.6"
  sha256 "807cc66c9cc1eb7a8266e807641abbb6c10cd5fee35f2bd3914d7b10cea97489"

  depends_on "autoconf" => :build

  def install
    system "aclocal", "-I", "lib/libtool"
    system "autoconf"
    system "./configure", "--prefix=#{prefix}",
           "--with-libint-max-am=5", "--with-libderiv-max-am1=4"
    system "make"
    system "make", "install"
  end
end
