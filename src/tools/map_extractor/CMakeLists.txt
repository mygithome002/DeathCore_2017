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

file(GLOB_RECURSE sources *.cpp *.h)

include_directories (
  ${CMAKE_SOURCE_DIR}/src/server/shared
  ${CMAKE_SOURCE_DIR}/dep/StormLib/src
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/loadlib
)

include_directories(${include_Dirs})

add_executable(mapextractor
  ${sources}
)

target_link_libraries(mapextractor
  ${BZIP2_LIBRARIES}
  ${ZLIB_LIBRARIES}
  storm
)

add_dependencies(mapextractor storm)

if( UNIX )
  install(TARGETS mapextractor DESTINATION bin)
elseif( WIN32 )
  install(TARGETS mapextractor DESTINATION "${CMAKE_INSTALL_PREFIX}")
endif()
