#set(CMAKE_
find_path(LIBGBA_INCLUDE_DIR
    NAMES gba.h
    DOC "The libgba include directory"
    HINTS /opt/devkitpro/libgba/include
)

find_library(LIBGBA_LIBRARY
    NAMES gba
    DOC "The libgba library"
    HINTS /opt/devkitpro/libgba/lib
)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibGBA
                                  REQUIRED_VARS LIBGBA_LIBRARY LIBGBA_INCLUDE_DIR
                                  VERSION_VAR LIBGBA_VERSION_STRING)

if(LIBGBA_FOUND)
    set(LIBGBA_LIBRARIES ${LIBGBA_LIBRARY} )
    set(LIBGBA_INCLUDE_DIRS ${LIBGBA_INCLUDE_DIR} )
  if(NOT TARGET Gba)
    add_library(Gba UNKNOWN IMPORTED)
    set_target_properties(Gba PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${ALSA_INCLUDE_DIRS}")
    set_property(TARGET Gba APPEND PROPERTY IMPORTED_LOCATION "${ALSA_LIBRARY}")
  endif()
endif()

mark_as_advanced(LIBGBA_INCLUDE_DIR LIBGBA_LIBRARY)
