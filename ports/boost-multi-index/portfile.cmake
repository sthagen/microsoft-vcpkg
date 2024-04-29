# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/multi_index
    REF boost-${VERSION}
    SHA512 692af6313a7da320896a4f4fb8e26f11c095d3c730f94d9cccfcf7a4fccd9c9e9dd0113c61ccd82b1a8f4aa047202c8b2d7275933d4acba2f4a1926c7717a9db
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
