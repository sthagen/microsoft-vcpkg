vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libjxl/libjxl
    REF "v${VERSION}"
    SHA512 1d19f30c0ae94e212326a15dc128612bce207e619c55c2a020401a27d01a933de71bb35e907521dc8fd853dd5578d74d74f7a5a282f0083fd22cf9cb07ccb96e
    HEAD_REF main
    PATCHES
        fix-dependencies.patch
        fix-tools-build.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        tools JPEGXL_ENABLE_TOOLS
    INVERTED_FEATURES
        tools CMAKE_DISABLE_FIND_PACKAGE_GIF
        tools CMAKE_DISABLE_FIND_PACKAGE_JPEG
        tools CMAKE_DISABLE_FIND_PACKAGE_PNG
        tools CMAKE_DISABLE_FIND_PACKAGE_ZLIB
)

if(VCPKG_TARGET_IS_UWP)
    string(APPEND VCPKG_C_FLAGS " /wd4146")
    string(APPEND VCPKG_CXX_FLAGS " /wd4146")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DJPEGXL_VERSION=${JPEGXL_VERSION}"
        -DJPEGXL_FORCE_SYSTEM_BROTLI=ON
        -DJPEGXL_FORCE_SYSTEM_HWY=ON
        -DJPEGXL_FORCE_SYSTEM_LCMS2=ON
        ${FEATURE_OPTIONS}
        -DJPEGXL_ENABLE_BENCHMARK=OFF
        -DJPEGXL_ENABLE_DOXYGEN=OFF
        -DJPEGXL_ENABLE_EXAMPLES=OFF
        -DJPEGXL_ENABLE_FUZZERS=OFF
        -DJPEGXL_ENABLE_JNI=OFF
        -DJPEGXL_ENABLE_MANPAGES=OFF
        -DJPEGXL_ENABLE_OPENEXR=OFF
        -DJPEGXL_ENABLE_PLUGINS=OFF
        -DJPEGXL_ENABLE_SJPEG=OFF
        -DJPEGXL_ENABLE_SKCMS=OFF
        -DJPEGXL_ENABLE_TCMALLOC=OFF
        -DBUILD_TESTING=OFF
        -DCMAKE_FIND_PACKAGE_TARGETS_GLOBAL=ON
    MAYBE_UNUSED_VARIABLES
        CMAKE_DISABLE_FIND_PACKAGE_GIF
        CMAKE_DISABLE_FIND_PACKAGE_JPEG
        CMAKE_DISABLE_FIND_PACKAGE_PNG
        CMAKE_DISABLE_FIND_PACKAGE_ZLIB
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

if(JPEGXL_ENABLE_TOOLS)
    vcpkg_copy_tools(TOOL_NAMES cjxl djxl cjpeg_hdr jxlinfo AUTO_CLEAN)
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
