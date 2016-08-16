cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(test/sanity
	LANGUAGES NONE
)

unset(NOTAVAR)
set(EMPTYVAR "")
set(TRUEVAR ON)
set(FALSEVAR OFF)
set(STRINGVAR "This is a test")

test_verify_vars(
	NOTAVAR UNDEFINED
	EMPTYVAR DEFINED
	TRUEVAR TRUE
	FALSEVAR FALSE
	STRINGVAR "This is a test"
)
