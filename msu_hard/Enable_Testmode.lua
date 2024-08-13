function Enable_TestMode(f)

    if f == true
        then X = 1
    elseif f == false
        then X = 0
    end
    
    TriggerX(P1,{isname(P1,"AwakenSense")},{ -- Verifing name
        CreateUnit(12,80,"HealZone",CurrentPlayer);
        -- Order("Men", P7, "Anywhere", Move, "callArrival");
        -- CreateUnit(1, 128, "unlock1", P1),
        SetResources(P1,SetTo,0xFFFFFF,Ore);
        SetCDeaths("X",SetTo,X,TestOn);
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