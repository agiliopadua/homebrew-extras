class Libint1 < Formula
  desc "Evaluation of molecular integrals over Gaussian functions"
  homepage "https://github.com/evaleev/libint/"
  url "https://github.com/evaleev/libint/archive/v1.zip"
  version "1.1.6"
  sha256 "0368c7f0769ef8ccf2566c042d8ea0f50d272641491d1c5663160c21bb27e762"

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
