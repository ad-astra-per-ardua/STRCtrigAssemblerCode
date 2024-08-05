function Enable_TestMode(f)

    if f == true
        then X = 1
    elseif f == false
        then X = 0
    end
    
    TriggerX(P1,{isname(P1,"AwakenSense")},{ -- Verifing name
        CreateUnit(100,1,"HealZone",CurrentPlayer);
        CreateUnit(1,158,"HealZone",CurrentPlayer);
        SetResources(P1,SetTo,0xFFFFFF,Ore);
        SetCDeaths("X",SetTo,X,TestOn);
    })
    end