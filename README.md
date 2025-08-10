# pve9docker
pve9docker base from detain 13 trixie

参考项目 https://github.com/Chocrates/qemu-build 而来

Reference project: https://github.com/Chocrates/qemu-build

在debain13 docker基础上安装pve9的源，用于编译pve9上的各种软件使用，比如项目https://github.com/lixiaoliu666/pve-anti-detection 就在使用这个docker进行编译pve-qemu deb

This Docker image is based on Debian 13 with Proxmox VE 9 repositories configured, designed for compiling various software packages on Proxmox VE 9. For instance, the project https://github.com/lixiaoliu666/pve-anti-detection uses this Docker environment to compile PVE-QEMU Debian packages.

https://github.com/lixiaoliu666/pve7docker 也可以使用这个用于pve7上编译使用

https://github.com/lixiaoliu666/pve8docker 也可以使用这个用于pve8上编译使用

如何使用：

Usage:

docker pull ghcr.io/lixiaoliu666/pve9docker:main
