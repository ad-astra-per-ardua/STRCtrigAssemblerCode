function Clock_setting()
    
    tempv = CreateCcode()
    mainMinute = CSMakeLine(1, 12, 0, 9, 1)
    mainHour = CSMakeLine(1, 12, 0, 6, 1)
    DoActions(FP, {SetV(HDiv, 30, SetTo), SetV(MDiv, 360, SetTo),SetV(MMDiv, 6, SetTo)})

    function mainminuteCAfunc1()
        local CA = CAPlotDataArr
        local CB = CAPlotCreateArr
        local PlayerID = CAPlotPlayerID
        CA_Rotate(mainclockmin);
    end
    function mainhourCAfunc1()
        local CA = CAPlotDataArr
        local CB = CAPlotCreateArr
        local PlayerID = CAPlotPlayerID
        CA_Rotate(mainclockHour)
    end

        -- Middle Boss Appear + Time stopping trigger Should be here -- 

        

        TriggerX(Force2, {Deaths(Force2, AtLeast, 1, 131)}, {AddV(mintemp, 180),AddCD(tempv, 1)}, preserved)
        TriggerX(Force2, {Deaths(Force2, AtLeast, 1, 132)}, {AddV(mintemp, 120),AddCD(tempv, 1)}, preserved)
        TriggerX(Force2, {Deaths(Force2, AtLeast, 1, 133)}, {AddV(mintemp, 270),AddCD(tempv, 1)}, preserved)

        f_Div(FP, hourtemp, mintemp, MDiv)
        f_Mod(FP, mainclockmin, mintemp, MDiv)
        f_Mul(FP, mainclockHour, hourtemp, HDiv)
        f_Div(FP, showmainmin, mainclockmin, MMDiv)

        -- DoActions(Force2, {
        --     SetDeaths(Force2, SetTo, 0, 131);
        --     SetDeaths(Force2, SetTo, 0, 132);
        --     SetDeaths(Force2, SetTo, 0, 133);
        -- }, preserved)

        -- initial clock setup
        CIfOnce(Force2, Always())

        CAPlot(mainHour, P6, 211, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {Always()},nil, nil);
        CAPlot(mainHour, P6, 213, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {Always()},nil, nil);
        CAPlot(mainMinute, P6, 212, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {Always()},nil, nil);
        CIfEnd()

        CIf(Force2, {CDeaths(FP, AtLeast, 1, tempv)})
        TriggerX(FP, Always(), {
        RemoveUnitAt(All, 211, "home", P6);
        RemoveUnitAt(All, 212, "home", P6);
    }, preserved)
        
        CAPlot(mainHour, P6, 211, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainhourCAfunc1", FP, {Always()},nil, 1);
        CAPlot(mainHour, P6, 213, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainhourCAfunc1", FP, {Always()},nil, 1);
        CAPlot(mainMinute, P6, 212, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainminuteCAfunc1", FP, {Always()},nil, 1);
        CIfEnd()
        DoActions(FP, {SetCD(tempv, 0)}, preserved)
    DisplayPrintEr(P1, {"Total minute : ", mintemp, " Clock's Minute Value : ", showmainmin," Hour Value : ", hourtemp})


end