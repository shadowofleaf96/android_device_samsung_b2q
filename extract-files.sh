#!/bin/bash
#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/hw/com.qti.chi.override.so)
            xxd -p "${2}" | tr -d \\n > "${2}".hex
            # NOP CONNECT_RILD
            sed -i "s/800640f9e17800948001003482dbfff0c3ddff90a5dcffb0e603002a/1f2003d51f2003d51f2003d51f2003d51f2003d51f2003d51f2003d5/g" "${2}".hex
            sed -i "s/4238089163f00891a5241391a4118052e0031f2a210080528dfeff97800640f9/1f2003d51f2003d51f2003d51f2003d51f2003d51f2003d51f2003d5800640f9/g" "${2}".hex
            xxd -r -p "${2}".hex > "${2}"
            rm "${2}".hex
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=b2q
export DEVICE_COMMON=sm8350-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
