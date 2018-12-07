class Libxc4 < Formula
  desc "Library of exchange and correlation functionals for codes"
  homepage "http://octopus-code.org/wiki/Libxc"
  url "https://gitlab.com/libxc/libxc/-/archive/4.2.3/libxc-4.2.3.tar.gz"
  sha256 "869ca4967cd255097fd2dc31664f30607e81f5abcf5f9c89bd467dc0bf93e5aa"

  depends_on "gcc" # for gfortran
  depends_on "autoconf" => :build

  conflicts_with "libxc"

  # std env otherwise autoreconf does not work
  env: std
  
  def install
    system "autoreconf -i"
    system "./configure", "--prefix=#{prefix}",
                          "--enable-shared",
                          "FCCPP=gfortran -E -x c",
                          "CC=#{ENV.cc}"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <stdio.h>
      #include <xc.h>
      int main()
      {
        int major, minor, micro;
        xc_version(&major, &minor, &micro);
        printf(\"%d.%d.%d\", major, minor, micro);
      }
    EOS
    system ENV.cc, "test.c", "-L#{lib}", "-lxc", "-I#{include}", "-o", "ctest"
    system "./ctest"

    (testpath/"test.f90").write <<~EOS
      program lxctest
        use xc_f90_types_m
        use xc_f90_lib_m
      end program lxctest
    EOS
    system "gfortran", "test.f90", "-L#{lib}", "-lxc", "-I#{include}",
                       "-o", "ftest"
    system "./ftest"
  end
end
