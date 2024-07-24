function Install_BGMPhase()
Fixedtime = 1000
BGMArray = CreateVarArr(4,FP)
OB_BGMArray = CreateVar(FP)
    for i = 0, 3 do
        IBGM_EPD(FP, {i}, BGMArray[i+1], {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        {4, "staredit\\wav\\terran1.ogg", 31 * Fixedtime},
        {5, "staredit\\wav\\stargate.ogg", 31 * Fixedtime},
        {6, "staredit\\wav\\inf1.ogg", 31 * Fixedtime},
        {7, "staredit\\wav\\inf2.ogg", 31 * Fixedtime},
        })
    end
    IBGM_EPD(FP, {Force5}, OB_BGMArray, {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        {4, "staredit\\wav\\terran1.ogg", 31 * Fixedtime},
        {5, "staredit\\wav\\stargate.ogg", 31 * Fixedtime},
        {6, "staredit\\wav\\inf1.ogg", 31 * Fixedtime},
        {7, "staredit\\wav\\inf2.ogg", 31 * Fixedtime},
        })
    
    ----------- Hat BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 131)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hatchery Destroyed! + 30,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 30000,Kills);
            SetNVar(BGMArray[1], SetTo, 1);
            SetNVar(BGMArray[2], SetTo, 1);
            SetNVar(BGMArray[3], SetTo, 1);
            SetNVar(BGMArray[4], SetTo, 1);
            SetNVar(OB_BGMArray, SetTo, 1);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 131)})
    ---------- Lair BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 132)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Lair Destroyed! + 40,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 40000,Kills);
            SetNVar(BGMArray[1], SetTo, 2);
            SetNVar(BGMArray[2], SetTo, 2);
            SetNVar(BGMArray[3], SetTo, 2);
            SetNVar(BGMArray[4], SetTo, 2);
            SetNVar(OB_BGMArray, SetTo, 2);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 132)})
    ---------- Hive BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 133)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hive Destroyed! + 50,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 50000,Kills);
            SetNVar(BGMArray[1], SetTo, 3);
            SetNVar(BGMArray[2], SetTo, 3);
            SetNVar(BGMArray[3], SetTo, 3);
            SetNVar(BGMArray[4], SetTo, 3);
            SetNVar(OB_BGMArray, SetTo, 3);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 133)})
    ---------- Starport BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 114)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Starport Destroyed! + 75,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 75000,Kills);
            SetNVar(BGMArray[1], SetTo, 4);
            SetNVar(BGMArray[2], SetTo, 4);
            SetNVar(BGMArray[3], SetTo, 4);
            SetNVar(BGMArray[4], SetTo, 4);
            SetNVar(OB_BGMArray, SetTo, 4);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 114)})
    ---------- Stargate BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 167)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Stargate Destroyed! + 75,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 75000,Kills);
            SetNVar(BGMArray[1], SetTo, 5);
            SetNVar(BGMArray[2], SetTo, 5);
            SetNVar(BGMArray[3], SetTo, 5);
            SetNVar(BGMArray[4], SetTo, 5);
            SetNVar(OB_BGMArray, SetTo, 5);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 167)})
    ---------- Inf1 BGM ----------
    CIf(FP, {Deaths(P7, AtLeast, 1, 130)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("평행세계의\x11 무한한 \x07만개 \x11Eternal \x07Blossom \x04Destroyed! + 100,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 100000,Kills);
            SetNVar(BGMArray[1], SetTo, 6);
            SetNVar(BGMArray[2], SetTo, 6);
            SetNVar(BGMArray[3], SetTo, 6);
            SetNVar(BGMArray[4], SetTo, 6);
            SetNVar(OB_BGMArray, SetTo, 6);
        },preserved)
    CIfEnd({SetDeaths(P7, SetTo, 0, 130)})
    ---------- Inf2 BGM ----------
    CIf(FP, {Deaths(P7, AtLeast, 1, 106)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("평행세계의 \x08분개 \x17Fierceness \x04Destroyed! + 100,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 100000,Kills);
            SetNVar(BGMArray[1], SetTo, 7);
            SetNVar(BGMArray[2], SetTo, 7);
            SetNVar(BGMArray[3], SetTo, 7);
            SetNVar(BGMArray[4], SetTo, 7);
            SetNVar(OB_BGMArray, SetTo, 7);
        },preserved)
    CIfEnd({SetDeaths(P7, SetTo, 0, 106)})
end