# Maintainer: pwfrank
pkgname=st-fpw
_pkgname=st
pkgver=0.8.5
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'dmenu' 'xclip')
makedepends=('ncurses')
url="https://github.com/pwfrank/st-build"
source=($_pkgname-$pkgver.tar.gz
st.desktop
st-fpw-0.8.5.diff
config.h
)
sha256sums=('ea6832203ed02ff74182bcb8adaa9ec454c8f989e79232cb859665e2f544ab37'
            '1a5dbc0848b4aaec7773f87bd85ef90ed969a9889eccef2feade9a60aaea9362'
            'eb71e07c0ae2b8112c855aff4f94eba5a8c2729a9fc4245ad3d8f3d503d44ab7'
            'SKIP')

provides=('st')
conflicts=('st')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -i $srcdir/st-fpw-0.8.5.diff
  cp $srcdir/config.h $srcdir/$_pkgname-$pkgver/config.h
  cp $srcdir/$_pkgname.desktop $srcdir/$_pkgname-$pkgver/$_pkgname.desktop
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  # remove to avoid conflict with ncurses
  #rm "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color"
}
