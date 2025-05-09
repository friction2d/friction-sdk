# VFX Reference Platform for Friction
FROM centos:centos7.9.2009

RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
RUN sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
RUN sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

RUN yum -y update
RUN yum -y install centos-release-scl

RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
RUN sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
RUN sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

RUN yum -y group install "Development Tools"
RUN yum -y install pulseaudio-libs-devel wget rpmdevtools git yasm python3 fontconfig-devel zlib-devel autoconf automake xz devtoolset-7 llvm-toolset-7.0 tree curl libICE-devel libSM-devel libX11-devel libXau-devel libXdamage-devel libXext-devel libXfixes-devel libXi-devel libXxf86vm-devel libdrm-devel libxcb-devel mesa-libGL-devel xorg-x11-proto-devel xcb-proto libxcb-devel xcb-util-devel xcb-util-image-devel xcb-util-keysyms-devel xcb-util-renderutil-devel xcb-util-wm-devel xorg-x11-util-macros mesa-libEGL-devel mesa-libGLES-devel wayland-devel
RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN rm -f /usr/lib64/pkgconfig/libpng.pc
RUN rm -f /usr/lib64/pkgconfig/libpng15.pc
RUN rm -f /usr/lib64/pkgconfig/*xcb*.pc
RUN rm -f /usr/include/png.h
RUN rm -f /usr/include/pngconf.h
RUN rm -f /usr/include/pnglibconf.h
RUN sed -i '/.private/d' /usr/lib64/pkgconfig/freetype2.pc
RUN echo "source scl_source enable devtoolset-7" >> /root/.bashrc

RUN echo "#!/bin/sh" > /usr/bin/desktop-file-validate
RUN echo "exit 0" >> /usr/bin/desktop-file-validate
RUN chmod +x /usr/bin/desktop-file-validate

COPY setup_vfxplatform.sh /root/
CMD [ "bash", "./root/setup_vfxplatform.sh" ]
