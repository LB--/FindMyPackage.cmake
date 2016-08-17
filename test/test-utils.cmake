
function(test_create_versions _package)
	list(SORT ARGN)
	set(_root            "${CMAKE_CURRENT_BINARY_DIR}/root with spaces")
	set(${_package}_ROOT "${CMAKE_CURRENT_BINARY_DIR}/root with spaces" PARENT_SCOPE)
	set(${_package}_VERSIONS_CREATED ${ARGN} PARENT_SCOPE)

	foreach(_version ${ARGN})
		list(GET _version 0 _v)
		list(REMOVE_AT _version 0)

		file(MAKE_DIRECTORY "${_root}/${_package}/${_v}/cmake/${_package}/")
		file(WRITE "${_root}/${_package}/${_v}/cmake/${_package}.cmake"
			"set(${_package}-${_v}_LOADED 1)\n"
		)
		foreach(_c ${_version})
			file(WRITE "${_root}/${_package}/${_v}/cmake/${_package}/${_c}.cmake"
				"set(${_package}-${_v}_${_c}_LOADED 1)\n"
			)
		endforeach()
	endforeach()
endfunction()

function(test_verify_vars)
	math(EXPR _v "${ARGC} / 2")
	math(EXPR _v "${_v} * 2")
	if(NOT ${ARGC} EQUAL ${_v})
		message(FATAL_ERROR "Odd parameter count")
	endif()

	set(_var_i 0)
	set(_val_i 1)
	while("${_var_i}" LESS "${ARGC}")
		set(_var "${ARGV${_var_i}}")
		set(_val "${ARGV${_val_i}}")

		if("${_val}" STREQUAL "UNDEFINED")
			if(DEFINED ${_var})
				message(FATAL_ERROR "Variable \"${_var}\" was defined, should not have been defined")
			endif()
		elseif(NOT DEFINED ${_var})
			message(FATAL_ERROR "Variable \"${_var}\" was not defined, should have been defined")
		elseif("${_val}" STREQUAL "DEFINED")
		elseif("${_val}" STREQUAL "TRUE")
			if(NOT ${_var})
				message(FATAL_ERROR "Variable \"${_var}\" was \"${${_var}}\", should have been true-ish")
			endif()
		elseif("${_val}" STREQUAL "FALSE")
			if(${_var})
				message(FATAL_ERROR "Variable \"${_var}\" was \"${${_var}}\", should have been flase-ish")
			endif()
		elseif(NOT "${${_var}}" STREQUAL "${_val}")
			message(FATAL_ERROR "Variable \"${_var}\" was \"${${_var}}\", should have been \"${_val}\"")
		endif()

		math(EXPR _var_i "${_var_i} + 2")
		math(EXPR _val_i "${_var_i} + 1")
	endwhile()
endfunction()
