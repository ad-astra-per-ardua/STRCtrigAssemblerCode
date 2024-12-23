function Enable_TestMode()
    TriggerX(FP, Always(), {
        SetResources(Force1, Add, 0xFFFFFF, Ore)
    })
end