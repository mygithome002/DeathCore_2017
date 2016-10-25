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

file(GLOB sources libmpq/*.c libmpq/*.h)

add_library(mpq STATIC ${sources})

set_target_properties(mpq PROPERTIES LINKER_LANGUAGE CXX)

if(WIN32)
  set(WIN_EXTRA_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/win)
endif()

target_include_directories(mpq
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${WIN_EXTRA_INCLUDE}
    ${CMAKE_SOURCE_DIR}/dep/zlib
    ${CMAKE_SOURCE_DIR}/dep/bzip2)

target_link_libraries(mpq
  PUBLIC
    zlib
    bzip2)

set_target_properties(mpq
    PROPERTIES
      FOLDER
        "dep")
