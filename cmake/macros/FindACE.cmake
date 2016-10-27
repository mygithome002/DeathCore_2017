# Copyright (C) 2016 DeathCore <http://www.noffearrdeathproject.org/>
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

#
# Find the ACE client includes and library
#

# This module defines
# ACE_INCLUDE_DIR, where to find ace.h
# ACE_LIBRARIES, the libraries to link against
# ACE_FOUND, if false, you cannot build anything that requires ACE

# also defined, but not for general use are
# ACE_LIBRARY, where to find the ACE library.

set( ACE_FOUND 0 )

if ( UNIX )
  if (NOT ACE_INCLUDE_DIR)
    FIND_PATH( ACE_INCLUDE_DIR
      NAMES
        ace/ACE.h
      PATHS
        /usr/include
        /usr/include/ace
        /usr/local/include
        /usr/local/include/ace
        $ENV{ACE_ROOT}
        $ENV{ACE_ROOT}/ace
        $ENV{ACE_ROOT}/include
        ${CMAKE_SOURCE_DIR}/externals/ace
    DOC
      "Specify include-directories that might contain ace.h here."
    )
  endif()

  if (NOT ACE_LIBRARY)
    FIND_LIBRARY( ACE_LIBRARY
      NAMES
        ace ACE
      PATHS
        /usr/lib
        /usr/lib/ace
        /usr/local/lib
        /usr/local/lib/ace
        /usr/local/ace/lib
        $ENV{ACE_ROOT}/lib
        $ENV{ACE_ROOT}
      DOC "Specify library-locations that might contain the ACE library here."
    )

  #  FIND_LIBRARY( ACE_EXTRA_LIBRARIES
  #    NAMES
  #      z zlib
  #    PATHS
  #      /usr/lib
  #      /usr/local/lib
  #    DOC
  #      "if more libraries are necessary to link into ACE, specify them here."
  #  )
  endif()

  if ( ACE_LIBRARY )
    if ( ACE_INCLUDE_DIR )
      if (_ACE_VERSION)
        set(ACE_VERSION "${_ACE_VERSION}")
      else (_ACE_VERSION)
        file(STRINGS "${ACE_INCLUDE_DIR}/ace/Version.h" ACE_VERSION_STR REGEX "^#define ACE_VERSION \".*\"")
        string(REGEX REPLACE "^.*ACE_VERSION \"([0-9].[0-9].[0-9a-z]).*$"
           "\\1" ACE_VERSION "${ACE_VERSION_STR}")
      endif (_ACE_VERSION)

      include(EnsureVersion)
      ENSURE_VERSION( "${ACE_EXPECTED_VERSION}" "${ACE_VERSION}" ACE_FOUND)
      if (NOT ACE_FOUND)
        message(FATAL_ERROR "TrinityCore needs ACE version ${ACE_EXPECTED_VERSION} but found version ${ACE_VERSION}")
      endif()

      message( STATUS "Found ACE library: ${ACE_LIBRARY}")
      message( STATUS "Found ACE headers: ${ACE_INCLUDE_DIR}")
    else ( ACE_INCLUDE_DIR )
      message(FATAL_ERROR "Could not find ACE headers! Please install ACE libraries and headers")
    endif ( ACE_INCLUDE_DIR )
  endif ( ACE_LIBRARY )

  mark_as_advanced( ACE_FOUND ACE_LIBRARY ACE_EXTRA_LIBRARIES ACE_INCLUDE_DIR )
endif (UNIX)
