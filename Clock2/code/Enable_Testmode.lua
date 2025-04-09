function Enable_TestMode()
    TriggerX(FP, Always(), {
        
        CreateUnit(1, 98, "home", P1);
        CreateUnit(1, 115, "home", P1);
        SetResources(Force1, Add, 100, Ore);
        SetScore(Force1, Add, 100000000, Kills);
        SetCDeaths(FP, SetTo, 1, Difficulty)
    })
    TriggerX(FP, {
        Bring(P1, AtLeast, 1, 9, "home")
    }, {
        KillUnitAt(All, "Men", "Anywhere", Force2),
        KillUnitAt(All, 9, "home", P1)
    }, preserved)
end