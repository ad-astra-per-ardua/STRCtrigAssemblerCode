function Define_Variable()
    -- Healzone function
    DoActions(FP, AddCD(healzone, 1), preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, 170, healzone)}, {
        ModifyUnitHitPoints(All, "Men", Force1, "home", 100),
        ModifyUnitShields(All, "Men", Force1, "home", 100),
        
        ModifyUnitHitPoints(All, "Factories", Force1, "home", 100),
        ModifyUnitShields(All, "Factories", Force1, "home", 100),
        
        SetCD(healzone, 1)
    }, preserved)

    TriggerX(FP, Always(), {
        RemoveUnit("Men", P12),
        RemoveUnit(111, P12),
        RemoveUnit(122, P12),
        RemoveUnit(107, P12)
    }, preserved)

    ------- Medic Heal Trigger --- 
    
    --- 1 Tick heal ----

    TriggerX(Force1, {
        Command(CurrentPlayer, AtLeast, 1, 34)
    }, {
        ModifyUnitHitPoints(All, "Men", CurrentPlayer, "Anywhere", 100),
        ModifyUnitShields(All, "Men", CurrentPlayer, "Anywhere", 100),
        RemoveUnit(34, CurrentPlayer)
    }, preserved)

    --- 2 Tick heal ----

    TriggerX(Force1, {
        Command(CurrentPlayer, AtLeast, 1, 21)
    }, {
        ModifyUnitHitPoints(All, "Men", CurrentPlayer, "Anywhere", 100),
        ModifyUnitShields(All, "Men", CurrentPlayer, "Anywhere", 100),
        RemoveUnit(21, CurrentPlayer)    
    }, preserved)

    --- 3 Tick heal ---

    TriggerX(Force1, {
        Command(CurrentPlayer, AtLeast, 1, 23)
    }, {
        ModifyUnitHitPoints(All, "Men", CurrentPlayer, "Anywhere", 100),
        ModifyUnitShields(All, "Men", CurrentPlayer, "Anywhere", 100),
        RemoveUnit(23, CurrentPlayer)
    }, preserved)


    --- Time switch Phase | Trigger unit == 22 ---
    Medic_SwitchArray = {34,21,23}
    
    for i = 0 , 4 do
        TriggerX(i, {
            Always();
        }, {
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,1);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,0);
        })
    end


    for i = 0, 4 do

        TriggerX(i, {
            CDeaths(i, Exactly, 0, DelayMedic),
            Bring(i, AtLeast, 1, 22, "MainLocation")
        }, {
            RemoveUnit(22, i),
            DisplayText(StrDesignX("Delay Medic 1 -> 2 Tick"), 4),
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,1);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,0);
            SetCDeaths(i, SetTo, 1, DelayMedic)
        }, preserved)


        TriggerX(i, {
            CDeaths(i, Exactly, 1, DelayMedic),
            Bring(i, AtLeast, 1, 22, "MainLocation")
        }, {
            RemoveUnit(22, i),
            DisplayText(StrDesignX("Delay Medic 2 -> 3 Tick"), 4),
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,1);
            SetCDeaths(i, SetTo, 2, DelayMedic)
        }, preserved)


        TriggerX(i, {
            CDeaths(i, Exactly, 2, DelayMedic),
            Bring(i, AtLeast, 1, 22, "MainLocation")
        }, {
            RemoveUnit(22, i),
            DisplayText(StrDesignX("Delay Medic 3 -> 1 Tick"), 4),
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,1);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,0);
            SetCDeaths(i, SetTo, 0, DelayMedic)
        }, preserved)

    end

    Trigger { -- 일마 생산
    players = {Force1},
    conditions = {
        Bring(CurrentPlayer, AtLeast, 1, 0, "MainLocation");
    },
    actions = {
        CreateUnit(1, 0, "home", CurrentPlayer);
        RemoveUnitAt(1, 0, "MainLocation", CurrentPlayer);
        PreserveTrigger();
    },
}


end