cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(${TEST_NAME}
	LANGUAGES NONE
)

test_create_versions(MyPackage
	1.2.3.0
	1.2.3.1
	1.2.4.0
	1.2.4.1
)

find_package(MyPackage REQUIRED)

test_verify_vars(
	MyPackage_FOUND              TRUE
	MyPackage_NOT_FOUND_MESSAGE  UNDEFINED
	MyPackage_ROOT               DEFINED
	MyPackage_ROOT_DIR           "${MyPackage_ROOT}/MyPackage/1.2.4.1"
	MyPackage_VERSIONS_DIRECTORY "${MyPackage_ROOT}/MyPackage"
	MyPackage_VERSIONS           "${MyPackage_VERSIONS_CREATED}"
	MyPackage_VERSION            "1.2.4.1"
	MyPackage_VERSION_STRING     "${MyPackage_VERSION}"
	MyPackage_VERSION_MAJOR      "1"
	MyPackage_VERSION_MINOR      "2"
	MyPackage_VERSION_PATCH      "4"
	MyPackage_VERSION_TWEAK      "1"

	MyPackage-1.2.3.0_LOADED UNDEFINED
	MyPackage-1.2.3.1_LOADED UNDEFINED
	MyPackage-1.2.4.0_LOADED UNDEFINED
	MyPackage-1.2.4.1_LOADED TRUE
)
