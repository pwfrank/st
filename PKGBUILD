# Maintainer: pwfrank
pkgname=st-fpw
_pkgname=st
pkgver=0.8.3
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'dmenu' 'xclip')
makedepends=('ncurses')
url="https://github.com/pwfrank/st-build"
source=($_pkgname-$pkgver.tar.gz
st.desktop
#st-scrollback-0.8.1.diff
st-scrollback-20200419-72e3f6c.diff
#st-scrollback-mouse-0.8.diff
#st-scrollback-mouse-20191024-a2c479c.diff
#st-xresources-20190105-3be4cf1.diff
st-xresources-20200604-9ba7ecf.diff
#st-keyboard_select-0.8.1.diff
#st-keyboard_select-0.8.2.diff
st-alpha-0.8.2.diff
st-externalpipe-20181016-3be4cf1.diff
st-alpha-swap-0.8.3.diff
st-blinking-cursor-20180605.diff
#st-blinking_cursor-20200531-a2a7044.diff
st-boxdraw_v2-0.8.3.diff
st-clipboard-0.8.3.diff
st-misc-0.8.2.diff
config.h
)
sha256sums=('939ae3da237e7c9489694853c205c7cbd5f2a2f0c17fe41a07477f1df8e28552'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

provides=('st')
conflicts=('st')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  #sed -i '/tic /d' Makefile
  #patch -i $srcdir/st-scrollback-0.8.1.diff
  patch -i $srcdir/st-scrollback-20200419-72e3f6c.diff
  #patch -i $srcdir/st-scrollback-mouse-0.8.diff
  #patch -i $srcdir/st-scrollback-mouse-20191024-a2c479c.diff
  #patch -i $srcdir/st-xresources-20190105-3be4cf1.diff
  patch -i $srcdir/st-xresources-20200604-9ba7ecf.diff
  #patch -i $srcdir/st-keyboard_select-0.8.1.diff
  #patch -i $srcdir/st-keyboard_select-0.8.2.diff
  patch -i $srcdir/st-alpha-0.8.2.diff
  #patch -i $srcdir/st-externalpipe-20181016-3be4cf1.diff
  patch -i $srcdir/st-alpha-swap-0.8.3.diff
  patch -i $srcdir/st-blinking-cursor-20180605.diff
  #patch -i $srcdir/st-blinking_cursor-20200531-a2a7044.diff
  #patch -i $srcdir/st-boxdraw_v2-0.8.2.diff
  patch -i $srcdir/st-boxdraw_v2-0.8.3.diff
  patch -i $srcdir/st-clipboard-0.8.3.diff
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