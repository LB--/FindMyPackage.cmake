cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(${TEST_NAME}
	LANGUAGES NONE
)

foreach(_bad a -1 0.-1 0.a.0 0.0.0-beta1)
	test_create_versions(MyPackage
		${_bad}
	)

	find_package(MyPackage)

	test_verify_vars(
		MyPackage_FOUND              UNDEFINED
		MyPackage_NOT_FOUND_MESSAGE  DEFINED
		MyPackage_ROOT               DEFINED
		MyPackage_ROOT_DIR           UNDEFINED
		MyPackage_VERSIONS_DIRECTORY "${MyPackage_ROOT}/MyPackage"
		MyPackage_VERSIONS           "${MyPackage_VERSIONS_CREATED}"
		MyPackage_VERSION            UNDEFINED
		MyPackage_VERSION_STRING     UNDEFINED
		MyPackage_VERSION_MAJOR      UNDEFINED
		MyPackage_VERSION_MINOR      UNDEFINED
		MyPackage_VERSION_PATCH      UNDEFINED
		MyPackage_VERSION_TWEAK      UNDEFINED

		MyPackage-${_bad}_LOADED UNDEFINED
	)

	file(REMOVE_RECURSE "${MyPackage_ROOT}")
	unset(MyPackage_NOT_FOUND_MESSAGE)
	unset(MyPackage_VERSIONS_DIRECTORY)
	unset(MyPackage_VERSIONS)
endforeach()
