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

########### authserver ###############

file(GLOB_RECURSE sources_Authentication Authentication/*.cpp Authentication/*.h)
file(GLOB_RECURSE sources_PrecompiledHeaders PrecompiledHeaders/*.cpp PrecompiledHeaders/*.h)
file(GLOB_RECURSE sources_Realms Realms/*.cpp Realms/*.h)
file(GLOB_RECURSE sources_Server Server/*.cpp Server/*.h)
file(GLOB sources_Localdir *.cpp *.h)

source_group(CMake FILES CMakeLists.txt)
source_group(Authentication FILES ${sources_Authentication})
source_group(PrecompiledHeaders FILES ${sources_PrecompiledHeaders})
source_group(Realms FILES ${sources_Realms})
source_group(Server FILES ${sources_Server})
source_group(localdir FILES ${sources_Localdir})

if (USE_COREPCH)
  set(authserver_PCH_HDR PrecompiledHeaders/authPCH.h)
  set(authserver_PCH_SRC PrecompiledHeaders/authPCH.cpp)
endif()

set(authserver_SRCS
  ${authserver_SRCS}
  ${sources_Authentication}
  ${sources_Realms}
  ${sources_Server}
  ${sources_Localdir}
)

if( WIN32 )
  set(authserver_SRCS
    ${authserver_SRCS}
    ${sources_windows_Debugging}
  )
  if ( MSVC )
    set(authserver_SRCS
      ${authserver_SRCS}
      authserver.rc
    )
  endif ()
endif()

include_directories(
  ${CMAKE_BINARY_DIR}
  ${CMAKE_SOURCE_DIR}/src/server/database
  ${CMAKE_SOURCE_DIR}/src/server/database/Database
  ${CMAKE_SOURCE_DIR}/src/server/database/Logging
  ${CMAKE_SOURCE_DIR}/src/server/shared
  ${CMAKE_SOURCE_DIR}/src/server/shared/Packets
  ${CMAKE_SOURCE_DIR}/src/server/shared/Cryptography
  ${CMAKE_SOURCE_DIR}/src/server/shared/Cryptography/Authentication
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/Authentication
  ${CMAKE_CURRENT_SOURCE_DIR}/Realms
  ${CMAKE_CURRENT_SOURCE_DIR}/Server
  ${CMAKE_CURRENT_SOURCE_DIR}/
  ${CMAKE_SOURCE_DIR}/src/common/
  ${CMAKE_SOURCE_DIR}/src/common/Collision
  ${CMAKE_SOURCE_DIR}/src/common/Collision/Management
  ${CMAKE_SOURCE_DIR}/src/common/Collision/Models
  ${CMAKE_SOURCE_DIR}/src/common/Debugging
  ${CMAKE_SOURCE_DIR}/src/common/Utilities
  ${CMAKE_SOURCE_DIR}/src/common/Threading
  ${CMAKE_SOURCE_DIR}/src/common/Configuration
  ${CMAKE_SOURCE_DIR}/src/common/Logging
  ${ACE_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
)

GroupSources(${CMAKE_CURRENT_SOURCE_DIR})

add_executable(authserver
  ${authserver_SRCS}
  ${authserver_PCH_SRC}
)

if( NOT WIN32 )
  set_target_properties(authserver PROPERTIES
    COMPILE_DEFINITIONS _TRINITY_REALM_CONFIG="${CONF_DIR}/authserver.conf"
  )
endif()

target_link_libraries(authserver
  common
  shared
  database
  ${MYSQL_LIBRARY}
  ${OPENSSL_LIBRARIES}
  ${CMAKE_THREAD_LIBS_INIT}
  ${ACE_LIBRARY}
  ${Boost_LIBRARIES}
)

if( WIN32 )
  if ( MSVC )
    add_custom_command(TARGET authserver
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/authserver.conf.dist ${CMAKE_BINARY_DIR}/bin/$(ConfigurationName)/
    )
  elseif ( MINGW )
    add_custom_command(TARGET authserver
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/authserver.conf.dist ${CMAKE_BINARY_DIR}/bin/
    )
  endif()
endif()

if( UNIX )
  install(TARGETS authserver DESTINATION bin)
  install(FILES  authserver.conf.dist DESTINATION ${CONF_DIR})
elseif( WIN32 )
  install(TARGETS authserver DESTINATION "${CMAKE_INSTALL_PREFIX}")
  install(FILES authserver.conf.dist DESTINATION "${CMAKE_INSTALL_PREFIX}")
endif()

# Generate precompiled header
if (USE_COREPCH)
  add_cxx_pch(authserver ${authserver_PCH_HDR} ${authserver_PCH_SRC})
endif()
