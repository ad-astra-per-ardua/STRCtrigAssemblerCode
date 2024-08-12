function Install_CCMU()
    CanText1 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＤＡＮＧＥＲ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    CanText2 = StrDesignX("\x04맵상의 유닛이 \x08１６００\x04기 이상 있습니다.").."\n"..StrDesignX("\x08캔낫\x04이 \x074회 이상\x04 걸릴 경우 \x10게임\x04에서 \x06패배\x04합니다.\x04").."\n"
    CanText3 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＤＡＮＧＥＲ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    
    CanText11 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! !\x04 ● ● ●\n\x14\n\x14\n"
    CanText22 = StrDesignX("\x08ＣＣＭＵ\x04가 \x081회 \x04감지되었습니다.").."\n"..StrDesignX("\x08ＣＣＭＵ\x04가 \x083회 \x04이상\x08 더 \x04감지 될 경우 \x10게임\x04에서 \x06패배\x04합니다.\x04").."\n"
    CanText33 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08ＡＬＥＲＴ\x04 ● ● ●\n\x14\n\x14\n"
    
    CanText111 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    CanText222 = StrDesignX("\x08ＣＣＭＵ\x04가 \x082회 \x04감지되었습니다.").."\n"..StrDesignX("\x08ＣＣＭＵ\x04가 \x082회 \x04이상\x08 더 \x04감지 될 경우 \x10게임\x04에서 \x06패배\x04합니다.\x04").."\n"
    CanText333 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"

    CanText1111 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    CanText2222 = StrDesignX("\x08ＣＣＭＵ\x04가 \x083회 \x04감지되었습니다.").."\n"..StrDesignX("\x08ＣＣＭＵ\x04가 \x081회 \x04이상\x08 더 \x04감지 될 경우 \x10게임\x04에서 \x06패배\x04합니다.\x04").."\n"
    CanText3333 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    
    CanText11111 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＤＥＦＥＡＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    CanText22222 = StrDesignX("\x08ＣＣＭＵ\x04가 \x074회 이상 \x04감지되었습니다.").."\n"..StrDesignX("\x10게임\x04에서 \x06패배\x04합니다. T^T\x04").."\n"
    CanText33333 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＤＥＦＥＡＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n"
    
    Trigger2X(FP, {Memory(0x6283F0, AtLeast, 1600), Deaths(P11, Exactly, 0, 157)}, { -- 적당히 하십시오 휴먼
        RotatePlayer({
            DisplayTextX(CanText1, 4),
            DisplayTextX(CanText2, 4),
            DisplayTextX(CanText3, 4),
            PlayWAVX("sound\\Terran\\RAYNORM\\URaPss02.WAV"),
            PlayWAVX("sound\\Terran\\RAYNORM\\URaPss02.WAV"),
        }, {Force1, Force5}, FP),
        SetDeaths(P11, Add, 1, 157)
    }, preserved)

    TriggerX(FP, Deaths(P11, AtLeast, 170, 157), SetDeaths(P11, SetTo, 1, 157),preserved)
    for i = 1 , 3 do
        TriggerX(Force2, {FMemory(0x58F450, Exactly, i)},{RunAIScriptAt(JYD, "Anywhere")})
    end
    
    Trigger2X(FP, {FMemory(0x58F450, Exactly, 1)}, {
        RotatePlayer({
            DisplayTextX(CanText11, 4),
            DisplayTextX(CanText22, 4),
            DisplayTextX(CanText33, 4),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
        }, {Force1, Force5}, FP),
        KillUnit(16, Force2),
        KillUnit(44, Force2),
        KillUnit(56, Force2),
        KillUnit(16, Force2),
        KillUnit(51, Force2),
        KillUnit(88, Force2),
        KillUnit(89, Force2),
        KillUnit(66, Force2),
        KillUnit(65, Force2),
        KillUnit(95, Force2),
        KillUnit(55, Force2),
        KillUnit(69, Force2),
    })

    Trigger2X(FP, {FMemory(0x58F450, Exactly, 2)}, {
        RotatePlayer({
            DisplayTextX(CanText111, 4),
            DisplayTextX(CanText222, 4),
            DisplayTextX(CanText333, 4),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
        }, {Force1, Force5}, FP),
        KillUnit(16, Force2),
        KillUnit(44, Force2),
        KillUnit(56, Force2),
        KillUnit(16, Force2),
        KillUnit(51, Force2),
        KillUnit(88, Force2),
        KillUnit(89, Force2),
        KillUnit(66, Force2),
        KillUnit(65, Force2),
        KillUnit(95, Force2),
        KillUnit(55, Force2),
        KillUnit(69, Force2),
    })

    Trigger2X(FP, {FMemory(0x58F450, Exactly, 3)}, {
        RotatePlayer({
            DisplayTextX(CanText1111, 4),
            DisplayTextX(CanText2222, 4),
            DisplayTextX(CanText3333, 4),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Terran\\GOLIATH\\TGoPss05.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
            PlayWAVX("sound\\Bullet\\TNsHit00.WAV"),
        }, {Force1, Force5}, FP),
        KillUnit(16, Force2),
        KillUnit(44, Force2),
        KillUnit(56, Force2),
        KillUnit(16, Force2),
        KillUnit(51, Force2),
        KillUnit(88, Force2),
        KillUnit(89, Force2),
        KillUnit(66, Force2),
        KillUnit(65, Force2),
        KillUnit(95, Force2),
        KillUnit(55, Force2),
        KillUnit(69, Force2),
    })
    
    
    Trigger2X(FP, {FMemory(0x58F450, Exactly, 4)}, RotatePlayer({
        DisplayTextX(CanText11111, 4),
        DisplayTextX(CanText22222, 4),
        DisplayTextX(CanText33333, 4),
        Defeat();
    }, {Force1}, FP))

    CIfX(FP, {CDeaths(FP, Exactly, 2, Difficulty)})
    TriggerX(FP, {FMemory(0x58F450, Exactly, 1)}, {
        SetCDeaths(FP, SetTo, 339, CannotPenalty)
    })
    TriggerX(FP, {FMemory(0x58F450, Exactly, 1),CDeaths(FP, AtLeast, 1, CannotPenalty) }, 
    {
        SetCDeaths(FP, Subtract, 1, CannotPenalty)
    },preserved)

    Trigger2X(FP, {FMemory(0x58F450, Exactly, 1),CDeaths(FP, Exactly, 0, CannotPenalty) }, {
        RotatePlayer(
            {
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Bullet\\TNsFir00.WAV"),
        PlayWAVX("sound\\Bullet\\TNsFir00.WAV"),
        }, {Force1, Force5}, FP),
        CreateUnit(20, 191, "mainLocation", P6),
        CreateUnit(20, 192, "mainLocation", P6),
        SetCp(P6),
        RunAIScriptAt(JYD, "mainLocation"),
        SetCp(FP)
    })

    --------------------2
    TriggerX(FP, {FMemory(0x58F450, Exactly, 2)}, {
        SetCDeaths(FP, SetTo, 339, CannotPenalty)
    })
    TriggerX(FP, {FMemory(0x58F450, Exactly, 2),CDeaths(FP, AtLeast, 1, CannotPenalty) }, 
    {
        SetCDeaths(FP, Subtract, 1, CannotPenalty)
    },preserved)

    Trigger2X(FP, {FMemory(0x58F450, Exactly, 2),CDeaths(FP, Exactly, 0, CannotPenalty) }, {
        RotatePlayer(
            {
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Bullet\\TNsFir00.WAV"),
        PlayWAVX("sound\\Bullet\\TNsFir00.WAV"),
        }, {Force1, Force5}, FP),
        CreateUnit(30, 191, "mainLocation", P6),
        CreateUnit(30, 192, "mainLocation", P6),
        SetCp(P6),
        RunAIScriptAt(JYD, "mainLocation"),
        SetCp(FP)
    })

    ---------------------3
    TriggerX(FP, {FMemory(0x58F450, Exactly, 3)}, {
        SetCDeaths(FP, SetTo, 339, CannotPenalty)
    })
    TriggerX(FP, {FMemory(0x58F450, Exactly, 3),CDeaths(FP, AtLeast, 1, CannotPenalty) }, 
    {
        SetCDeaths(FP, Subtract, 1, CannotPenalty)
    },preserved)

    Trigger2X(FP, {FMemory(0x58F450, Exactly, 3),CDeaths(FP, Exactly, 0, CannotPenalty) }, {
        RotatePlayer(
            {
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Terran\\Advisor\\TAdUpd04.wav"),
        PlayWAVX("sound\\Bullet\\TNsFir00.WAV"),
        PlayWAVX("sound\\Bullet\\TNsFir00.WAV"),
        }, {Force1, Force5}, FP),
        CreateUnit(40, 191, "mainLocation", P6),
        CreateUnit(40, 192, "mainLocation", P6),
        SetCp(P6),
        RunAIScriptAt(JYD, "mainLocation"),
        SetCp(FP)
    })
    CIfXEnd()

    end