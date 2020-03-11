# Maintainer: pwfrank
pkgname=st-fpw
_pkgname=st
pkgver=0.8.2
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'dmenu' 'xclip')
makedepends=('ncurses')
url="https://github.com/pwfrank/st-build"
source=($_pkgname-$pkgver.tar.gz
st.desktop
st-scrollback-0.8.1.diff
st-scrollback-mouse-0.8.diff
st-xresources-20190105-3be4cf1.diff
st-keyboard_select-0.8.1.diff
st-alpha-0.8.2.diff
st-externalpipe-20181016-3be4cf1.diff
st-alpha-swap-0.8.2.diff
st-blinking-cursor-20180605.diff
st-boxdraw_v2-0.8.2.diff
st-misc-0.8.2.diff
config.h
)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
'1a5dbc0848b4aaec7773f87bd85ef90ed969a9889eccef2feade9a60aaea9362'
'43aa54ac4fbb26f02a62a0b699e2511289e8a757284a80eacbf782c3721f6cf8'
'3fb38940cc3bad3f9cd1e2a0796ebd0e48950a07860ecf8523a5afd0cd1b5a44'
'166f18e212e95a1cc0b2d7ef0e0d7acdf7ca9b946bd6cb8b7f685014fe187d5c'
'1db7687426a46c978d8dfabd94dff186fc178e60926feaec7348938801ea49a5'
'd8edf8ad876e10dc0258978248fffc0aeba0adff9c1c9bac7b0f946453beea5d'
'9c49b29901d19d92251e3d6d2e9075cfc9a98bc50c10c2344ec63ef0c917e61a'
'de2be99fa0e45b72d7a8e362d75b2bda6ad0a72f1634fa192c25bfe36c85076a' 
'b134dd8d3531c7c152ed0bff2dd269b685a666f1909d34cc928405d6cbe67757'
'c2ecdc30589893878aff8818c6b69bdcb1beb768ce167ad845735f7656fb6f44'
'SKIP'
'SKIP'
)

provides=('st')
conflicts=('st')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -i $srcdir/st-scrollback-0.8.1.diff
  patch -i $srcdir/st-scrollback-mouse-0.8.diff
  patch -i $srcdir/st-xresources-20190105-3be4cf1.diff
  patch -i $srcdir/st-keyboard_select-0.8.1.diff
  patch -i $srcdir/st-alpha-0.8.2.diff
  patch -i $srcdir/st-externalpipe-20181016-3be4cf1.diff
  patch -i $srcdir/st-alpha-swap-0.8.2.diff
  patch -i $srcdir/st-blinking-cursor-20180605.diff
  patch -i $srcdir/st-boxdraw_v2-0.8.2.diff
  patch -i $srcdir/st-misc-0.8.2.diff
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