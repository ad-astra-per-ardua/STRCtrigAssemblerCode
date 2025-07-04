function Basement_functions()

    InitHPV = CreateVar(FP)

    healzone,DelayMedic = CreateCcodes(2)

    GProperties = CreateWars(1, FP)

    Combine_marine = CreateCcode()
    P_Count = CreateNcode()
    Difficulty = CreateCcode()
    GiveRate = CreateNcode()
    DebuffFlag = CreateCcode()
    DebuffTimer = CreateCcode()
    GeneratePlotControl = CreateVar(FP)

    DelayTimer = CreateCcode()
    DoActions(FP, {SubCD(DelayTimer, 1)}, preserved)

    function SetDelay(Code, Value)
        TriggerX(FP, {Always()}, {SetCD(Code, Value)});
        DoActionsX(FP, {SubCD(Code, 1)},preserved);
    end

    function SetDelayLoop(Code, Value)
        TriggerX(FP, {Always()}, {SetCD(Code, Value)});
        DoActionsX(FP, {SubCD(Code, 1)},preserved);
        TriggerX(FP, {CD2(Code,1,Exactly)}, {SetCD(Code, Value)}, preserved)
    end

    --- For clock fuctions ---
    mintemp,hourtemp,mainclockmin = CreateVars(3,FP)
    HDiv,MDiv,mainclockHour,showmainmin,MMDiv,FDiv, finMainclock, mainclockCycled = CreateVars(8,FP)

    --- For Main Clock Variable and Converting 
    
    

    ----------- For Main Gunplot Variable ------
    
    GPosX, GPosY, Gun_LoopLimit, Gun_DataIndex, Gun_Shape, Gun_Unit, Gun_Player, ShapeNum, LoopDots,EftFlag,Putty = CreateVars(11,FP)
    UV = CreateVarArr(16)
    ShapeVar = CreateVarArr(12)
    RetX, RetY, CalcRetX, CalcRetY, Common_UType, Gun_Unit = CreateVars(6,FP)



end