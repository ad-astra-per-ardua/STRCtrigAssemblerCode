function Clock_setting()
    
    TimeModSignal = CreateCcode()
    mainMinute = CSMakeLine(1, 6, 0, 18, 1)
    mainHour = CSMakeLine(1, 6, 0, 8, 1)
    DoActions(FP, {SetV(HDiv, 30, SetTo), SetV(MDiv, 360, SetTo),SetV(MMDiv, 6, SetTo),SetV(FDiv, 12, SetTo)})
    
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

        

        TriggerX(Force2, {Deaths(Force2, AtLeast, 1, 131)}, {AddV(mintemp, 180),AddCD(TimeModSignal, 1)}, preserved)
        TriggerX(Force2, {Deaths(Force2, AtLeast, 1, 132)}, {AddV(mintemp, 120),AddCD(TimeModSignal, 1)}, preserved)
        TriggerX(Force2, {Deaths(Force2, AtLeast, 1, 133)}, {AddV(mintemp, 270),AddCD(TimeModSignal, 1)}, preserved)

        f_Div(FP, hourtemp, mintemp, MDiv)
        f_Mod(FP, mainclockmin, mintemp, MDiv)
        f_Mul(FP, mainclockHour, hourtemp, HDiv)
        f_Div(FP, showmainmin, mainclockmin, MMDiv)

        f_Mod(FP, finMainclock, hourtemp, FDiv)
        f_Div(FP, mainclockCycled, hourtemp, FDiv)

        -- DoActions(Force2, {
        --     SetDeaths(Force2, SetTo, 0, 131);
        --     SetDeaths(Force2, SetTo, 0, 132);
        --     SetDeaths(Force2, SetTo, 0, 133);
        -- }, preserved)

        -- initial clock setup
        CIfOnce(Force2, Always())

            CAPlot(mainHour, P6, 211, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {Always()},nil, nil);
            CAPlot(mainMinute, P6, 212, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {Always()},nil, nil);
        CIfEnd()

        CIf(Force2, {CDeaths(FP, AtLeast, 1, TimeModSignal),Memory(0x628438, AtLeast, 1)})
            TriggerX(FP, Always(), {
            RemoveUnitAt(All, 211, "home", P6);
            RemoveUnitAt(All, 212, "home", P6);
        }, preserved)
            DoActions(FP, {SetImageScript(213, 131)})
            CAPlot(mainHour, P6, 211, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainhourCAfunc1", FP, {Always()},nil, 1);
            CAPlot(mainMinute, P6, 212, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainminuteCAfunc1", FP, {Always()},nil, 1);
            DoActions(FP, {SetImageScript(213, 142)})
        CIfEnd()
        DoActions(FP, {SetCD(TimeModSignal, 0)}, preserved)
    DisplayPrintEr(P1, {"Total minute : ", mintemp, " | Clock's Minute Value : ", showmainmin," | Hour Value : ", finMainclock," | Hour Cycled Executed : ", mainclockCycled})


end