require 'formula'

class I586ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.23.tar.gz'
  sha1 '470c388c97ac8d216de33fa397d7be9f96c3fe04'

  depends_on 'apple-gcc42' => :build

  def install
    ENV['CC'] = 'gcc-4.9'
    ENV['CXX'] = 'g++-4.9'
    ENV['CPP'] = 'cpp-4.9'
    ENV['LD'] = 'gcc-4.9'
    
    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i586-elf',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
      FileUtils.mv lib, libexec
    end
  end

end
