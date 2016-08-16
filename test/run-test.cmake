
file(REMOVE_RECURSE "${TEST_BINARY_DIR}")
file(MAKE_DIRECTORY "${TEST_BINARY_DIR}")
set(_command
	"${CMAKE_COMMAND}"
	-G "${TEST_GENERATOR}"
	"${TEST_SOURCE_DIR}"
	"-DTEST_UTILS:FILEPATH=${TEST_UTILS}"
	"-DCMAKE_MODULE_PATH:PATH=${TEST_MODULE_DIR}"
	-Werror=dev
	-Werror=deprecated
)
message(STATUS "CMake command: ${_command}")
execute_process(
	COMMAND ${_command}
	WORKING_DIRECTORY "${TEST_BINARY_DIR}"
	RESULT_VARIABLE _result
)
if(NOT _result EQUAL 0)
	message(FATAL_ERROR "CMake returned ${_result}")
endif()
