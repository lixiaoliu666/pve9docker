FROM debian:trixie-20250721

run apt-get update && \
    apt-get install -y wget git
# 增加Proxmox 的源文件
run echo "deb https://mirrors.ustc.edu.cn/proxmox/debian/pve trixie pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list
# 增加 ceph 源文件 换源
run echo "deb https://mirrors.ustc.edu.cn/proxmox/debian/ceph-squid trixie no-subscription" > /etc/apt/sources.list.d/ceph.list
run wget -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg "https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg"
run wget -O /etc/apt/trusted.gpg.d/proxmox-release-trixie.gpg "https://enterprise.proxmox.com/debian/proxmox-release-trixie.gpg"

run apt-get update && apt-get dist-upgrade -y
run apt-get install -y devscripts autotools-dev autogen dh-autoreconf dkms doxygen check pkg-config \
            groff quilt automake autoconf libtool lintian libdevel-cycle-perl \
            libjson-perl libcommon-sense-perl liblinux-inotify2-perl libio-stringy-perl \
            libstring-shellquote-perl rpm2cpio libsqlite3-dev sqlite3 \
            libglib2.0-dev librrd-dev librrds-perl rrdcached libdigest-hmac-perl \
            libxml-parser-perl gdb libcrypt-openssl-random-perl \
            libcrypt-openssl-rsa-perl libnet-ldap-perl libauthen-pam-perl \
            libjson-xs-perl libterm-readline-gnu-perl oathtool libmime-base32-perl \
            liboath0 libpci-dev texi2html libsdl1.2-dev libgnutls28-dev \
            libspice-protocol-dev xfslibs-dev libnuma-dev libaio-dev \
            libusbredirparser-dev glusterfs-common \
            libusb-1.0-0-dev librbd-dev libpopt-dev bridge-utils numactl \
            glusterfs-common ceph-common libgoogle-perftools4 \
            libfile-chdir-perl lvm2 glusterfs-client liblockfile-simple-perl \
            libsystemd-dev libio-multiplex-perl \
            libnetfilter-log-dev ipset socat libsasl2-dev libogg-dev \
            libfilesys-df-perl libcrypt-ssleay-perl \
            libfile-readbackwards-perl libanyevent-perl libanyevent-http-perl \
            unzip liblocale-po-perl libfile-sync-perl cstream \
            lzop dtach hdparm gdisk parted \
            liblzma-dev dosfstools mtools libxen-dev libfuse-dev libcpg-dev libquorum-dev \
            libcmap-dev libuuid-perl libqb-dev libapparmor-dev docbook2x libcap-dev \
            dh-apparmor graphviz libseccomp-dev libglib-perl libgtk3-perl libnss3-dev \
            libdlm-dev libudev-dev asciidoc-dblatex source-highlight libiscsi-dev \
            libiscsi7 librsvg2-bin libarchive-dev libgpgme-dev libcurl4-gnutls-dev \
            libtest-mockmodule-perl libjemalloc-dev libjpeg-dev
run apt-get install -y docutils-common fonts-font-awesome libacl1-dev libattr1-dev libcap-ng-dev \
            libcap2-bin libegl-dev libepoxy-dev libfdt-dev libfdt1 libgbm-dev \
            libglusterfs-dev libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 \
            libjs-sphinxdoc libjs-underscore liborc-0.4-0 libpixman-1-dev \
            libproxmox-backup-qemu0 libproxmox-backup-qemu0-dev libslirp-dev libslirp0 \
            libspice-server-dev libspice-server1 liburing-dev liburing2 libva-drm2 \
            libva2 libvirglrenderer-dev libvirglrenderer1 libvulkan1 libzstd-dev meson \
            ninja-build python-babel-localedata python3-alabaster python3-babel \
            python3-docutils python3-imagesize python3-jinja2 python3-markupsafe \
            python3-packaging python3-pip-whl python3-pygments python3-roman \
            python3-setuptools python3-setuptools-whl python3-snowballstemmer \
            python3-sphinx python3-sphinx-rtd-theme python3-tz python3-venv \
            python3-venv sphinx-common sphinx-rtd-theme-common
run git config --global url."https://github.com/tianocore/edk2-subhook.git".insteadOf https://github.com/Zeex/subhook.git

run apt-get install -y bridge-utils btrfs-progs chrony cifs-utils criu cstream curl ethtool faketime fuse gdisk genisoimage gnutls-bin hdparm ifupdown2 ksm-control-daemon libanyevent-http-perl libanyevent-perl libdigest-hmac-perl libfile-readbackwards-perl libjs-bootstrap5 libjs-extjs liblinux-inotify2-perl libmime-base32-perl libopeniscsiusr libposix-strptime-perl libproxmox-acme-perl libproxmox-acme-plugins libproxmox-rs-perl librados2-perl lvm2 nfs-common nmap nmap-common node-popper2 open-iscsi python3-six qrencode rsync runit-helper samba-common smbclient socat sopv-doc sopv-gpgv tcpdump thin-provisioning-tools time uidmap xsltproc

run apt-get install -y frr frr-pythontools libbytes-random-secure-perl libcephfs2 libcpg4 libfile-readbackwards-perl libfuse2t64 libpve-access-control libpve-apiclient-perl libpve-cluster-api-perl libpve-cluster-perl libpve-common-perl libpve-guest-common-perl libpve-http-server-perl libpve-network-api-perl libpve-network-perl libpve-notify-perl libpve-rs-perl libpve-storage-perl libqb-tools libradosstriper1 libreiserfscore0t64 librgw2 libtemplate-perl libuuid-perl lxc-pve lxcfs novnc-pve pve-cluster pve-container pve-docs pve-edk2-firmware pve-edk2-firmware-legacy pve-edk2-firmware-ovmf pve-esxi-import-tools pve-firewall pve-firmware pve-ha-manager pve-i18n pve-lxc-syscalld pve-manager pve-nvidia-vgpu-helper python3-ceph-argparse python3-ceph-common python3-cephfs python3-pyvmomi python3-rados python3-rbd qemu-server rrdcached smartmontools swtpm swtpm-tools zfs-initramfs zfs-zed zfsutils-linux

run apt-get install -y libbabeltrace1 libcfg7 libcmap4 libcompel1 libcpg4:amd64 libevent-core-2.1-7t64 libfile-readbackwards-perl libfuse2t64 libgoogle-perftools4t64 libipset13t64 libknet1t64 liblinear4 libnfsidmap1 libnozzle1t64 libnvpair3linux liboath0t64 libqb100 libquorum5 librdkafka1 librrd8t64 librrds-perl libstatgrab10t64 libtcmalloc-minimal4t64 libthrift-0.19.0t64 libtlsrpt0 libtpms0 libvotequorum8 libyang3 libzfs6linux libzpool6linux swtpm-libs

#run apt-get install -y dpatch dh-systemd pve-libspice-server-dev iproute python-ceph libreadline-gplv2-dev libipset3 python-pyparsing ttf-dejavu-core
