pkgname=vim
pkgver=9.1.1706
pkgrel=1
pkgdesc="Vi Improved, a highly configurable, improved version of the vi text editor"
arch=('x86_64')
url="https://www.vim.org/"
license=('vim')
depends=(
    'acl'
    'attr'
    'glibc'
    'ncurses'
)
makedepends=(
    'perl'
    'python'
)
backup=(etc/vimrc)
source=(https://github.com/vim/vim/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
    vimrc)
sha256sums=(bc1bf6f99f787600936b443cb2375fba7cf97601a2475747177d2a810611fcd2
    fef39a056d06c52e558d70269b7cf3d557cf20126e6dfc069f26353f5064c020)

prepare() {
    cd ${pkgname}-${pkgver}

    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
}

build() {
    cd ${pkgname}-${pkgver}

    local configure_args=(
        --with-compiledby='Flarebird Linux'
        ${configure_options}
    )

    ./configure "${configure_args[@]}"

    make
}

package() {
	cd ${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install

    ln -sv vim ${pkgdir}/usr/bin/vi
    for L in  ${pkgdir}/usr/share/man/{,*/}man1/vim.1; do
        ln -sv vim.1 $(dirname $L)/vi.1
    done

    install -vdm755 ${pkgdir}/usr/share/doc
    ln -sv ../vim/vim91/doc ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}

	install -vDm644 ${srcdir}/vimrc ${pkgdir}/etc/vimrc

    sed -i "s/mouse=a/mouse-=a/g" ${pkgdir}/usr/share/vim/vim91/defaults.vim
}
