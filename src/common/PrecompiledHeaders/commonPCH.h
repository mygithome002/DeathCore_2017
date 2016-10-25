/*
 * Copyright (C) 2016 DeathCore <http://www.noffearrdeathproject.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Define.h"
#include "Common.h"
#include "BoundingIntervalHierarchy.h"
#include "BoundingIntervalHierarchyWrapper.h"
#include "RegularGrid.h"
#include "Collision/VMapDefinitions.h"
#include "Collision/Maps/MapTree.h"
#include "Collision/Models/WorldModel.h"
#include "Collision/Models/ModelInstance.h"
#include "Collision/Models/GameObjectModel.h"
#include "Threading/ProducerConsumerQueue.h"
#include "Utilities/TaskScheduler.h"
#include "Utilities/EventMap.h"
