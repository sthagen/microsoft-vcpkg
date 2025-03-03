# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/accumulators
    REF boost-${VERSION}
    SHA512 444c0e8e9bd5979398360eb53ce43c5360252f48a6d6b3d9ed8cfcae89789d3f8598cb1e87da48fd8da27968cbf0c02fa3c27fe7838e4fefeaba3b8bab9433d5
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
