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

if( USE_COREPCH )
  include_directories(${CMAKE_CURRENT_BINARY_DIR})
endif()

file(GLOB_RECURSE sources_Database Database/*.cpp Database/*.h)
file(GLOB_RECURSE sources_Logging Logging/*.cpp Logging/*.h)

file(GLOB sources_localdir *.cpp *.h)

#
# Build shared sourcelist
#

if (USE_COREPCH)
  set(database_STAT_PCH_HDR PrecompiledHeaders/databasePCH.h)
  set(database_STAT_PCH_SRC PrecompiledHeaders/databasePCH.cpp)
endif()

set(database_STAT_SRCS
  ${database_STAT_SRCS}
  ${sources_Database}
  ${sources_Logging}
)

include_directories(
  ${CMAKE_BINARY_DIR}
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Detour
  ${CMAKE_SOURCE_DIR}/dep/SFMT
  ${CMAKE_SOURCE_DIR}/dep/utf8cpp
  ${CMAKE_SOURCE_DIR}/src/server
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/Database
  ${CMAKE_CURRENT_SOURCE_DIR}/Logging
  ${CMAKE_SOURCE_DIR}/src/common/
  ${CMAKE_SOURCE_DIR}/src/common/Collision
  ${CMAKE_SOURCE_DIR}/src/common/Collision/Management
  ${CMAKE_SOURCE_DIR}/src/common/Collision/Models
  ${CMAKE_SOURCE_DIR}/src/common/Debugging
  ${CMAKE_SOURCE_DIR}/src/common/Threading
  ${CMAKE_SOURCE_DIR}/src/common/Utilities
  ${CMAKE_SOURCE_DIR}/src/common/Configuration
  ${CMAKE_SOURCE_DIR}/src/common/Logging
  ${CMAKE_SOURCE_DIR}/src/server/shared
  ${ACE_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
  ${VALGRIND_INCLUDE_DIR}
)

GroupSources(${CMAKE_CURRENT_SOURCE_DIR})

add_library(database STATIC
  ${database_STAT_SRCS}
  ${database_STAT_PCH_SRC}
)

# Generate precompiled header
if (USE_COREPCH)
  add_cxx_pch(database ${database_STAT_PCH_HDR} ${database_STAT_PCH_SRC})
endif ()
