function Enable_TestMode(f)

    if f == true
        then X = 1
    elseif f == false
        then X = 0
    end
    
    TriggerX(P1,{isname(P1,"AwakenSense")},{ -- Verifing name
        CreateUnit(12,80,"HealZone",CurrentPlayer);
        ModifyUnitHitPoints(All, "Men", P7, "Anywhere", 10),
        ModifyUnitShields(All, "Men", P7, "Anywhere", 1),
        SetMemoryB(0x58D2B0 + (0 * 46) + 7, SetTo, 200);
        SetResources(P1,SetTo,0xFFFFFF,Ore);
        SetCDeaths("X",SetTo,X,TestOn);
        CreateUnit(1, 128, "unlock1", P1),
        Wait(500);
        Order("Men", P7, "Anywhere", Move, "callArrival");

    })

    -- TriggerX(P1,{isname(P1,"marine_T_T")},{ -- Verifing name
    --     CreateUnit(12,80,"HealZone",CurrentPlayer);
    --     CreateUnit(100,1,"HealZone",CurrentPlayer);
    --     CreateUnit(1, 128, "unlock1", P1),
    --     SetResources(P1,SetTo,0xFFFFFF,Ore);
    --     Order("Men", P7, "Anywhere", Move, "callArrival");
    --     SetCDeaths("X",SetTo,X,TestOn);
    -- })
    end