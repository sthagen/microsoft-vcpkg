# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_buildpath_length_warning(37)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/system
    REF boost-${VERSION}
    SHA512 1ccd3c57eb90abec71df1e094c8971c937c4025e6cdf92f13dbe1947792d6b81fbb538e9b6404b788f3b59d50f5b472ac9e8ed08f2e738098a519a849a3d9957
    HEAD_REF master
    PATCHES
        compat.diff
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
