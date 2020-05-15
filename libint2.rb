class Libint2 < Formula
  desc "Evaluation of molecular integrals over Gaussian functions"
  homepage "https://github.com/evaleev/libint"
  url "https://github.com/evaleev/libint/archive/v2.6.0.tar.gz"
  sha256 "4ae47e8f0b5632c3d2a956469a7920896708e9f0e396ec10071b8181e4c8d9fa"

  depends_on "automake" => :build
  depends_on "autoconf" => :build

  option "with-max-am5",
         "Max angular momentum L=5 (h functions), default L=4 (g functions)"
  
  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    args = %W[
         --prefix=#{prefix} --enable-eri=1
    ]
    
    args << "--with-max-am=5" if build.with? "max-am5"

    system "./autogen.sh"
    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
