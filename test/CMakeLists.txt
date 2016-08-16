cmake_minimum_required(VERSION 3.1)

project(FindMyPackage.cmake-tests
	LANGUAGES NONE
)

enable_testing()

macro(simple_test _name)
	add_test(
		NAME ${_name}
		WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
		COMMAND
			"${CMAKE_COMMAND}"
			"-DTEST_UTILS:FILEPATH=${CMAKE_CURRENT_SOURCE_DIR}/test-utils.cmake"
			"-DTEST_MODULE_DIR:PATH=${CMAKE_CURRENT_SOURCE_DIR}/../"
			"-DTEST_SOURCE_DIR:PATH=${CMAKE_CURRENT_SOURCE_DIR}/${_name}"
			"-DTEST_BINARY_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/test/${_name}"
			"-DTEST_GENERATOR:STRING=${CMAKE_GENERATOR}"
			-P "${CMAKE_CURRENT_SOURCE_DIR}/run-test.cmake"
	)
	if(NOT "${ARGV1}" STREQUAL "")
		if("${ARGV2}" STREQUAL "")
			set_property(TEST ${_name} PROPERTY "${ARGV1}" ON)
		else()
			set_property(TEST ${_name} PROPERTY "${ARGV1}" "${ARGV2}")
		endif()
	endif()
endmacro()

simple_test(sanity)
simple_test(insanity WILL_FAIL)

simple_test(simple-optional-notfound)
simple_test(simple-optional-found)
simple_test(simple-required-notfound WILL_FAIL)
simple_test(simple-required-found)

simple_test(multiple-versions-major)
simple_test(multiple-versions-minor)
#simple_test(multiple-versions-patch)
#simple_test(multiple-versions-tweak)
