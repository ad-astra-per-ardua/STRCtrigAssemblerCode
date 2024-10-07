function Enable_TestMode(f)

    if f == true
        then X = 1
    elseif f == false
        then X = 0
    end
    
    TriggerX(P1,{isname(P1,"AwakenSense")},{ -- Verifing name
        RotatePlayer({
            DisplayTextX("TestMode Enabled, Hero Recall Activated.", 4)
        }, {Force1,Force5}, P1),
        CreateUnit(12,80,"HealZone",CurrentPlayer);
        DoActions(FP, {
            ModifyUnitHitPoints(All, "Men", P1, "Anywhere", 100);
        }, preserved),
        
        SetMemoryB(0x58D2B0 + (0 * 46) + 7, SetTo, 200);
        SetResources(P1,SetTo,0xFFFFFF,Ore);
        SetCDeaths("X",SetTo,X,TestOn);
        CreateUnit(1, 128, "unlock1", P1),
        Wait(500);
        -- Order("Men", P7, "Anywhere", Move, "callArrival");ModifyUnitHitPoints(All, "Men", P7, "Anywhere", 1),
        ModifyUnitShields(All, "Men", P7, "Anywhere", 1),

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