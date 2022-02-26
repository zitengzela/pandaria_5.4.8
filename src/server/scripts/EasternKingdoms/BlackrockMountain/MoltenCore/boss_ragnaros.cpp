/*
* This file is part of the Pandaria 5.4.8 Project. See THANKS file for Copyright information
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

/* ScriptData
SDName: Boss_Ragnaros
SD%Complete: 95
SDComment: some spells doesnt work correctly
SDCategory: Molten Core
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "molten_core.h"

enum Texts
{
    SAY_SUMMON_MAJ              = 0,
    SAY_ARRIVAL1_RAG            = 1,
    SAY_ARRIVAL2_MAJ            = 2,
    SAY_ARRIVAL3_RAG            = 3,
    SAY_ARRIVAL5_RAG            = 4,
    SAY_REINFORCEMENTS1         = 5,
    SAY_REINFORCEMENTS2         = 6,
    SAY_HAND                    = 7,
    SAY_WRATH                   = 8,
    SAY_KILL                    = 9,
    SAY_MAGMABURST              = 10,

    // Majordomo
    SAY_INTRO                   = 0,
    SAY_SPECIAL_1,
    SAY_SPECIAL_2,
    SAY_SPECIAL_3,
};

enum Spells
{
    SPELL_HAND_OF_RAGNAROS      = 19780,
    SPELL_WRATH_OF_RAGNAROS     = 20566,
    SPELL_LAVA_BURST            = 21158,
    SPELL_MAGMA_BLAST           = 20565,                   // Ranged attack
    SPELL_SONS_OF_FLAME_DUMMY   = 21108,                   // Server side effect
    SPELL_RAGSUBMERGE           = 21107,                   // Stealth aura
    SPELL_RAGEMERGE             = 20568,
    SPELL_MELT_WEAPON           = 21388,
    SPELL_ELEMENTAL_FIRE        = 20564,
    SPELL_ERRUPTION             = 17731,
    SPELL_SUMMON_RAGNAROS       = 19774,
};

enum Events
{
    EVENT_ERUPTION              = 1,
    EVENT_WRATH_OF_RAGNAROS     = 2,
    EVENT_HAND_OF_RAGNAROS      = 3,
    EVENT_LAVA_BURST            = 4,
    EVENT_ELEMENTAL_FIRE        = 5,
    EVENT_MAGMA_BLAST           = 6,
    EVENT_SUBMERGE              = 7,

    EVENT_INTRO_1               = 8,
    EVENT_INTRO_2               = 9,
    EVENT_INTRO_3               = 10,
    EVENT_INTRO_4               = 11,
    EVENT_INTRO_5               = 12
};

class boss_ragnaros : public CreatureScript
{
    public:
        boss_ragnaros() : CreatureScript("boss_ragnaros") { }

        struct boss_ragnarosAI : public BossAI
        {
            boss_ragnarosAI(Creature* creature) : BossAI(creature, BOSS_RAGNAROS)
            {
                _introState = 0;
                me->SetReactState(REACT_PASSIVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }

            void Reset() override
            {
                BossAI::Reset();
                _emergeTimer = 90000;
                _hasYelledMagmaBurst = false;
                _hasSubmergedOnce = false;
                _isBanished = false;
                me->HandleEmoteStateCommand(0);
            }

            void EnterCombat(Unit* victim) override
            {
                BossAI::EnterCombat(victim);
                events.ScheduleEvent(EVENT_ERUPTION, 15000);
                events.ScheduleEvent(EVENT_WRATH_OF_RAGNAROS, 30000);
                events.ScheduleEvent(EVENT_HAND_OF_RAGNAROS, 25000);
                events.ScheduleEvent(EVENT_LAVA_BURST, 10000);
                events.ScheduleEvent(EVENT_ELEMENTAL_FIRE, 3000);
                events.ScheduleEvent(EVENT_MAGMA_BLAST, 2000);
                events.ScheduleEvent(EVENT_SUBMERGE, 180000);
            }

            void KilledUnit(Unit* /*victim*/) override
            {
                if (urand(0, 99) < 25)
                    Talk(SAY_KILL);
            }

            void UpdateAI(uint32 diff) override
            {
                if (_introState != 2)
                {
                    if (!_introState)
                    {
                        me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);
                        events.ScheduleEvent(EVENT_INTRO_1, 4000);
                        events.ScheduleEvent(EVENT_INTRO_2, 23000);
                        events.ScheduleEvent(EVENT_INTRO_3, 42000);
                        events.ScheduleEvent(EVENT_INTRO_4, 43000);
                        events.ScheduleEvent(EVENT_INTRO_5, 53000);
                        _introState = 1;
                    }

                    events.Update(diff);

                    while (uint32 eventId = events.ExecuteEvent())
                    {
                        switch (eventId)
                        {
                        case EVENT_INTRO_1:
                            Talk(SAY_ARRIVAL1_RAG);
                            break;
                        case EVENT_INTRO_2:
                            Talk(SAY_ARRIVAL3_RAG);
                            break;
                        case EVENT_INTRO_3:
                            me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                            break;
                        case EVENT_INTRO_4:
                            Talk(SAY_ARRIVAL5_RAG);
                            if (instance)
                                if (Creature* executus = Unit::GetCreature(*me, instance->GetData64(BOSS_MAJORDOMO_EXECUTUS)))
                                    me->Kill(executus);
                            break;
                        case EVENT_INTRO_5:
                            me->SetReactState(REACT_AGGRESSIVE);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            _introState = 2;
                            break;
                        default:
                            break;
                        }
                    }
                }
                else
                {
                    if (instance)
                    {
                        if (_isBanished && ((_emergeTimer <= diff) || (instance->GetData(DATA_RAGNAROS_ADDS)) > 8))
                        {
                            //Become unbanished again
                            me->SetReactState(REACT_AGGRESSIVE);
                            me->setFaction(14);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            me->HandleEmoteStateCommand(0);
                            me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                AttackStart(target);
                            instance->SetData(DATA_RAGNAROS_ADDS, 0);

                            //DoCast(me, SPELL_RAGEMERGE); //"phase spells" didnt worked correctly so Ive commented them and wrote solution witch doesnt need core support
                            _isBanished = false;
                        }
                        else if (_isBanished)
                        {
                            _emergeTimer -= diff;
                            //Do nothing while banished
                            return;
                        }
                    }

                    //Return since we have no target
                    if (!UpdateVictim())
                        return;

                    events.Update(diff);

                    while (uint32 eventId = events.ExecuteEvent())
                    {
                        switch (eventId)
                        {
                            case EVENT_ERUPTION:
                                DoCastVictim(SPELL_ERRUPTION);
                                events.ScheduleEvent(EVENT_ERUPTION, urand(20000, 45000));
                                break;
                            case EVENT_WRATH_OF_RAGNAROS:
                                DoCastVictim(SPELL_WRATH_OF_RAGNAROS);
                                if (urand(0, 1))
                                    Talk(SAY_WRATH);
                                events.ScheduleEvent(EVENT_WRATH_OF_RAGNAROS, 25000);
                                break;
                            case EVENT_HAND_OF_RAGNAROS:
                                DoCast(me, SPELL_HAND_OF_RAGNAROS);
                                if (urand(0, 1))
                                    Talk(SAY_HAND);
                                events.ScheduleEvent(EVENT_HAND_OF_RAGNAROS, 20000);
                                break;
                            case EVENT_LAVA_BURST:
                                DoCastVictim(SPELL_LAVA_BURST);
                                events.ScheduleEvent(EVENT_LAVA_BURST, 10000);
                                break;
                            case EVENT_ELEMENTAL_FIRE:
                                DoCastVictim(SPELL_ELEMENTAL_FIRE);
                                events.ScheduleEvent(EVENT_ELEMENTAL_FIRE, urand(10000, 14000));
                                break;
                            case EVENT_MAGMA_BLAST:
                                if (me->IsWithinMeleeRange(me->GetVictim()))
                                {
                                    DoCastVictim(SPELL_MAGMA_BLAST);
                                    if (!_hasYelledMagmaBurst)
                                    {
                                        //Say our dialog
                                        Talk(SAY_MAGMABURST);
                                        _hasYelledMagmaBurst = true;
                                    }
                                }
                                events.ScheduleEvent(EVENT_MAGMA_BLAST, 2500);
                                break;
                            case EVENT_SUBMERGE:
                            {
                                if (instance && !_isBanished)
                                {
                                    //Creature spawning and ragnaros becomming unattackable
                                    //is not very well supported in the core //no it really isnt
                                    //so added normaly spawning and banish workaround and attack again after 90 secs.
                                    me->AttackStop();
                                    DoResetThreat();
                                    me->SetReactState(REACT_PASSIVE);
                                    me->InterruptNonMeleeSpells(false);
                                    //Root self
                                    //DoCast(me, 23973);
                                    me->setFaction(35);
                                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                                    me->HandleEmoteStateCommand(EMOTE_STATE_SUBMERGED);
                                    me->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);
                                    instance->SetData(DATA_RAGNAROS_ADDS, 0);

                                    if (!_hasSubmergedOnce)
                                    {
                                        Talk(SAY_REINFORCEMENTS1);

                                        // summon 8 elementals
                                        for (uint8 i = 0; i < 8; ++i)
                                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                                if (Creature* summoned = me->SummonCreature(12143, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 900000))
                                                    summoned->AI()->AttackStart(target);

                                        _hasSubmergedOnce = true;
                                        _isBanished = true;
                                        //DoCast(me, SPELL_RAGSUBMERGE);
                                        _emergeTimer = 90000;

                                    }
                                    else
                                    {
                                        Talk(SAY_REINFORCEMENTS2);

                                        for (uint8 i = 0; i < 8; ++i)
                                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                                if (Creature* summoned = me->SummonCreature(12143, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 900000))
                                                    summoned->AI()->AttackStart(target);

                                        _isBanished = true;
                                        //DoCast(me, SPELL_RAGSUBMERGE);
                                        _emergeTimer = 90000;
                                    }
                                }
                                events.ScheduleEvent(EVENT_SUBMERGE, 180000);
                                break;
                            }
                            default:
                                break;
                        }
                    }

                    DoMeleeAttackIfReady();
                }
            }

        private:
            uint32 _emergeTimer;
            uint8 _introState;
            bool _hasYelledMagmaBurst;
            bool _hasSubmergedOnce;
            bool _isBanished;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_ragnarosAI(creature);
        }
};

class npc_son_of_flame : public CreatureScript
{
    public:
        npc_son_of_flame() : CreatureScript("npc_SonOfFlame") { }

        struct npc_son_of_flameAI : public ScriptedAI //didnt work correctly in EAI for me...
        {
            npc_son_of_flameAI(Creature* creature) : ScriptedAI(creature)
            {
                instance = me->GetInstanceScript();
            }

            void JustDied(Unit* /*killer*/) override
            {
                if (instance)
                    instance->SetData(DATA_RAGNAROS_ADDS, 1);
            }

            void UpdateAI(uint32 /*diff*/) override
            {
                if (!UpdateVictim())
                    return;

                DoMeleeAttackIfReady();
            }

        private:
            InstanceScript* instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_son_of_flameAI(creature);
        }
};

// Majordomo Executus Ragnaros 54404
class npc_majordomo_executus_ragnaros : public CreatureScript
{
    public:
        npc_majordomo_executus_ragnaros() : CreatureScript("npc_majordomo_executus_ragnaros") { }

        bool OnGossipHello(Player* player, Creature* creature) override
        {
            player->ADD_GOSSIP_ITEM_DB(player->GetDefaultGossipMenuForSource(creature), 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
        {
            player->PlayerTalkClass->ClearMenus();

            if (action == GOSSIP_ACTION_INFO_DEF + 1)
            {
                creature->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                creature->AI()->Talk(SAY_INTRO, player);

                uint32 delay = 0;

                creature->m_Events.Schedule(delay += 1000, 1, [creature]()
                {
                    creature->AI()->Talk(SAY_SPECIAL_1);
                    creature->CastSpell(creature, SPELL_SUMMON_RAGNAROS, false);

                    Movement::MoveSplineInit init(creature);
                    for (auto itr : ExecutusPath)
                        init.Path().push_back(G3D::Vector3(itr.GetPositionX(), itr.GetPositionY(), itr.GetPositionZ()));

                    init.SetWalk(true);
                    init.Launch();
                });

                creature->m_Events.Schedule(delay += 14000, 2, [creature]()
                {
                    creature->SetFacingTo(Position::NormalizeOrientation(creature->GetOrientation() + M_PI / 2));
                    creature->AI()->Talk(SAY_SPECIAL_2);
                });

                creature->m_Events.Schedule(delay += 25000, 3, [creature]()
                {
                    creature->AI()->Talk(SAY_SPECIAL_3);
                });
            }

            player->CLOSE_GOSSIP_MENU();

            return true;
        }

        struct npc_majordomo_executus_ragnarosAI : public ScriptedAI
        {
            npc_majordomo_executus_ragnarosAI(Creature* creature) : ScriptedAI(creature) { }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_majordomo_executus_ragnarosAI(creature);
        }
};

// Summon Ragnaros 19774
class spell_summon_ragnaros : public SpellScript
{
    PrepareSpellScript(spell_summon_ragnaros);

    void HandleAfterCast()
    {
        if (Unit* caster = GetCaster())
            caster->SummonCreature(NPC_RAGNAROS, RagnarosSummonPos, TEMPSUMMON_MANUAL_DESPAWN);
    }

    void Register() override
    {
        AfterCast += SpellCastFn(spell_summon_ragnaros::HandleAfterCast);
    }
};

void AddSC_boss_ragnaros()
{
    new boss_ragnaros();
    new npc_son_of_flame();
    new npc_majordomo_executus_ragnaros();
    new spell_script<spell_summon_ragnaros>("spell_summon_ragnaros");
}
