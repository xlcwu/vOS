#!/bin/bash
__PWD=`pwd`

if [ -e ./customrc ]; then
    source ./customrc
fi

BR2_EXTERNAL=${__PWD}/cdxvirt
BR2_DL_DIR=${__PWD}/dl

export BR2_EXTERNAL
export BR2_DL_DIR

###APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh

###############################################################################
# CDX_BASE - The root directory for all CDX sources and development.
###############################################################################
CDX_BASE=$(/bin/readlink -f $(dirname '${0}'))

export CDX_BASE

###############################################################################
# CDX-PATCH() - Patch buildroot directory
###############################################################################
function cdx-patch () {
    for patch in ${CDX_BASE}/cdxvirt/patches/*/*.patch; do \
        patch -p1 -d ${CDX_BASE}/buildroot < ${patch}; \
    done
}

###############################################################################
# UPDATE_ALL() - Make sure everything is up to date
###############################################################################
function cdx_update_all () {
    git submodule update
}

function cdx_force_update_all () {
    git submodule foreach --recursive git clean -xfd
    git submodule foreach --recursive git reset --hard
    git submodule update --init --recursive
}

function cdx_update_all_submodules_to_master () {
    git submodule foreach "git checkout master && git pull"
}

###############################################################################
# SETUP() - Setup git tree for build
###############################################################################
function cdx_setup () {
    git submodule init
    git submodule update
    git submodule foreach 'git status'
}

###############################################################################
# CDX-BUILD() - Build an BR2 package or image
###############################################################################
function cdx-build () {
    make --directory=${__PWD}/buildroot O=${__PWD}/output $@
}

if [ ! -e buildroot/Makefile ]; then
        echo "Please make sure you've checked out the buildroot submodule"
        echo "  cdx_setup or git submodule init && git submodule update"
        return -1
fi
