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

#include "ScriptPCH.h"
#include "Spell.h"
#include "SpellAuraEffects.h"
#include "SpellScript.h"
 
 /******************
** Crystalline Elemental
*******************/

#define SPELL_IMPALE     104019

class npc_crystalline_elemental : public CreatureScript
{
public:
    npc_crystalline_elemental() : CreatureScript("npc_crystalline_elemental") {}
 
       struct npc_crystalline_elementalAI : public ScriptedAI
       {
           npc_crystalline_elementalAI(Creature *c): ScriptedAI(c) {}

           uint32 Impale_Timer;

       void Reset()
        {
          Impale_Timer = 5000;
        }

       void UpdateAI(const uint32 diff)
           {
            if (!UpdateVictim())
               return;

               if(Impale_Timer<= diff)
               {
                 DoCast(SPELL_IMPALE);
                 Impale_Timer = 10000;
                }
			   else Impale_Timer -= diff;

          DoMeleeAttackIfReady();
           }
       };

CreatureAI* GetAI(Creature *pCreature) const
    {
        return new npc_crystalline_elementalAI(pCreature);
    }
};

void AddSC_trash_mobs_hot()
{
   new npc_crystalline_elemental();
}