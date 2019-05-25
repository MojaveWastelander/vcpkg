include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wjwwood/serial
    REF master
    SHA512 9536d5f83bedf2c055a6071e595b378e0ab8e190ea943694ae3cd86e75963d82981568f2edc91b39be59a2f9d83824405a85cb980521df771d9ec6126c0ba415
    HEAD_REF master
)


file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

file(COPY ${SOURCE_PATH}/README.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/serial)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/serial/README.md ${CURRENT_PACKAGES_DIR}/share/serial/copyright)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
