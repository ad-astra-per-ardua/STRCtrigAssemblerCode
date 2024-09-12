function Initial_Setup()

    DoActions(FP, {RemoveUnit("Men", P12),RemoveUnit(111, P12),RemoveUnit(107, P12)}, preserved)
    DoActions(Force2, {SetResources(Force2, SetTo, 9999999, OreAndGas),SetAllianceStatus(Force2, Ally),SetAllianceStatus(Force1, Enemy),
    RunAIScript('Turn ON Shared Vision for Player 1'),
    RunAIScript('Turn ON Shared Vision for Player 2'),
    RunAIScript('Turn ON Shared Vision for Player 3'),
    RunAIScript('Turn ON Shared Vision for Player 4')},preserved)
    DoActions(P1, {
        ModifyUnitHitPoints(All, "Men", P1, "Anywhere", 100),
        ModifyUnitShields(All, "Men", P1, "Anywhere", 100)
    }, preserved)


    CIfX(Force2, CDeathsX(FP, Exactly, 1, Difficulty)) -- Normal diff case
    TriggerX(FP, Always(), {SetCD(OpeningBGM, 1)})




    CElseX() -- Hell diff case
    TriggerX(FP, Always(), {SetCD(OpeningBGM, 1), AddCD(OpeningEft, 1)},preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, (49 * SDspeed) - 10, OpeningEft), CDeaths(FP, AtMost, 50 * SDspeed, OpeningEft), Memory(0x657A9C, AtMost, 2)}, {SetMemoryBA(0x657A9C, Subtract, 1)}, preserved)

    TriggerX(FP, {CDeaths(FP, AtLeast, 50 * SDspeed + 1, OpeningEft)}, {
        SetMemoryBA(0x657A9C, SetTo, 31);
        SetMinimapColor(7, SetTo, 178);
        SetPlayerColor(7, SetTo, 0)
    })

    
    CIfXEnd()

end