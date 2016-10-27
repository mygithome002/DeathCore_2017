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

#include "GameObjectAI.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "siege_of_orgrimmar.h"  

enum eSpells
{
    // Split
    SPELL_SPLIT_DUMMY               = 143020,
    SPELL_SPLIT_SHA_PUDDLE          = 143022,
    SPELL_SPLIT_CONTAMINATED_PUDDLE = 143024,

    // Seeping Sha
    SPELL_SEEPING_SHA_VISUAL        = 143281,
    SPELL_SEEPING_SHA_DAMAGE        = 143286,

    // Split phase
    SPELL_SHA_RESIDUE               = 143459,
    SPELL_ERUPTING_SHA              = 143498,
    SPELL_CONGEALING                = 143540,
    SPELL_PURIFIED_RESIDUE          = 143524,

    // Normal phase
    SPELL_COROSIVE_BLAST            = 143436,
    SPELL_SHA_POOL_AURA             = 143462,
    SPELL_SHA_POOL_DAMAGE           = 143460,

    // Sha Bolt
    SPELL_SHA_BOLT_DAMAGE           = 143293,
    SPELL_SHA_BOLT_DUMMY            = 143290,

    // Swirl
    SPELL_SWIRL_DUMMY               = 143309,
    SPELL_SWIRL_DAMAGE              = 143412,
    SPELL_SWIRL_VOID_ZONES          = 147184,
    SPELL_SWIRL_VOID_ZONES_DAMAGE   = 143413,
};

enum eEvents
{
    EVENT_SPLIT           = 1,
    EVENT_COROSIVE_BLAST  = 2,
    EVENT_SHA_POOL_DAMAGE = 3,
    EVENT_SWIRL           = 4,
    EVENT_SHA_BOLT        = 5,
    EVENT_FIRST_PHASE     = 6,

    EVENT_MOVE_ONE        = 7,
    EVENT_MOVE_TWO        = 8,
    EVENT_MOVE_THREE      = 9,
    EVENT_MOVE_FOUR       = 10,
    EVENT_TEARS_OF_VALE   = 11,
};

enum eActions
{
    ACTION_REMOVE_ENERGY = 1,
};

enum ePhases
{
    PHASE_ONE = 1,
    PHASE_TWO = 2,
};

enum eCreatures
{
    CREATURE_SWIRL_TARGET        = 71550,
    CREATURE_SWIRL_ZONE          = 71548,
    CREATURE_SHA_POOL            = 71544,
    CREATURE_SHA_PUDDLE          = 71603,
    CREATURE_CONTAMINATED_PUDDLE = 71604,
    CREATURE_TEARS_OF_VALE       = 73638,
};

enum eChestLoot
{
    GO_NORMAL_10_LOOT  = 221776,
    GO_HEROIC_10_LOOT  = 221778,
    GO_NORMAL_25_LOOT  = 221779,
    GO_HEROIC_25_LOOT  = 221780,
    GO_RAIDFINDER_LOOT = 221781,
};

Position immersus_chest = {1440.66f, 817.257f, 246.835f, 4.679507f};

Position circleposition[6] =
{
    { 1447.89f, 828.258f, 246.835f },
    { 1384.38f, 799.616f, 246.784f },
    { 1366.21f, 726.288f, 246.834f },
    { 1482.72f, 682.118f, 246.836f },
    { 1513.86f, 780.797f, 246.835f },
    { 1447.89f, 828.258f, 246.835f },
};

Position immersusfrontdoor = { 1442.74f, 861.203f, 248.994f, 3.519956f };
Position immersusbackdoor2 = { 1442.74f, 861.203f, 248.994f, 3.519956f };

#define MAX_PUDDLES 12
#define FRENDLY_FACTION 35
#define HOSTILE_FACTION 16

void DespawnCreaturesInArea(uint32 entry, WorldObject* object)
{
    std::list<Creature*> creatures;
    GetCreatureListWithEntryInGrid(creatures, object, entry, 300.0f);
    if (creatures.empty())
        return;

    for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
        (*iter)->DespawnOrUnsummon();
}

void RemoveEnergy(Creature* creature, uint8 value, uint64 guid)
{
    if (Creature* immerseus = sObjectAccessor->GetCreature(*creature, guid))
    {
        uint8 power = immerseus->GetPower(Powers(POWER_ENERGY));

        immerseus->SetPower(Powers(POWER_ENERGY), power - value);
    }
}

// Immerseus - 71543
class boss_immerseus : public CreatureScript
{
    public:
        boss_immerseus() : CreatureScript("boss_immerseus") { }

        struct boss_immerseusAI : public BossAI
        {
            boss_immerseusAI(Creature* creature) : BossAI(creature, DATA_IMMERSEUS)
            {
            
            }

            void Reset() override
            {
                _Reset();

                me->SetDisplayId(49056);
                me->RemoveAllAuras();
                me->setFaction(HOSTILE_FACTION);

                me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);

                me->SetMaxPower(POWER_ENERGY, 100);
                me->SetInt32Value(UNIT_FIELD_MAX_POWER, 100);
                me->SetPower(POWER_ENERGY, 100);
                me->SetInt32Value(UNIT_FIELD_POWER, 100);
                me->RemoveFlag(UNIT_FIELD_FLAGS2, UNIT_FLAG2_REGENERATE_POWER);

                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            }

            void JustReachedHome()
            {
                _JustReachedHome();
                summons.DespawnAll();

                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
            }

            void EnterCombat(Unit* /*attacker*/)
            {
                _EnterCombat();
                instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);

                me->SetMaxPower(POWER_ENERGY, 100);
                me->SetInt32Value(UNIT_FIELD_MAX_POWER, 100);
                me->SetPower(POWER_ENERGY, 100);
                me->SetInt32Value(UNIT_FIELD_POWER, 100);

                events.SetPhase(PHASE_ONE);
                DoCast(me, SPELL_SEEPING_SHA_VISUAL);

                events.ScheduleEvent(EVENT_COROSIVE_BLAST, 35000, 0, PHASE_ONE);
                events.ScheduleEvent(EVENT_SWIRL, 20000, 0, PHASE_ONE);
                events.ScheduleEvent(EVENT_SHA_BOLT, 8000, 0, PHASE_ONE);
            }

            void DamageTaken(Unit* /*attacker*/, uint32& damage) override
            {
                if (!me->IsInCombat())
                    return;

                if (damage > me->GetHealth())
                {
                    damage = 0;
                    me->SetHealth(1);

                    if (events.IsInPhase(PHASE_ONE))
                    {
                        events.Reset();
                        me->CastStop();

                        std::list<Creature*> shaPool;
                        me->GetCreatureListWithEntryInGrid(shaPool, CREATURE_SHA_POOL, 200.0f);
                        for (auto itr : shaPool)
                        {
                            itr->DespawnOrUnsummon(5000);
                            itr->GetMotionMaster()->MovePoint(0, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
                        }

                        events.SetPhase(PHASE_TWO);
                        events.ScheduleEvent(EVENT_SPLIT, 1000, 0, PHASE_TWO);
                    }
                }
            }

            void SummonLootChest()
            {
                float posX = immersus_chest.GetPositionX();
                float posY = immersus_chest.GetPositionY();
                float posZ = immersus_chest.GetPositionZ();
                float posO = immersus_chest.GetOrientation();

                switch (me->GetMap()->GetDifficulty())
                {
                    case RAID_DIFFICULTY_10MAN_NORMAL:
                    {
                        me->SummonGameObject(GO_NORMAL_10_LOOT, posX, posY, posZ, posO, 0, 0, 0, 0, 0);
                        break;
                    }

                    case RAID_DIFFICULTY_10MAN_HEROIC:
                    {
                        me->SummonGameObject(GO_HEROIC_10_LOOT, posX, posY, posZ, posO, 0, 0, 0, 0, 0);
                        break;
                    }

                    case RAID_DIFFICULTY_25MAN_NORMAL:
                    {
                        me->SummonGameObject(GO_NORMAL_25_LOOT, posX, posY, posZ, posO, 0, 0, 0, 0, 0);
                        break;
                    }

                    case RAID_DIFFICULTY_25MAN_HEROIC:
                    {
                        me->SummonGameObject(GO_HEROIC_25_LOOT, posX, posY, posZ, posO, 0, 0, 0, 0, 0);
                        break;
                    }
                }
            }

            void DoAction(int32 action) override
            {
                switch (action)
                {
                    case ACTION_REMOVE_ENERGY:
                    {
                        RemoveEnergy(me, 1, me->GetGUID());
                        if (me->GetPower(Powers(POWER_ENERGY)) <= 0)
                        {
                            if (me->GetDisplayId() != 49807)
                                me->SetDisplayId(49807);

                            me->setFaction(FRENDLY_FACTION);
                            me->SetFullHealth();

                            if (Creature* lorewalkerCho = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_LOREWALKER_CHO)))
                                lorewalkerCho->GetAI()->DoAction(ACTION_TALK_AFTER_IMMERSEUS);

                            if (!lootSpawn)
                            {
                                SummonLootChest();
                                lootSpawn = true;
                            }
                        }

                        break;
                    }

                    default:
                        break;
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                events.Update(diff);
            
                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_COROSIVE_BLAST:
                        {
                            DoCastVictim(SPELL_COROSIVE_BLAST);
                            events.ScheduleEvent(EVENT_COROSIVE_BLAST, 35000, 0, PHASE_ONE);
                            break;
                        }

                        case EVENT_SWIRL:
                        {
                            DoCastSelf(SPELL_SWIRL_DUMMY);
                            events.ScheduleEvent(EVENT_SWIRL, 20000, 0, PHASE_ONE);
                            break;
                        }

                        case EVENT_SHA_BOLT:
                        {
                            DoCastSelf(SPELL_SHA_BOLT_DUMMY);
                            std::list<Player*> pl_list;
                            me->GetPlayerListInGrid(pl_list, 200.0f);
                            if (pl_list.empty())
                                return;

                            for (auto itr : pl_list)
                            {
                                DoCast(itr, SPELL_SHA_BOLT_DAMAGE);
                            }

                            events.ScheduleEvent(EVENT_SHA_BOLT, 8000, 0, PHASE_ONE);
                            break;
                        }

                        case EVENT_SPLIT:
                        {
                            events.SetPhase(PHASE_TWO);
                            DoCastSelf(SPELL_SPLIT_DUMMY);
                            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            puddlesKilled = 0;
                            events.ScheduleEvent(EVENT_FIRST_PHASE, 30000, 0, PHASE_TWO);
                            break;
                        }

                        case EVENT_FIRST_PHASE:
                        {
                            events.Reset();
                            events.SetPhase(PHASE_ONE);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);

                            int8 newEnergy = me->GetPower(Powers(POWER_ENERGY));
                            uint32 health = me->GetMaxHealth();
                            uint32 newHealth = health * newEnergy;
                            me->SetHealth(newHealth);
                            me->SetDisplayId(49807);
                            split = false;

                            events.ScheduleEvent(EVENT_COROSIVE_BLAST, 35000, 0, PHASE_ONE);
                            events.ScheduleEvent(EVENT_SHA_BOLT, 8000, 0, PHASE_ONE);
                            events.ScheduleEvent(EVENT_SWIRL, 20000, 0, PHASE_ONE);
                        }
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                uint32 puddlesKilled = 0;
                bool split = false;
                bool lootSpawn = false;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_immerseusAI(creature);
        }
};

// Sha Puddle - 71603
class mob_sha_puddle : public CreatureScript
{
    public:
        mob_sha_puddle() : CreatureScript("mob_sha_puddle") { }

        struct mob_sha_puddleAI : public ScriptedAI
        {
            mob_sha_puddleAI(Creature* creature) : ScriptedAI(creature)
            {
            
            }

            InstanceScript* instance;
            bool reached = false;

            void Reset() override
            {
                me->setFaction(HOSTILE_FACTION);
                me->SetSpeed(MOVE_RUN, 0.4f, true);
                me->SetReactState(REACT_PASSIVE);
            }

            void JustDied(Unit* /*killer*/)
            {
                if (Creature* immerseus = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                    immerseus->GetAI()->DoAction(ACTION_REMOVE_ENERGY);

                std::list<Player*> players;
                players.clear();
                me->GetPlayerListInGrid(players, 300.0f);
                if (players.empty())
                    return;

                for (auto itr : players)
                {
                    if (!itr->HasAura(SPELL_SHA_RESIDUE))
                        itr->AddAura(SPELL_SHA_RESIDUE, itr);
                    else
                    {
                        if (Aura* aura = itr->GetAura(SPELL_SHA_RESIDUE))
                            aura->SetStackAmount(aura->GetStackAmount() + 1);
                    }
                }
            }

            void DamageTaken(Unit* attacker, uint32& damage) override
            {
                if (attacker->HasAura(SPELL_SHA_RESIDUE))
                    if (Aura* shaResidue = me->GetAura(SPELL_SHA_RESIDUE))
                    {
                        uint8 stacks = shaResidue->GetStackAmount();
                        if (stacks > 1)
                            damage = damage + (damage * (0.25 * stacks));
                        else
                            damage = damage + (damage * 0.25);
                    }
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);

                if (Creature* immerseus = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                    if (immerseus->IsWithinDistInMap(me, 5.0f))
                    {
                        if (reached == false)
                        {
                            me->DespawnOrUnsummon(4000);
                            reached = true;

                            immerseus->CastSpell(immerseus, SPELL_ERUPTING_SHA);
                        }
                    }

                if (!me->isMoving())
                    if (Creature* immerseus = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                        me->GetMotionMaster()->MovePoint(0, immerseus->GetPositionX(), immerseus->GetPositionY(), immerseus->GetPositionZ());

                if (Creature* immerseus = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                    if (!immerseus->HasAura(SPELL_SPLIT_DUMMY))
                        events.ScheduleEvent(EVENT_TEARS_OF_VALE, 1000);

                while (uint8 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_TEARS_OF_VALE:
                        {
                            float posX = me->GetPositionX();
                            float posY = me->GetPositionY();
                            float posZ = me->GetPositionZ();
                            float posO = me->GetOrientation();
                            Position pos = { posX, posY, posZ, posO };

                            me->SummonCreature(CREATURE_TEARS_OF_VALE, pos, TEMPSUMMON_MANUAL_DESPAWN);
                            me->DespawnOrUnsummon(0);
                            break;
                        }

                        default:
                            break;
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new mob_sha_puddleAI(creature);
        }
};

// Contaminated Puddle - 71604
class mob_contaminated_puddle : public CreatureScript
{
    public:
        mob_contaminated_puddle() : CreatureScript("mob_contaminated_puddle") { }

        struct mob_contaminated_puddleAI : public ScriptedAI
        {
            mob_contaminated_puddleAI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void Reset() override
            {
                me->setFaction(FRENDLY_FACTION);
                me->SetSpeed(MOVE_RUN, 0.4f, true);

                me->SetReactState(REACT_PASSIVE);
                reached = false;
                health = false;

                me->SetHealth(me->GetMaxHealth() * 0.10);
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);

                if (Creature* immerseus = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                    if (!immerseus->IsInCombat())
                        return;

                if (Creature* immerseus = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                {
                    if (immerseus->IsWithinDistInMap(me, 15.0f))
                    {
                        if (!reached)
                        {
                            me->DespawnOrUnsummon(4000);
                            immerseus->CastSpell(immerseus, SPELL_ERUPTING_SHA);

                            if (me->GetHealth() == me->GetMaxHealth())
                            {
                                immerseus->AI()->DoAction(ACTION_REMOVE_ENERGY);
                            }

                            reached = true;
                        }
                    }
                }

                // Congealing effect.
                if (Aura* congealing = me->GetAura(SPELL_CONGEALING))
                {
                    uint8 pct = float(me->GetHealthPct());

                    switch (pct)
                    {
                        case 10:
                            congealing->SetStackAmount(1);
                            break;
                        case 20:
                            congealing->SetStackAmount(2);
                            break;
                        case 30:
                            congealing->SetStackAmount(3);
                            break;
                        case 40:
                            congealing->SetStackAmount(4);
                            break;
                        case 50:
                            congealing->SetStackAmount(5);
                            break;
                        case 60:
                            congealing->SetStackAmount(6);
                            break;
                        case 70:
                            congealing->SetStackAmount(7);
                            break;
                        case 80:
                            congealing->SetStackAmount(8);
                            break;
                        case 90:
                            congealing->SetStackAmount(9);
                            break;
                        default:
                            break;
                    }
                }

                if (health == false)
                {
                    if (me->GetHealth() == me->GetMaxHealth())
                    {
                        std::list<Player*> pl_list;
                        me->GetPlayerListInGrid(pl_list, 12.0f);

                        if (pl_list.empty())
                            return;

                        for (auto itr : pl_list)
                        {
                            itr->CastSpell(itr, SPELL_PURIFIED_RESIDUE);
                        }

                        health = true;
                    }
                }

                if (!me->isMoving())
                    if (Creature* immersius = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_IMMERSEUS)))
                        me->GetMotionMaster()->MovePoint(0, immersius->GetPositionX(), immersius->GetPositionY(), immersius->GetPositionZ());
            }

            private:
                InstanceScript* instance;
                bool reached = false;
                bool health = false;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new mob_contaminated_puddleAI(creature);
        }
};

// Sha pool - 71544
class mob_sha_pool : public CreatureScript
{
    public:
        mob_sha_pool() : CreatureScript("mob_sha_pool") { }

        struct mob_sha_poolAI : public ScriptedAI
        {
            mob_sha_poolAI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void Reset() override
            {
                me->setFaction(HOSTILE_FACTION);
                me->CastSpell(me, SPELL_SHA_POOL_AURA);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
                me->SetFlag(UNIT_FIELD_FLAGS2, UNIT_FLAG2_DISABLE_TURN);
                me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                events.ScheduleEvent(EVENT_SHA_POOL_DAMAGE, 1200);
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);

                while (uint8 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SHA_POOL_DAMAGE:
                        {
                            std::list<Player*> pl_list;
                            me->GetPlayerListInGrid(pl_list, 1.0f);
                            if (pl_list.empty())
                                return;

                            for (auto itr : pl_list)
                            {
                                DoCast(itr, SPELL_SHA_POOL_DAMAGE);
                            }

                            break;
                        }

                        default:
                            break;
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new mob_sha_poolAI(creature);
        }
};

// Swirl Target - 71550
class mob_swirl_target : public CreatureScript
{
    public:
        mob_swirl_target() : CreatureScript("mob_swirl_target") { }

        struct mob_swirl_targetAI : public ScriptedAI
        {
            mob_swirl_targetAI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void Reset() override
            {
                me->GetMotionMaster()->MovePoint(0, circleposition[1]);
                me->setFaction(HOSTILE_FACTION);

                me->SetSpeed(MOVE_RUN, 3.0f);
                me->SetReactState(REACT_PASSIVE);

                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);

                events.ScheduleEvent(EVENT_MOVE_ONE, 2000);
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);

                while (uint8 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_MOVE_ONE:
                        {
                            me->GetMotionMaster()->MovePoint(0, circleposition[2]);
                            events.ScheduleEvent(EVENT_MOVE_TWO, 2000);
                            break;
                        }

                        case EVENT_MOVE_TWO:
                        {
                            me->GetMotionMaster()->MovePoint(0, circleposition[3]);
                            events.ScheduleEvent(EVENT_MOVE_THREE, 2000);
                            break;
                        }

                        case EVENT_MOVE_THREE:
                        {
                            me->GetMotionMaster()->MovePoint(0, circleposition[4]);
                            events.ScheduleEvent(EVENT_MOVE_FOUR, 2000);
                            break;
                        }

                        case EVENT_MOVE_FOUR:
                        {
                            me->GetMotionMaster()->MovePoint(0, circleposition[5]);
                            break;
                        }

                        default:
                            break;
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new mob_swirl_targetAI(creature);
        }
};

// Swirl Zone - 71548
class mob_swirl_zone : public CreatureScript
{
    public:
        mob_swirl_zone() : CreatureScript("mob_swirl_zone") { }

        struct mob_swirl_zoneAI : public ScriptedAI
        {
            mob_swirl_zoneAI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void Reset() override
            {
                // TODO
            }

            void UpdateAI(uint32 diff) override
            {
                // TODO
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new mob_swirl_zoneAI(creature);
        }
};

// Tears of the Vale - 73638
class mob_tears_of_the_vale : public CreatureScript
{
    public:
        mob_tears_of_the_vale() : CreatureScript("mob_tears_of_the_vale") { }

        struct mob_tears_of_the_valeAI : public ScriptedAI
        {
            mob_tears_of_the_valeAI(Creature* creature) : ScriptedAI(creature)
            {

            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new mob_tears_of_the_valeAI(creature);
        }
};

// Seeping Sha - 143281
class spell_seeping_sha : public SpellScriptLoader
{
    public:
        spell_seeping_sha() : SpellScriptLoader("spell_seeping_sha") { }

        class spell_seeping_sha_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_seeping_sha_AuraScript);

            void OnUpdate(uint32 diff, AuraEffect* aurEff)
            {
                if (Unit* caster = GetCaster())
                {
                    std::list<Player*> pl_list;
                    caster->GetPlayerListInGrid(pl_list, 15.0f);
                    if (pl_list.empty())
                        return;

                    for (auto itr : pl_list)
                    {
                        caster->CastSpell(itr, SPELL_SEEPING_SHA_DAMAGE);
                    }
                }
            }

            void Register() override
            {
                OnEffectUpdate += AuraEffectUpdateFn(spell_seeping_sha_AuraScript::OnUpdate, EFFECT_1, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_seeping_sha_AuraScript();
        }
};

// Seeping Sha Damage - 143286
class spell_seeping_sha_damage : public SpellScriptLoader
{
    public:
        spell_seeping_sha_damage() : SpellScriptLoader("spell_seeping_sha_damage") { }

        class spell_seeping_sha_damage_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_seeping_sha_damage_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* target = GetTarget())
                    if (Aura* seepingSha = target->GetAura(SPELL_SEEPING_SHA_DAMAGE))
                        seepingSha->SetDuration(1);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_seeping_sha_damage_AuraScript::OnApply, EFFECT_2, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_seeping_sha_damage_AuraScript();
        }
};

// Split - 143020
class spell_split : public SpellScriptLoader
{
    public:
        spell_split() : SpellScriptLoader("spell_split") { }

        class spell_split_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_split_SpellScript);

            void HandleAfterCast()
            {
                if (Unit* caster = GetCaster())
                {
                    for (int i = 0; i <= MAX_PUDDLES; i++)
                    {
                        caster->CastSpell(caster, SPELL_SPLIT_SHA_PUDDLE);
                        caster->CastSpell(caster, SPELL_SPLIT_CONTAMINATED_PUDDLE);
                    }
                }
            }

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);

                if (!GetCaster())
                    return;
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_split_SpellScript::HandleAfterCast);
                OnEffectHitTarget += SpellEffectFn(spell_split_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_split_SpellScript();
        }

        class spell_split_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_split_AuraScript);

            void HandleDummy(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* target = GetTarget())
                    if (Aura* splitAura = target->GetAura(SPELL_SPLIT_DUMMY))
                        splitAura->SetDuration(500000);

                if (Unit* caster = GetCaster())
                    if (InstanceScript* pInstance = GetCaster()->GetInstanceScript())
                        if (Creature * immerseus = ObjectAccessor::GetCreature(*caster, pInstance->GetData64(DATA_IMMERSEUS)))
                            immerseus->SetDisplayId(11686);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_split_AuraScript::HandleDummy, EFFECT_2, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_split_AuraScript();
        }
};

// Swirl - 143309
class spell_swirl : public SpellScriptLoader
{
    public:
        spell_swirl() : SpellScriptLoader("spell_swirl") { }

        class spell_swirl_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_swirl_SpellScript);

            void HandleOnCast()
            {
                if (Unit* caster = GetCaster())
                {
                    caster->SummonCreature(CREATURE_SWIRL_TARGET, circleposition[0], TEMPSUMMON_MANUAL_DESPAWN);
                    //caster->CastSpell(caster, SPELL_SWIRL_VOID_ZONES);
                }
            }

            void Register() override
            {
                OnCast += SpellCastFn(spell_swirl_SpellScript::HandleOnCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_swirl_SpellScript();
        }

        class spell_swirl_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_swirl_AuraScript);

            void OnUpdate(uint32 diff, AuraEffect* /*aurEff*/)
            {
                if (Unit* caster = GetCaster())
                    if (InstanceScript* pInstance = GetCaster()->GetInstanceScript())
                        if (Creature * immerseus = ObjectAccessor::GetCreature(*caster, pInstance->GetData64(DATA_IMMERSEUS)))
                            if (immerseus->HasAura(SPELL_SWIRL_DUMMY))
                                if (Creature* swirlTarget = immerseus->FindNearestCreature(CREATURE_SWIRL_TARGET, 200.0f))
                                {
                                    immerseus->SetFacingToObject(swirlTarget);

                                    std::list<Player*> pl_list;
                                    immerseus->GetPlayerListInGrid(pl_list, 200.0f);
                                    if (pl_list.empty())
                                        return;

                                    for (auto itr : pl_list)
                                    {
                                        if (itr->IsWithinDistInMap(swirlTarget, 20.0f))
                                        {
                                            immerseus->CastSpell(itr, SPELL_SWIRL_DAMAGE, true);
                                        }
                                    }
                                }
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* caster = GetCaster())
                {
                    std::list<Creature*> swirlTarget;
                    caster->GetCreatureListWithEntryInGrid(swirlTarget, CREATURE_SWIRL_TARGET, 2000.0f);
                    if (swirlTarget.empty())
                        return;

                    for (auto itr : swirlTarget)
                    {
                        itr->DespawnOrUnsummon(0);
                    }
                }
            }

            void Register() override
            {
                OnEffectUpdate += AuraEffectUpdateFn(spell_swirl_AuraScript::OnUpdate, EFFECT_2, SPELL_AURA_DUMMY);
                OnEffectRemove += AuraEffectRemoveFn(spell_swirl_AuraScript::OnRemove, EFFECT_3, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_swirl_AuraScript();
        }
};

// Swirl Damage - 143412
class spell_swirl_damage : public SpellScriptLoader
{
    public:
        spell_swirl_damage() : SpellScriptLoader("spell_swirl_damage") { }

        class spell_swirl_damage_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_swirl_damage_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* target = GetTarget())
                    if (Aura* swirlDamage = target->GetAura(SPELL_SWIRL_DAMAGE))
                        swirlDamage->SetDuration(1);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_swirl_damage_AuraScript::OnApply, EFFECT_2, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_swirl_damage_AuraScript();
        }
};

// Sha Bolt Damage - 143293
class spell_sha_bolt_damage : public SpellScriptLoader
{
    public:
        spell_sha_bolt_damage() : SpellScriptLoader("spell_sha_bolt_damage") { }

        class spell_sha_bolt_damage_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_sha_bolt_damage_SpellScript);

            void HandleDamage(SpellEffIndex /*effIndex*/)
            {
                SetHitDamage(30000);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_sha_bolt_damage_SpellScript::HandleDamage, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_sha_bolt_damage_SpellScript();
        }
};

void AddSC_boss_Immerseus()
{
    // Boss
    new boss_immerseus();

    // Adds
    new mob_sha_puddle();
    new mob_contaminated_puddle();
    new mob_sha_pool();
    new mob_swirl_target();
    // new mob_swirl_zone();

    // Spells
    new spell_seeping_sha();
    new spell_seeping_sha_damage();
    new spell_split();
    new spell_swirl();
    new spell_swirl_damage();
    new spell_sha_bolt_damage();
}
