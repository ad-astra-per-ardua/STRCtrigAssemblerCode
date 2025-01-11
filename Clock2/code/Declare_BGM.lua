function Declare_BGM()
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

        IBGM_EPD(FP, {i}, BGMArray[i+1],{
            {1,"staredit\\wav\\hat1.ogg",25 * Fixedtime}
        })
    end
    
    IBGM_EPD(FP, {Force5}, OB_BGMArray, {
        {1,"staredit\\wav\\hat1.ogg",25 * Fixedtime}
    })
    

    TriggerX(FP, {Deaths(P6, AtLeast, 1, 131)},{
        RotatePlayer({DisplayTextX(StrDesignX("Hatchery Destroyed! + 30,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 30000,Kills);
            SetNVar(BGMArray[1], SetTo, 1);
            SetNVar(BGMArray[2], SetTo, 1);
            SetNVar(BGMArray[3], SetTo, 1);
            SetNVar(BGMArray[4], SetTo, 1);
            SetNVar(BGMArray[5], SetTo, 1);
            SetNVar(OB_BGMArray, SetTo, 1);
    },preserved)
end