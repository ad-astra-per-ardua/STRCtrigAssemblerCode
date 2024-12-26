function Define_Variable()
    -- Healzone function
    DoActions(FP, AddCD(healzone, 1), preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, 204, healzone)}, {
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

----------- Marine Create and movelocation + Convert Trigger ----------

    --- Create Marine and SCV ---

    TriggerX(Force1, {
        Bring(CurrentPlayer, AtLeast, 1, 0, "MainLocation");
        
    }, {
        CreateUnit(1, 0, "home", CurrentPlayer);
        RemoveUnitAt(1, 0, "MainLocation", CurrentPlayer);
    }, preserved)


    
    TriggerX(Force1, {
        Bring(CurrentPlayer, AtLeast, 1, 20, "MainLocation");
    }, {
        CreateUnit(1, 20, "home", CurrentPlayer);
        RemoveUnitAt(1, 20, "MainLocation", CurrentPlayer);
    }, preserved)
    


for i = 0 , 4 do
    CIfX(Force1, CDeaths(i, AtLeast, 12, Combine_marine))

    TriggerX(Force1, { -- Check instant create phase
        Bring(CurrentPlayer, AtLeast, 1, 1, "MainLocation");
    }, {
        DisplayText(StrDesign2X("Instant SMarine Created"), 4);
        CreateUnit(1, 16, "home", CurrentPlayer);
        RemoveUnitAt(1, 1, "MainLocation", CurrentPlayer);
    }, preserved)

    CElseX()

    TriggerX(Force1, { -- Check instant create phase
        Bring(CurrentPlayer, AtLeast, 1, 1, "MainLocation");
    }, {
        DisplayText(StrDesign2X("Instant SMarine Create failed flag. Resource Returned. "), 4);
        RemoveUnitAt(1, 1, "MainLocation", CurrentPlayer);
        SetResources(CurrentPlayer, Add, 32500, Ore);
    }, preserved)

    CIfXEnd()


    TriggerX(Force1, {
        Bring(CurrentPlayer, AtLeast, 1, 7, "MainLocation");
    }, {
        CreateUnit(1, 7, "home", CurrentPlayer);
        RemoveUnitAt(1, 7, "MainLocation", CurrentPlayer);
    }, preserved)

    --- Instant create Special marine Algorithm ---

    --- Convert Marine Trigger

    TriggerX(Force1, { -- Marine > Hmarine
        Accumulate(CurrentPlayer, AtLeast, 7500, Ore);
        Bring(CurrentPlayer, AtLeast, 1, 0, "convertH");
    }, {
        SetResources(CurrentPlayer, Subtract, 7500, Ore);
        CreateUnit(1, 20, "home", CurrentPlayer);
        RemoveUnitAt(1, 0, "convertH", CurrentPlayer);
    }, preserved)


    TriggerX(Force1, { -- Hmarine > Smarine
        Accumulate(CurrentPlayer, AtLeast, 15000, Ore);
        Bring(CurrentPlayer, AtLeast, 1, 20, "convertH");
    }, {
        SetResources(CurrentPlayer, Subtract, 15000, Ore);
        RemoveUnitAt(1, 20, "convertH", CurrentPlayer);
        CreateUnit(1, 16, "home", CurrentPlayer);
        SetCDeaths(i, Add, 1, Combine_marine);
    }, preserved)

end

------------------------ Exchange Trigger

for i = 0, 4 do
    TriggerX(FP, {Command(Force1,Exactly,i+1,111)},{SetNDeaths(FP,SetTo,i+1,P_Count)},preserved)
end

CIfX(AllPlayers, {CDeaths(FP, Exactly, 1, Difficulty)}) --- Normal plot (Past)
    TriggerX(FP, Always(), {SetCDeaths(FP, SetTo, 1, Difficulty)})

    ExRate = {18,19,21,23}
    ExRate2 = {21,22,24,26}
    ExRate3 = {23,24,26,28}

    for i = 0, 4 do ---- 
        for j = 15, 0, -1 do
            TriggerX(Force1, {
                Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
                NDeaths(FP, Exactly, i+1, P_Count);
                Bring(i, AtLeast, 1, "Men", "exl");
            }, {
                SetScore(CurrentPlayer, Kills, AtLeast, 2^j*100);
                SetResources(CurrentPlayer, Add, 2^j*ExRate[i+1], Ore)
            }, preserved)

            TriggerX(Force1, {
                Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
                NDeaths(FP, Exactly, i+1, P_Count);
                Bring(i, AtLeast, 1, "Men", "exr");
            }, {
                SetScore(CurrentPlayer, Kills, AtLeast, 2^j*100);
                SetResources(CurrentPlayer, Add, 2^j*ExRate[i+1], Ore)
            }, preserved)
        end 
    end

CElseIfX({CDeaths(FP, Exactly, 2, Difficulty)}) --- Hard plot (Present)







CElseIfX({CDeaths(FP, Exactly, 3, Difficulty)}) --- Lunatic Plot (Future)





CIfXEnd()

end