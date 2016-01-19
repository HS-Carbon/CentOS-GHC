yum install tar bzip2 wget which -y
cd /tmp
wget -nv https://downloads.haskell.org/~ghc/7.8.3/ghc-7.8.3-$(uname -m)-unknown-linux-centos65.tar.bz2
yum install gcc perl -y
tar -xf ghc-7.8.3-$(uname -m)-unknown-linux-centos65.tar.bz2
cd ghc-7.8.3
./configure && make install

cd /tmp
wget -nv https://www.haskell.org/cabal/release/cabal-install-1.20.0.6/cabal-install-1.20.0.6.tar.gz
tar -xf cabal-install-1.20.0.6.tar.gz
cd cabal-install-1.20.0.6
yum install gmp-static zlib-devel -y
./bootstrap.sh
export PATH=~/.cabal/bin:$PATH
cabal update
if ! grep "split-objs: True" ~/.cabal/config; then echo "split-objs: True" >> ~/.cabal/config; fi
cabal install alex happy

rm -rf /tmp/*