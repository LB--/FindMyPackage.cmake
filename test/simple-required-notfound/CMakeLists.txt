cmake_minimum_required(VERSION 3.1)

include("${TEST_UTILS}")

project(test/simple-optional-notfound
	LANGUAGES NONE
)

find_package(MyPackage REQUIRED)
