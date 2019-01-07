class LcovAT113 < Formula
  desc "Graphical front-end for GCC's coverage testing tool (gcov)"
  homepage "https://github.com/linux-test-project/lcov"
  url "https://downloads.sourceforge.net/ltp/lcov-1.13.tar.gz"
  sha256 "44972c878482cc06a05fe78eaa3645cbfcbad6634615c3309858b207965d8a23"
  head "https://github.com/linux-test-project/lcov.git"

  def install
    inreplace %w[bin/genhtml bin/geninfo bin/lcov],
      "/etc/lcovrc", "#{prefix}/etc/lcovrc"
    system "make", "PREFIX=#{prefix}", "BIN_DIR=#{bin}", "MAN_DIR=#{man}", "install"
  end

  test do
    system "#{bin}/lcov", "--version"
  end
end
