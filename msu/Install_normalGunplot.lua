function Install_normalGunplot()
    for i = 1, 10 do
        TriggerX(FP, Always(), CreateUnit(1, 131, "hat"..i, P6))
    end
    for i = 1, 8 do
        TriggerX(FP, Always(), CreateUnit(1, 132, "lair"..i, P6))
    end
    for i = 9, 12 do
        TriggerX(FP, Always(), CreateUnit(1, 132, "lair"..i, P7))
    end

    for i = 1, 10 do
        TriggerX(FP, Always(), CreateUnit(1, 133, "hive"..i, P6))
    end
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