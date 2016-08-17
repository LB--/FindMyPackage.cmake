cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(${TEST_NAME}
	LANGUAGES NONE
)

test_create_versions(MyPackage
	1.2.3.4.5.6.7.8.9
	9.8.7.6.5.4.3.2.1
	9.8.7.6.5.4.3.2.2
)

find_package(MyPackage REQUIRED)

test_verify_vars(
	MyPackage_FOUND              TRUE
	MyPackage_NOT_FOUND_MESSAGE  UNDEFINED
	MyPackage_ROOT               DEFINED
	MyPackage_ROOT_DIR           "${MyPackage_ROOT}/MyPackage/9.8.7.6.5.4.3.2.2"
	MyPackage_VERSIONS_DIRECTORY "${MyPackage_ROOT}/MyPackage"
	MyPackage_VERSIONS           "${MyPackage_VERSIONS_CREATED}"
	MyPackage_VERSION            "9.8.7.6.5.4.3.2.2"
	MyPackage_VERSION_STRING     "${MyPackage_VERSION}"
	MyPackage_VERSION_MAJOR      "9"
	MyPackage_VERSION_MINOR      "8"
	MyPackage_VERSION_PATCH      "7"
	MyPackage_VERSION_TWEAK      "6"

	MyPackage-1.2.3.4.5.6.7.8.9_LOADED UNDEFINED
	MyPackage-9.8.7.6.5.4.3.2.1_LOADED UNDEFINED
	MyPackage-9.8.7.6.5.4.3.2.2_LOADED TRUE
)
