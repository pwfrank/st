# Maintainer: pwfrank
pkgname=st
pkgver=0.8.2
pkgrel=5
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="https://github.com/pwfrank/st-build"
source=(https://dl.suckless.org/st/$pkgname-$pkgver.tar.gz
st.desktop
st-scrollback-0.8.1.diff
st-scrollback-mouse-0.8.diff
st-xresources-20190105-3be4cf1.diff
st-keyboard_select-0.8.1.diff
st-clipboard-0.8.2.diff
st-tab-resize.diff
st-alpha-0.8.2.diff
st-externalpipe-20181016-3be4cf1.diff
config.h
)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
'1a5dbc0848b4aaec7773f87bd85ef90ed969a9889eccef2feade9a60aaea9362'
'43aa54ac4fbb26f02a62a0b699e2511289e8a757284a80eacbf782c3721f6cf8'
'3fb38940cc3bad3f9cd1e2a0796ebd0e48950a07860ecf8523a5afd0cd1b5a44'
'166f18e212e95a1cc0b2d7ef0e0d7acdf7ca9b946bd6cb8b7f685014fe187d5c'
'1db7687426a46c978d8dfabd94dff186fc178e60926feaec7348938801ea49a5'
'7be1a09831f13361f5659aaad55110bde99b25c8ba826c11d1d7fcec21f32945'
'814a7926ccbd40da4b3b6bba797aacc7d3d3d078031fcaadd52cd1d533d2e4fd'
'd8edf8ad876e10dc0258978248fffc0aeba0adff9c1c9bac7b0f946453beea5d'
'9c49b29901d19d92251e3d6d2e9075cfc9a98bc50c10c2344ec63ef0c917e61a'
'SKIP'
)

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -i $srcdir/st-scrollback-0.8.1.diff
  patch -i $srcdir/st-scrollback-mouse-0.8.diff
  patch -i $srcdir/st-xresources-20190105-3be4cf1.diff
  patch -i $srcdir/st-keyboard_select-0.8.1.diff
  patch -i $srcdir/st-clipboard-0.8.2.diff
  #patch -i $srcdir/st-tab-resize.diff
  patch -i $srcdir/st-alpha-0.8.2.diff
  patch -i $srcdir/st-externalpipe-20181016-3be4cf1.diff
  cp $srcdir/config.h $srcdir/$pkgname-$pkgver/config.h
  cp $srcdir/$pkgname.desktop $srcdir/$pkgname-$pkgver/$pkgname.desktop
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  # remove to avoid conflict with ncurses
  #rm "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color"
}
