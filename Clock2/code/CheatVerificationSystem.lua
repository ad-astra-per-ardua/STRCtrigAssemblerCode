function CheatVerificationSystem()
    HPupgradeStatus, ATKupgradeStatus = CreateVars(2, FP)
    for i = 0, 4 do
        -- f_Bread(FP, 0x58D2B0 + (i * 46) + 15, HPupgradeStatus)
        -- f_Bread(FP, 0x58D2B0 + (i * 46) + 7, ATKupgradeStatus)
        -- TriggerX(i, Memory(0x58D2B0 + (i * 46) + 15, AtLeast, 51), {DisplayPrint(i, {"HP Cheat verification Activated"}, 4)})
        -- TriggerX(i, Memory(0x58D2B0 + (i * 46) + 7, AtLeast, 101), {DisplayPrint(i, {"ATK Cheat verification Activated"}, 4)})
    end
    
end