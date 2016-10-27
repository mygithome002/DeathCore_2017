# Copyright (C) 2013-2016 JadeCore <https://www.jadecore.tk/>
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

# We need to generate the jemalloc_def.h header based on platform-specific settings
if (PLATFORM EQUAL 32)
  set(JEM_SIZEDEF 2)
  set(JEM_TLSMODEL)
else()
  set(JEM_SIZEDEF 3)
  set(JEM_TLSMODEL "__attribute__\(\(tls_model\(\"initial-exec\"\)\)\)")
endif()

# Create the header, so we can use it
configure_file(
  "${CMAKE_SOURCE_DIR}/dep/jemalloc/jemalloc_defs.h.in.cmake"
  "${BUILDDIR}/jemalloc_defs.h"
  @ONLY
)

# Done, let's continue
set(jemalloc_STAT_SRC
  ${CMAKE_CURRENT_SOURCE_DIR}/src/arena.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/atomic.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/base.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/bitmap.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/chunk.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/chunk_dss.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/chunk_mmap.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/ckh.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/ctl.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/extent.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/hash.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/huge.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/jemalloc.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/mb.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/mutex.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/prof.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/quarantine.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/rtree.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/stats.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/tcache.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/tsd.c
  ${CMAKE_CURRENT_SOURCE_DIR}/src/util.c
)

include_directories(
  ${BUILDDIR}/
  ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_definitions(-D_GNU_SOURCE -D_REENTRANT)

add_library(jemalloc STATIC ${jemalloc_STAT_SRC})
