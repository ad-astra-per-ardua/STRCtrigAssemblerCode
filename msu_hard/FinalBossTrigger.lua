function FinalBossTrigger()
    ----------- After 4 MBoss ---------
    TriggerX(FP, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        KillUnitAt(All, 125, "Anywhere", Force1),
        KillUnitAt(All, 125, "Anywhere", P12),
        KillUnitAt(All, "Men", "Anywhere", Force2),
        CreateUnit(1, 168, "HealZone", P7)
        
    })

    TriggerX(FP, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        SetDeaths(P8, SetTo, 1, 131),
        SetDeaths(P8, SetTo, 1, 132);
        PreserveTrigger();
    })

    TriggerX(Force1, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        DisplayText("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n", 4),
        DisplayText(StrDesignX("모든 것의 근원지, \x08? ? ? ? ? ? \x04가 어딘가에 등장하였습니다 !"), 4),
        DisplayText("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n", 4),
        PlayWAV("staredit\\wav\\CAUTION.wav"),
        PlayWAV("staredit\\wav\\CAUTION.wav"),
        PlayWAV("staredit\\wav\\CAUTION.wav")
    })
    CIfX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)})
    Trigger2X(FP,{
    Deaths(P6, AtLeast, 1, 202),
    Deaths(P6, AtLeast, 1, 203),
    Deaths(P6, AtLeast, 1, 204),
    Deaths(P6, AtLeast, 1, 205),
    Deaths(P7, AtLeast, 1, 168)},{
        RotatePlayer({
        DisplayTextX(StrDesignX("\x04마린키우기 \x19U\x17niverse \x07[1.2v] Normal\x04을 클리어 하셨습니다 ! .").."\n"..StrDesignX("\x04플레이 해주셔서 정말 \x19감사드립니다!").."\n"..StrDesignX("\x08To be Continued."),4),
        PlayWAVX("staredit\\wav\\epilogue.ogg"),
        PlayWAVX("staredit\\wav\\epilogue.ogg"),
        SetMemoryBA(0x657A9C, SetTo, 1),
        },{Force1, Force5},FP);
    })

    TriggerX(FP, Deaths(P7, AtLeast, 1, 168), {SetCDeaths(FP, SetTo, 340, Endingtimer)})
    TriggerX(FP, {Deaths(P7, AtLeast, 1, 168),CDeaths(FP, AtLeast, 1, Endingtimer)}, {SetCDeaths(FP, Subtract, 1, Endingtimer)},preserved)
    TriggerX(FP, {Deaths(P7, AtLeast, 1, 168),CDeaths(FP, Exactly, 0, Endingtimer)}, {
        RotatePlayer({
            Victory();
        }, {Force1, Force5}, FP)
    })
    CElseX()
    Trigger2X(FP,{
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
        Deaths(P7, AtLeast, 1, 168)},{
            RotatePlayer({
            DisplayTextX(StrDesignX("\x04마린키우기 \x19U\x17niverse \x07[1.2v] \x08Hard\x04를 클리어 하셨습니다 ! .").."\n"..StrDesignX("\x04플레이 해주셔서 정말 \x19감사드립니다!").."\n"..StrDesignX("\x08To be Continued."),4),
            PlayWAVX("staredit\\wav\\epilogue.ogg"),
            PlayWAVX("staredit\\wav\\epilogue.ogg"),
            SetMemoryBA(0x657A9C, SetTo, 1),
            },{Force1, Force5},FP);
        })
    
        TriggerX(FP, Deaths(P7, AtLeast, 1, 168), {SetCDeaths(FP, SetTo, 340, Endingtimer)})
        TriggerX(FP, {Deaths(P7, AtLeast, 1, 168),CDeaths(FP, AtLeast, 1, Endingtimer)}, {SetCDeaths(FP, Subtract, 1, Endingtimer)},preserved)
        TriggerX(FP, {Deaths(P7, AtLeast, 1, 168),CDeaths(FP, Exactly, 0, Endingtimer)}, {
            RotatePlayer({
                Victory();
            }, {Force1, Force5}, FP)
        })
    CIfXEnd()
end