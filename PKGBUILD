# Maintainer: pwfrank
pkgname=st-fpw
_pkgname=st
pkgver=0.8.4
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'dmenu' 'xclip')
makedepends=('ncurses')
url="https://github.com/pwfrank/st-build"
source=($_pkgname-$pkgver.tar.gz
st.desktop
st-scrollback-20200419-72e3f6c.diff
st-xresources-20200604-9ba7ecf.diff
st-keyboard_select-20200617-9ba7ecf.diff
st-alpha-0.8.2.diff
st-externalpipe-20181016-3be4cf1.diff
st-alpha-swap-0.8.4.diff
st-blinking_cursor-20200531-a2a7044.diff
st-boxdraw_v2-0.8.3.diff
st-clipboard-0.8.3.diff
st-misc-0.8.2.diff
config.h
)
sha256sums=('d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            '1a5dbc0848b4aaec7773f87bd85ef90ed969a9889eccef2feade9a60aaea9362'
            '1e41fe17a5ef5a8194eea07422b49d815e2c2bb4d58d84771f793be423005310'
            '5045a621db6a73c7d70bbdedd9feae6cd5103c495b0271fd0eb41f864b2f1c6e'
            '95b1331eb66a7a64b506980af0c1d3d6fdf90e19698f515c530e5ce277241acb'
            'd8edf8ad876e10dc0258978248fffc0aeba0adff9c1c9bac7b0f946453beea5d'
            '9c49b29901d19d92251e3d6d2e9075cfc9a98bc50c10c2344ec63ef0c917e61a'
            '108bfe612036a12eed7128452bc17fff91d468e2416a9920ae6434649199bf62'
            'e7e7549f1526b312b00b264b52f8f46d6bfa889a72f6c37c9029b522b295066b'
            '2bca0a20b6a3198eea36bb2c408e504aabf8306ac613110f307e3cff138628f3'
            '0f5ce33953abce74a9da3088ea35bf067a9a4cfeb9fe6ea9800268ce69e436c0'
            '681c807f0d4a275e2370eaddc0846b416c70b3bd10f2aad629c905ea285ab412'
            'SKIP')

provides=('st')
conflicts=('st')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -i $srcdir/st-scrollback-20200419-72e3f6c.diff
  patch -i $srcdir/st-xresources-20200604-9ba7ecf.diff
  patch -i $srcdir/st-keyboard_select-20200617-9ba7ecf.diff
  patch -i $srcdir/st-alpha-0.8.2.diff
  #patch -i $srcdir/st-externalpipe-20181016-3be4cf1.diff
  patch -i $srcdir/st-alpha-swap-0.8.4.diff
  patch -i $srcdir/st-blinking_cursor-20200531-a2a7044.diff
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
