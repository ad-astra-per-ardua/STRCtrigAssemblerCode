function Clock_setting()
    
    tempv = CreateCcode()
    mainMinute = CSMakeLine(1, 12, 0, 9, 1)
    mainHour = CSMakeLine(1, 12, 45, 6, 1)

    function mainminuteCAfunc1()
        local CA = CAPlotDataArr
        local CB = CAPlotCreateArr
        local PlayerID = CAPlotPlayerID
        CA_Rotate(mintemp)
    end

        
        DoActions(FP, {AddCD(tempv, 1)}, preserved);
        CAPlot(mainHour, P6, 211, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {CDeaths(FP, Exactly, 1, tempv)},nil, 1);
        CAPlot(mainHour, P6, 213, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, {CDeaths(FP, Exactly, 1, tempv)},nil, 1);
        CAPlot(mainMinute, P6, 212, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainminuteCAfunc1", FP, {CDeaths(FP, Exactly, 1, tempv)},nil, 1);
        CIf(FP, {CDeaths(FP, AtLeast, 340, tempv)})
        TriggerX(FP, Always(), {AddV(mintemp, 10)}, preserved)
        TriggerX(FP, Always(), {
            RemoveUnitAt(All, 211, "home", P6);
            RemoveUnitAt(All, 212, "home", P6);
        }, preserved)
        CAPlot(mainHour, P6, 211, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, nil, FP, Always(), nil,1);
        CAPlot(mainMinute, P6, 212, "mainclock", nil, 1, 32, {1,0,0,0,600,0}, "mainminuteCAfunc1", FP, Always(), nil,1);
        
        CIfEnd()
        TriggerX(FP, {CDeaths(FP, AtLeast, 340, tempv)}, {SetCD(tempv, 1)}, preserved);

    DisplayPrintEr(P1, {"Minute value : ", mintemp})
end