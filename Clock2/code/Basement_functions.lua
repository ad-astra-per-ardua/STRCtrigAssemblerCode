function Basement_functions()
    healzone,DelayMedic = CreateCcodes(2)
    Combine_marine = CreateCcode()
    P_Count = CreateNcode()
    Difficulty = CreateCcode()
    GiveRate = CreateNcode()
    --- For clock fuctions ---
    mintemp,hourtemp,mainclockmin = CreateVars(3,FP)
    HDiv,MDiv,mainclockHour,showmainmin,MMDiv = CreateVars(5,FP)

    --- For Main Clock Variable and Converting 
    
    

    ----------- For Main Gunplot Variable ------
    
    GPosX, GPosY, Gun_LoopLimit, Gun_DataIndex, Gun_Shape, Gun_Unit, Gun_Player, ShapeNum, LoopDots = CreateVars(9,FP)
    UV = CreateVarArr(16)
    ShapeVar = CreateVarArr(12)
    RetX, RetY, CalcRetX, CalcRetY, Common_UType, Gun_Unit = CreateVars(6,FP)



end