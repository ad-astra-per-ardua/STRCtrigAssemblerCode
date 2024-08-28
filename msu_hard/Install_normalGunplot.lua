function Install_normalGunplot()
    for i = 1, 10,2 do
        TriggerX(FP, Always(), CreateUnit(1, 131, "hat"..i, P6))
    end
    for i = 2, 10, 2 do
        TriggerX(FP, Always(), CreateUnit(1, 131, "hat"..i, P7))
    end
    for i = 1, 8 do
        TriggerX(FP, Always(), CreateUnit(1, 132, "lair"..i, P6))
    end
    for i = 9, 12 do
        TriggerX(FP, Always(), CreateUnit(1, 132, "lair"..i, P7))
    end

    for i = 1, 4 do
        TriggerX(FP, Always(), CreateUnit(1, 133, "hive"..i, P6))
    end

    TriggerX(FP, Always(), CreateUnit(1, 133, "hive6", P6))
    TriggerX(FP, Always(), CreateUnit(1, 133, "hive9", P6))

    TriggerX(FP, Always(), CreateUnit(1, 133, "hive5", P7))
    TriggerX(FP, Always(), CreateUnit(1, 133, "hive7", P7))
    TriggerX(FP, Always(), CreateUnit(1, 133, "hive8", P7))
    TriggerX(FP, Always(), CreateUnit(1, 133, "hive10", P7))
    for _, i in ipairs({"starp7", "starp1", "starp4", "starp10", "starp3"}) do
        TriggerX(FP, Always(), CreateUnit(1, 114, i, P7))
    end

    for _,i in ipairs({"starp8", "starp6", "starp2", "starp5", "starp9"} ) do
        TriggerX(FP, Always(), CreateUnit(1, 114, i, P6))
    end
    for i = 1, 10 do
        TriggerX(FP, Always(), CreateUnit(1, 167, "starg"..i, P6))
    end

    
    
end