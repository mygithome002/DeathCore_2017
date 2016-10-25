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

file(GLOB_RECURSE meshExtract_Sources *.cpp *.h)

set(include_Base
  ${CMAKE_BINARY_DIR}
  ${CMAKE_SOURCE_DIR}/src/server/shared
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Detour
  ${CMAKE_SOURCE_DIR}/dep/libmpq
  ${CMAKE_SOURCE_DIR}/dep/g3dlite/include
  ${ACE_INCLUDE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}
)

if( WIN32 )
  set(include_Base
    ${include_Base}
    ${CMAKE_SOURCE_DIR}/dep/libmpq/win
    )
endif()

include_directories(${include_Base})

add_executable(MeshExtractor ${meshExtract_Sources})

target_link_libraries(MeshExtractor
  g3dlib
  mpq
  Recast
  Detour
  ${BZIP2_LIBRARIES}
  ${ZLIB_LIBRARIES}
  ${ACE_LIBRARY}
)

if( UNIX )
  install(TARGETS MeshExtractor DESTINATION bin)
elseif( WIN32 )
  install(TARGETS MeshExtractor DESTINATION "${CMAKE_INSTALL_PREFIX}")
endif()
