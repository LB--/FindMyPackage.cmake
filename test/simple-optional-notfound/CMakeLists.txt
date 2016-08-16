cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(test/simple-optional-notfound
	LANGUAGES NONE
)

find_package(MyPackage)

test_verify_vars(
	MyPackage_FOUND              UNDEFINED
	MyPackage_NOT_FOUND_MESSAGE  DEFINED
	MyPackage_ROOT               "MyPackage_ROOT-NOTFOUND"
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
