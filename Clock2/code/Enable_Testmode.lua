function Enable_TestMode()
    TriggerX(FP, Always(), {
        SetResources(Force1, Add, 100, Ore);
        SetScore(Force1, Add, 100000000, Kills);
        TriggerX(FP, Always(), {SetCDeaths(FP, SetTo, 1, Difficulty)})
    })
end