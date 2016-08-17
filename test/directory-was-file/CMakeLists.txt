cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(${TEST_NAME}
	LANGUAGES NONE
)

unset(MyPackage_NOT_FOUND_MESSAGE)
set(MyPackage_ROOT "${CMAKE_CURRENT_BINARY_DIR}/root")
file(WRITE "${MyPackage_ROOT}" "\n")

find_package(MyPackage)

test_verify_vars(
	MyPackage_FOUND              UNDEFINED
	MyPackage_NOT_FOUND_MESSAGE  DEFINED
	MyPackage_ROOT               DEFINED
	MyPackage_ROOT_DIR           UNDEFINED
	MyPackage_VERSIONS_DIRECTORY UNDEFINED
	MyPackage_VERSIONS           UNDEFINED
	MyPackage_VERSION            UNDEFINED
	MyPackage_VERSION_STRING     UNDEFINED
	MyPackage_VERSION_MAJOR      UNDEFINED
	MyPackage_VERSION_MINOR      UNDEFINED
	MyPackage_VERSION_PATCH      UNDEFINED
	MyPackage_VERSION_TWEAK      UNDEFINED
)

unset(MyPackage_NOT_FOUND_MESSAGE)
file(REMOVE "${MyPackage_ROOT}")
file(MAKE_DIRECTORY "${MyPackage_ROOT}")
file(WRITE "${MyPackage_ROOT}/MyPackage" "\n")

find_package(MyPackage)

test_verify_vars(
	MyPackage_FOUND              UNDEFINED
	MyPackage_NOT_FOUND_MESSAGE  DEFINED
	MyPackage_ROOT               DEFINED
	MyPackage_ROOT_DIR           UNDEFINED
	MyPackage_VERSIONS_DIRECTORY UNDEFINED
	MyPackage_VERSIONS           UNDEFINED
	MyPackage_VERSION            UNDEFINED
	MyPackage_VERSION_STRING     UNDEFINED
	MyPackage_VERSION_MAJOR      UNDEFINED
	MyPackage_VERSION_MINOR      UNDEFINED
	MyPackage_VERSION_PATCH      UNDEFINED
	MyPackage_VERSION_TWEAK      UNDEFINED
)
