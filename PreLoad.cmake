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

# This file is run right before CMake starts configuring the sourcetree

# Example: Force CMAKE_INSTALL_PREFIX to be preloaded with something before
# doing the actual first "configure"-part - allows for hardforcing
# destinations elsewhere in the CMake buildsystem (commented out on purpose)

# Override CMAKE_INSTALL_PREFIX on Windows platforms
#if( WIN32 )
#  if( NOT CYGWIN )
#    set(CMAKE_INSTALL_PREFIX
#      "" CACHE PATH "Default install path")
#  endif()
#endif()
