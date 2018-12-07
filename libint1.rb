class Libint1 < Formula
  desc "Evaluation of molecular integrals over Gaussian functions"
  homepage "https://sourceforge.net/projects/libint/"
  url "http://sourceforge.net/projects/libint/files/v1-releases/libint-1.1.5.tar.gz"
  version "1.1.5"
  sha256 "31d7dd553c7b1a773863fcddc15ba9358bdcc58f5962c9fcee1cd24f309c4198"

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
