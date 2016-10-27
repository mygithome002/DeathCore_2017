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

#ifndef SHARED_PTRS_H
# define SHARED_PTRS_H

class Aura;
class UnitAura;
class AuraEffect;

# define CAST(x,y) std::dynamic_pointer_cast<x>(y)
# define CONST_CAST(x, y) std::const_pointer_cast<const x>(y)

# define AuraPtr std::shared_ptr<Aura>
# define constAuraPtr std::shared_ptr<const Aura>
# define UnitAuraPtr std::shared_ptr<UnitAura>
# define AuraEffectPtr std::shared_ptr<AuraEffect>
# define constAuraEffectPtr std::shared_ptr<const AuraEffect>

# define TO_UNITAURA(y) CAST(UnitAura,y)

# define NULLAURA nullptr
# define NULLAURA_EFFECT nullptr


#endif /* !SHARED_PTRS_H */