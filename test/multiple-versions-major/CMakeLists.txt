cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(${TEST_NAME}
	LANGUAGES NONE
)

test_create_versions(MyPackage
	0
	1
	2
	3
)

find_package(MyPackage REQUIRED)

test_verify_vars(
	MyPackage_FOUND              TRUE
	MyPackage_NOT_FOUND_MESSAGE  UNDEFINED
	MyPackage_ROOT               DEFINED
	MyPackage_ROOT_DIR           "${MyPackage_ROOT}/MyPackage/3"
	MyPackage_VERSIONS_DIRECTORY "${MyPackage_ROOT}/MyPackage"
	MyPackage_VERSIONS           "${MyPackage_VERSIONS_CREATED}"
	MyPackage_VERSION            "3"
	MyPackage_VERSION_STRING     "${MyPackage_VERSION}"
	MyPackage_VERSION_MAJOR      "3"
	MyPackage_VERSION_MINOR      UNDEFINED
	MyPackage_VERSION_PATCH      UNDEFINED
	MyPackage_VERSION_TWEAK      UNDEFINED

	MyPackage-3_LOADED TRUE
)
