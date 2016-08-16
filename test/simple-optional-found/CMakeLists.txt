cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

test_create_versions(MyPackage
	1
)

project(test/simple-optional-notfound
	LANGUAGES NONE
)

find_package(MyPackage)

test_verify_vars(
	MyPackage_FOUND              TRUE
	MyPackage_NOT_FOUND_MESSAGE  UNDEFINED
	MyPackage_ROOT               DEFINED
	MyPackage_ROOT_DIR           "${MyPackage_ROOT}/MyPackage/1"
	MyPackage_VERSIONS_DIRECTORY "${MyPackage_ROOT}/MyPackage"
	MyPackage_VERSIONS           "1"
	MyPackage_VERSION            "1"
	MyPackage_VERSION_STRING     "${MyPackage_VERSION}"
	MyPackage_VERSION_MAJOR      "1"
	MyPackage_VERSION_MINOR      UNDEFINED
	MyPackage_VERSION_PATCH      UNDEFINED
	MyPackage_VERSION_TWEAK      UNDEFINED

	MyPackage-1_LOADED TRUE
)
