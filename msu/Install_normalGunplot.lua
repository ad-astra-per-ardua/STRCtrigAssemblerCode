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
    for i = 1, 10 do
        TriggerX(FP, Always(), CreateUnit(1, 114, "starp"..i, P6))
    end
    for i = 1, 10 do
        TriggerX(FP, Always(), CreateUnit(1, 167, "starg"..i, P6))
    end

end