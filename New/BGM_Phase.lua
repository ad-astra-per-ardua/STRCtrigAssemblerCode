function Install_BGMPhase()
    Fixedtime = 1000
    BGMArray = CreateVarArr(5,FP)
    OB_BGMArray = CreateVar(FP)
        for i = 0, 4 do
    
            TriggerX(FP,{
                    LocalPlayerID(i);
                    Void(i+1,Exactly,1);
                },{
                    SetNVar(BGMArray[i+1],SetTo,0);
                },{Preserved})
    
            IBGM_EPD(FP, {i}, BGMArray[i+1], {
            {1, "staredit\\wav\\INTROEASY.ogg", 60 * Fixedtime},
            {2, "staredit\\wav\\INTROHELL.ogg", 116 * Fixedtime},
            {3, "staredit\\wav\\HATCH.ogg", 25 * Fixedtime},
            {4, "staredit\\wav\\LAIR.ogg", 25 * Fixedtime},

            })
        end
        IBGM_EPD(FP, {Force5}, OB_BGMArray, {
            {1, "staredit\\wav\\INTROEASY.ogg", 60 * Fixedtime},
            {2, "staredit\\wav\\INTROHELL.ogg", 116 * Fixedtime},
            {3, "staredit\\wav\\HATCH.ogg", 25 * Fixedtime},
            {4, "staredit\\wav\\LAIR.ogg", 25 * Fixedtime},
            })

    -- CIf(FP, {CDeaths(FP, AtLeast, 1, OpeningBGM), CDeaths(FP, Exactly, 1, Difficulty)})
    --     TriggerX(FP,{},{
    --         SetNVar(BGMArray[1], SetTo, 1);
    --         SetNVar(BGMArray[2], SetTo, 1);
    --         SetNVar(BGMArray[3], SetTo, 1);
    --         SetNVar(BGMArray[4], SetTo, 1);
    --         SetNVar(BGMArray[5], SetTo, 1);
    --         SetNVar(OB_BGMArray, SetTo, 1);
    --     })
    -- CIfEnd()

    CIf(FP, {CDeaths(FP, AtLeast, 1, OpeningBGM), CDeaths(FP, Exactly, 2, Difficulty)})
        TriggerX(FP,{},{
            SetNVar(BGMArray[1], SetTo, 2);
            SetNVar(BGMArray[2], SetTo, 2);
            SetNVar(BGMArray[3], SetTo, 2);
            SetNVar(BGMArray[4], SetTo, 2);
            SetNVar(BGMArray[5], SetTo, 2);
            SetNVar(OB_BGMArray, SetTo, 2);
        })
    CIfEnd()
        
    CIf(FP, {Deaths(FP, AtLeast, 1, 131)})
    TriggerX(FP,{},{
        SetNVar(BGMArray[1], SetTo, 3);
        SetNVar(BGMArray[2], SetTo, 3);
        SetNVar(BGMArray[3], SetTo, 3);
        SetNVar(BGMArray[4], SetTo, 3);
        SetNVar(BGMArray[5], SetTo, 3);
        SetNVar(OB_BGMArray, SetTo, 3);
    },preserved)
    CIfEnd(SetDeaths(FP, SetTo, 0, 131))

    CIf(FP, {Deaths(FP, AtLeast, 1, 132)})
    TriggerX(FP,{},{
        SetNVar(BGMArray[1], SetTo, 4);
        SetNVar(BGMArray[2], SetTo, 4);
        SetNVar(BGMArray[3], SetTo, 4);
        SetNVar(BGMArray[4], SetTo, 4);
        SetNVar(BGMArray[5], SetTo, 4);
        SetNVar(OB_BGMArray, SetTo, 4);
    },preserved)
    CIfEnd(SetDeaths(FP, SetTo, 0, 132))

    
    end