# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/any
    REF boost-${VERSION}
    SHA512 811367a86c15d01e13dcad32efa205bd2a7a4cab309990bd1f817ae26a49cc2c2a56b01f02224225f9673d852f5e5abee36546e0328ae5bf6065198f23e7d530
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
