function Declare_BGM()
    Fixedtime = 1000
    BGMArray = CreateVarArr(4,FP)
    OB_BGMArray = CreateVar(FP)

    for i = 0, 4 do
        TriggerX(FP,{
            LocalPlayerID(i);
            Void(i+1,Exactly,1);
        },{
            SetNVar(BGMArray[i+1],SetTo,0);
        },{Preserved})

        IBGM_EPD(FP, {i}, BGMArray[i+1],{

        })
    end
    
    IBGM_EPD(FP, {Force5}, OB_BGMArray, {

    })
    
end