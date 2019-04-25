# Maintainer: pwfrank
pkgname=st
pkgver=0.8.2
pkgrel=2
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="https://github.com/pwfrank/st"
source=(https://dl.suckless.org/st/$pkgname-$pkgver.tar.gz
st.desktop
st-scrollback-0.8.1.diff
st-scrollback-mouse-0.8.diff
st-xresources-20190105-3be4cf1.diff
config.h
)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
'1a5dbc0848b4aaec7773f87bd85ef90ed969a9889eccef2feade9a60aaea9362'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)


prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -i $srcdir/st-scrollback-0.8.1.diff
  patch -i $srcdir/st-scrollback-mouse-0.8.diff
  patch -i $srcdir/st-xresources-20190105-3be4cf1.diff
  cp $srcdir/config.h $srcdir/$pkgname-$pkgver/config.h
  cp $srcdir/st.desktop $srcdir/$pkgname-$pkgver/st.desktop
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 st.desktop "$pkgdir/usr/share/applications/st.desktop"
  # remove to avoid conflict with ncurses
  rm "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color"
}
