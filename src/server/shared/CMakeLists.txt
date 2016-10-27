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

file(GLOB_RECURSE sources_Cryptography Cryptography/*.cpp Cryptography/*.h)
file(GLOB_RECURSE sources_DataStores DataStores/*.cpp DataStores/*.h)
file(GLOB_RECURSE sources_Dynamic Dynamic/*.cpp Dynamic/*.h)
file(GLOB_RECURSE sources_Packets Packets/*.cpp Packets/*.h)
if( WIN32 )
   file(GLOB_RECURSE sources_Service Service/*.cpp Service/*.h)
endif( WIN32 )
file(GLOB sources_localdir *.cpp *.h)

source_group(CMake FILES CMakeLists.txt)
source_group(Configuration FILES ${sources_Configuration})
source_group(Cryptography FILES ${sources_Cryptography})
source_group(Database FILES ${sources_Database})
source_group(DataStores FILES ${sources_DataStores})
source_group(Dynamic FILES ${sources_Dynamic})
source_group(Logging FILES ${sources_Logging})
source_group(Packets FILES ${sources_Packets})
source_group(Threading FILES ${sources_Threading})
source_group(Utilities FILES ${sources_Utilities})
source_group(localdir FILES ${sources_localdir})

#
# Build shared sourcelist
#

if (USE_COREPCH)
  set(shared_STAT_PCH_HDR PrecompiledHeaders/sharedPCH.h)
  set(shared_STAT_PCH_SRC PrecompiledHeaders/sharedPCH.cpp)
endif()

set(shared_STAT_SRCS
  ${shared_STAT_SRCS}
  ${sources_Cryptography}
  ${sources_DataStores}
  ${sources_Dynamic}
  ${sources_Packets}
  ${sources_Service}
  ${sources_localdir}
  
)

include_directories(
  ${CMAKE_BINARY_DIR}
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Detour
  ${CMAKE_SOURCE_DIR}/dep/SFMT
  ${CMAKE_SOURCE_DIR}/dep/sockets/include
  ${CMAKE_SOURCE_DIR}/dep/utf8cpp
  ${CMAKE_SOURCE_DIR}/src/server
  ${CMAKE_SOURCE_DIR}/src/server/database
  ${CMAKE_SOURCE_DIR}/src/server/database/Database
  ${CMAKE_SOURCE_DIR}/src/server/database/Logging
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/Cryptography
  ${CMAKE_CURRENT_SOURCE_DIR}/DataStores
  ${CMAKE_CURRENT_SOURCE_DIR}/Dynamic
  ${CMAKE_CURRENT_SOURCE_DIR}/Packets
  ${CMAKE_CURRENT_SOURCE_DIR}/Service
  ${CMAKE_SOURCE_DIR}/src/common/
  ${CMAKE_SOURCE_DIR}/src/common/Collision
  ${CMAKE_SOURCE_DIR}/src/common/Collision/Management
  ${CMAKE_SOURCE_DIR}/src/common/Collision/Models
  ${CMAKE_SOURCE_DIR}/src/common/Debugging
  ${CMAKE_SOURCE_DIR}/src/common/Utilities
  ${CMAKE_SOURCE_DIR}/src/common/Configuration
  ${CMAKE_SOURCE_DIR}/src/common/Logging
  ${ACE_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
)

GroupSources(${CMAKE_CURRENT_SOURCE_DIR})

add_library(shared STATIC
  ${shared_STAT_SRCS}
  ${shared_STAT_PCH_SRC}
)

target_link_libraries(shared
  ${ACE_LIBRARY}
)

# Generate precompiled header
if (USE_COREPCH)
  add_cxx_pch(shared ${shared_STAT_PCH_HDR} ${shared_STAT_PCH_SRC})
endif ()
