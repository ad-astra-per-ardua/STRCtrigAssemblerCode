function FinalBossTrigger()
    ----------- After 4 MBoss ---------

    Trigger2X(FP, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        RotatePlayer({
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n", 4),
        DisplayTextX(StrDesignX("모든 것의 근원지, \x08? ? ? ? ? ? \x04가 어딘가에 등장하였습니다 !"), 4),
        DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n", 4),
        PlayWAVX("staredit\\wav\\CAUTION.wav"),
        PlayWAVX("staredit\\wav\\CAUTION.wav"),
        PlayWAVX("staredit\\wav\\CAUTION.wav")
    }, {Force1, Force5}, FP),
        KillUnitAt(All, 125, "Anywhere", Force1),
        KillUnitAt(All, 125, "Anywhere", P12),
        KillUnitAt(All, "Men", "Anywhere", Force2),
    })
    TriggerX(FP, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        Wait(100),
        CreateUnit(1, 168, "HealZone", P7),
    })

    CIfX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)})
    
    TriggerX(FP, Always(), {
        SetDeaths(P6, SetTo, 1, 202),
        SetDeaths(P6, SetTo, 1, 203),
        SetDeaths(P6, SetTo, 1, 204),
        SetDeaths(P6, SetTo, 1, 205),
    })

    CIf(AllPlayers, {Deaths(P7, AtLeast, 1, 168)})

    


    CIfEnd()

    CElseX()

    TriggerX(FP, Always(), {
        SetDeaths(P6, SetTo, 1, 202),
        SetDeaths(P6, SetTo, 1, 203),
        SetDeaths(P6, SetTo, 1, 204),
        SetDeaths(P6, SetTo, 1, 205),
    })

    
    CIfXEnd()
end