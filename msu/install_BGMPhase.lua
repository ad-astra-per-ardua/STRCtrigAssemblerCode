function Install_BGMPhase()
Fixedtime = 1000
BGMVar = CreateVarArr(4,FP)
OB_BGMVar = CreateVar(FP)
    for i = 0, 3 do
        IBGM_EPD(FP, {i}, BGMVar[i+1], {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        })
    end
    IBGM_EPD(FP, {Force5}, OB_BGMVar, {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        })
    
    
    
    CIf(FP, {Deaths(P6, AtLeast, 1, 131)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hatchery Destroyed! + 30,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 30000,Kills);
            SetNVar(BGMVar[1], SetTo, 1);
            SetNVar(BGMVar[2], SetTo, 1);
            SetNVar(BGMVar[3], SetTo, 1);
            SetNVar(BGMVar[4], SetTo, 1);
            SetNVar(OB_BGMVar, SetTo, 1);
            SetDeaths(P6, SetTo, 0, 131);
        })
    CIfEnd()
end