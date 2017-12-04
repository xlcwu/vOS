# cdx-build
Integration setup scripts for the Angstrom and Buildroot br2-external feature.

CDX Build Environment
=====================

Build system based on buildroot for build vOS and cdxvirt platform.
The vOS is a minimal operating system for cloud, mainly for run
containers and virtual machines. It is stand for Virtualized OS.

Example
-------

This following is example of building and installing a linux system from
scratch for the default qemu config.

* git clone https://github.com/xlcwu/cdx-build.git
* cd cdx-build
* . envsetup
* cdx_setup
* cdx-build qemu_x86_64_defconfig && cdx-build

* cdx-build printvars
* cdx-build list-defconfigs

Motivation
----------

This build template is designed to be used for production
build systems (used to build product software), and thus
has the following goals:

1. simplicity: uses well understood things like bash and
   git submodules.
1. robustness: Git submodules are
   a robust solution for production environments, and
   error handling good.  Git submodules are also very good at making
   sure you are building exactly what was checked in, because it locks every
   submodule down to a specific version, which is generally what you want for a production
   build system, where the build must be absolutely repeatable.
1. generate a modern Linux root filesystem.
