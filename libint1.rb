require "formula"

class Libint1 < Formula
  desc "Evaluation of molecular integrals over Gaussian functions"
  homepage "http://github.com/evaleev/libint/"
  url "https://github.com/evaleev/libint/archive/v1.zip"
  version "1.1.6"
  sha1 "10696b933ee122904752481d64ba38e2cdf18c36"
  
  env :std

  def install
    system "aclocal -I lib/libtool"
    system "autoconf"
    system "mkdir obj"
    system "cd obj" 
    system "./configure", "--prefix=#{prefix}",
           "--with-libint-max-am=5", "--with-libderiv-max-am1=4"
    system "make"
    system "make", "install"
  end
end
