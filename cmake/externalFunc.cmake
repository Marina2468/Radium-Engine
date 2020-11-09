cmake_minimum_required(VERSION 3.12)

include(ExternalInclude)

macro(addExternalFolder NAME FOLDER )
    # External resources/repositories are downloaded and built at configuration stage
    message(STATUS "[addExternalFolder] process ${NAME} ${FOLDER}")

    message(STATUS "[addExternalFolder] Create temporary directory")
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/external/cmake
    )

    if("${ARGN}" STREQUAL "")
        message(STATUS "[addExternalFolder] Configure cmake project")
    else ()
        message(STATUS "[addExternalFolder] Configure cmake project with options ${ARGN}")
    endif()

    string(TOUPPER ${NAME} NAME_UPPER)
    set( UPDATE_EXTERNAL ON)
    if( RADIUM_SKIP_${NAME_UPPER}_EXTERNAL )
        set( UPDATE_EXTERNAL OFF)
    endif()

    # Check if install prefix has changed. If yes, force installing the externals again
    if( DEFINED CACHED_INSTALL_PREFIX )
        if( NOT "${CACHED_INSTALL_PREFIX}" STREQUAL "${CMAKE_INSTALL_PREFIX}" )
            message(STATUS "[addExternalFolder] CMAKE_INSTALL_PREFIX has changed (from ${CACHED_INSTALL_PREFIX} to ${CMAKE_INSTALL_PREFIX}), reinstalling dependencies")
            set( UPDATE_EXTERNAL ON)
        endif()
    endif()

    # Check if the external ${NAME} is installed. If not, force installing the externals again
    if( NOT EXISTS "${CMAKE_INSTALL_PREFIX}/share/Radium-${NAME}.touch" )
        message(STATUS "[addExternalFolder] CMAKE_INSTALL_PREFIX is empty (${CMAKE_INSTALL_PREFIX}), reinstalling dependencies")
        set( UPDATE_EXTERNAL ON)
    endif()

    if ( UPDATE_EXTERNAL )
        execute_process(
            COMMAND ${CMAKE_COMMAND} ${FOLDER}
                ${RADIUM_EXTERNAL_CMAKE_OPTIONS}
                -Wno-dev
                ${ARGN}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/external
            RESULT_VARIABLE ret
        )
        if(NOT ret EQUAL "0")
            message(FATAL_ERROR "[addExternalFolder] Cmake configure step failed. ")
        endif ()
        message(STATUS "[addExternalFolder] Start build")

        set(RadiumExternalMakeTarget all)
        string(TOLOWER ${CMAKE_GENERATOR} generator_lower)
        if (MSVC AND NOT ${generator_lower} STREQUAL "ninja")
            set(RadiumExternalMakeTarget ALL_BUILD)
            message(STATUS "[addExternalFolder] Enable compatibility mode for VS Generator")
        endif ()

        if (APPLE AND ${generator_lower} STREQUAL "xcode")
            set(RadiumExternalMakeTarget ALL_BUILD)
            message(STATUS "[addExternalFolder] Enable compatibility mode for Xcode Generator")
        endif ()

        execute_process(
                COMMAND ${CMAKE_COMMAND} --build . --config ${CMAKE_BUILD_TYPE} --target ${RadiumExternalMakeTarget}
                WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/external
                RESULT_VARIABLE ret
        )

        if(NOT ret EQUAL "0")
            message( FATAL_ERROR "[addExternalFolder] Cmake build step failed. ")
        endif()
        message(STATUS "[addExternalFolder] Build ended")

        #Configure package
        if(EXISTS "${FOLDER}/package.cmake")
            set(EXTERNAL_TARGET_PACKAGE_FILE "${CMAKE_CURRENT_BINARY_DIR}/external/cmake/package-${NAME}.cmake")
            message(STATUS "[addExternalFolder] Configure package file ${EXTERNAL_TARGET_PACKAGE_FILE}")
            configure_file(${FOLDER}/package.cmake "${EXTERNAL_TARGET_PACKAGE_FILE}" COPYONLY)
            include("${EXTERNAL_TARGET_PACKAGE_FILE}")
            unset(EXTERNAL_TARGET_PACKAGE_FILE)
        endif()
        OPTION( RADIUM_SKIP_${NAME_UPPER}_EXTERNAL "[addExternalFolder] Skip updating ${NAME}::external (disable for rebuild)" ON)

    else()
        message("[addExternalFolder] Skip ${NAME}::external update (use RADIUM_SKIP_${NAME_UPPER}_EXTERNAL to change behavior)")
    endif()

    #This dummy target add external/CMakeLists.txt to most IDEs
    set(external_sources ${FOLDER}/CMakeLists.txt)
    if(EXISTS "${FOLDER}/package.cmake")
        list(APPEND external_sources ${FOLDER}/package.cmake)
    endif()
    add_custom_target(External${NAME} ALL SOURCES ${external_sources})
    include("${CMAKE_CURRENT_BINARY_DIR}/external/cmake/package-${NAME}.cmake")

    # Create touch file
    file( TOUCH "${CMAKE_CURRENT_BINARY_DIR}/Radium-${NAME}.touch" )
    install(
      FILES
        "${CMAKE_CURRENT_BINARY_DIR}/Radium-${NAME}.touch"
      DESTINATION
        share/
    )

endmacro()
