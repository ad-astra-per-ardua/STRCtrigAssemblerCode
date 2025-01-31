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
            {1,"staredit\\wav\\hat1.ogg",25 * Fixedtime},
            {2,"staredit\\wav\\duskHat2.ogg",20 * Fixedtime},
            {3,"staredit\\wav\\duskLair1.ogg",25 * Fixedtime},
            {4,"staredit\\wav\\dataerror.ogg",20 * Fixedtime},
        })
    end
    
    IBGM_EPD(FP, {Force5}, OB_BGMArray, {
        {1,"staredit\\wav\\hat1.ogg",25 * Fixedtime},
        {2,"staredit\\wav\\duskHat2.ogg",20 * Fixedtime},
        {3,"staredit\\wav\\duskLair1.ogg",25 * Fixedtime},
        {4,"staredit\\wav\\dataerror.ogg",20 * Fixedtime},
    })
    


end