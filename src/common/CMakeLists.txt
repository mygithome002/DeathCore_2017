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

file(GLOB_RECURSE sources_Common Common.cpp Common.h)
file(GLOB_RECURSE sources_Collision Collision/*.cpp Collision/*.h)
file(GLOB_RECURSE sources_Threading Threading/*.cpp Threading/*.h)
file(GLOB_RECURSE sources_Utilities Utilities/*.cpp Utilities/*.h)
file(GLOB_RECURSE sources_Configuration Configuration/*.cpp Configuration/*.h)
file(GLOB_RECURSE sources_Logging Logging/*.cpp Logging/*.h)
# Manually set sources for Debugging directory as we don't want to include WheatyExceptionReport in common project
# It needs to be included both in authserver and worldserver for the static global variable to be properly initialized
# and to handle crash logs on windows
set(sources_Debugging Debugging/Errors.cpp Debugging/Errors.h)
file(GLOB sources_localdir *.cpp *.h)


if (USE_COREPCH)
  set(common_STAT_PCH_HDR PrecompiledHeaders/commonPCH.h)
  set(common_STAT_PCH_SRC PrecompiledHeaders/commonPCH.cpp)
endif ()

set(common_STAT_SRCS
  ${common_STAT_SRCS}
  ${sources_Common}
  ${sources_Collision}
  ${sources_Threading}
  ${sources_Utilities}
  ${sources_Debugging}
  ${sources_Configuration}
  ${sources_Logging}
  ${sources_localdir}
)

include_directories(
  ${CMAKE_BINARY_DIR}
  ${CMAKE_SOURCE_DIR}/dep/utf8cpp
  ${CMAKE_SOURCE_DIR}/dep/SFMT
  ${CMAKE_SOURCE_DIR}/dep/g3dlite/include
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Detour
  ${CMAKE_SOURCE_DIR}/src/server/database
  ${CMAKE_SOURCE_DIR}/src/server/database/Database
  ${CMAKE_SOURCE_DIR}/src/server/database/Logging
  ${CMAKE_SOURCE_DIR}/src/server/shared
  ${CMAKE_SOURCE_DIR}/src/server/shared/Dynamic
  ${CMAKE_SOURCE_DIR}/src/server/shared/Dynamic/LinkedReference
  ${CMAKE_SOURCE_DIR}/src/server/shared/Packets
  ${CMAKE_SOURCE_DIR}/src/server/shared/DataStores
  ${CMAKE_SOURCE_DIR}/src/server/game/Addons
  ${CMAKE_SOURCE_DIR}/src/server/game/Conditions
  ${CMAKE_SOURCE_DIR}/src/server/game/Entities/Item
  ${CMAKE_SOURCE_DIR}/src/server/game/Entities/GameObject
  ${CMAKE_SOURCE_DIR}/src/server/game/Entities/Creature
  ${CMAKE_SOURCE_DIR}/src/server/game/Entities/Object
  ${CMAKE_SOURCE_DIR}/src/server/game/Entities/Object/Updates
  ${CMAKE_SOURCE_DIR}/src/server/game/Entities/Unit
  ${CMAKE_SOURCE_DIR}/src/server/game/Combat
  ${CMAKE_SOURCE_DIR}/src/server/game/Loot
  ${CMAKE_SOURCE_DIR}/src/server/game/Miscellaneous
  ${CMAKE_SOURCE_DIR}/src/server/game/Grids
  ${CMAKE_SOURCE_DIR}/src/server/game/Grids/Cells
  ${CMAKE_SOURCE_DIR}/src/server/game/Grids/Notifiers
  ${CMAKE_SOURCE_DIR}/src/server/game/Maps
  ${CMAKE_SOURCE_DIR}/src/server/game/DataStores
  ${CMAKE_SOURCE_DIR}/src/server/game/Movement/Waypoints
  ${CMAKE_SOURCE_DIR}/src/server/game/Movement/Spline
  ${CMAKE_SOURCE_DIR}/src/server/game/Movement
  ${CMAKE_SOURCE_DIR}/src/server/game/Server
  ${CMAKE_SOURCE_DIR}/src/server/game/Server/Protocol
  ${CMAKE_SOURCE_DIR}/src/server/game/World
  ${CMAKE_SOURCE_DIR}/src/server/game/Spells
  ${CMAKE_SOURCE_DIR}/src/server/game/Spells/Auras
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/Threading
  ${CMAKE_CURRENT_SOURCE_DIR}/Debugging
  ${CMAKE_CURRENT_SOURCE_DIR}/Collision
  ${CMAKE_CURRENT_SOURCE_DIR}/Collision/Management
  ${CMAKE_CURRENT_SOURCE_DIR}/Collision/Maps
  ${CMAKE_CURRENT_SOURCE_DIR}/Collision/Models
  ${CMAKE_CURRENT_SOURCE_DIR}/Utilities
  ${CMAKE_CURRENT_SOURCE_DIR}/Configuration
  ${CMAKE_CURRENT_SOURCE_DIR}/Logging
  ${ACE_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
)

add_library(common STATIC
  ${common_STAT_SRCS}
  ${common_STAT_PCH_SRC}
)

# Generate precompiled header
if (USE_COREPCH)
  add_cxx_pch(common ${common_STAT_PCH_HDR} ${common_STAT_PCH_SRC})
endif ()
