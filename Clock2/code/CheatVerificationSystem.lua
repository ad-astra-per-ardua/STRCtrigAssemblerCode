function CheatVerificationSystem()
    for i = 0, 4 do
        TriggerX(i, {
            Memory(0x58D2B0 + (i * 46) + 15, AtLeast, 51)
        }, {
            DisplayText("Cheat Verification HP Upgrade System Test", 4)
        })
        TriggerX(i, {
            Memory(0x58D2B0 + (i * 46) + 7, AtLeast, 201)
        }, {
            DisplayText("Cheat Verification Offence Upgrade System Test", 4)
        })

    end
end