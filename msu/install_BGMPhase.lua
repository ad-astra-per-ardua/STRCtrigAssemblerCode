function Install_BGMPhase()
Fixedtime = 1000
BGMArray = CreateVarArr(4,FP)
OB_BGMArray = CreateVar(FP)
    for i = 0, 3 do
        IBGM_EPD(FP, {i}, BGMArray[i+1], {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        })
    end
    IBGM_EPD(FP, {Force5}, OB_BGMArray, {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        })
    
    
    
    CIf(FP, {Deaths(P6, AtLeast, 1, 131)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hatchery Destroyed! + 30,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 30000,Kills);
            SetNVar(BGMArray[1], SetTo, 1);
            SetNVar(BGMArray[2], SetTo, 1);
            SetNVar(BGMArray[3], SetTo, 1);
            SetNVar(BGMArray[4], SetTo, 1);
            SetNVar(OB_BGMArray, SetTo, 1);
            SetDeaths(P6, SetTo, 0, 131);
        })
    CIfEnd()
end