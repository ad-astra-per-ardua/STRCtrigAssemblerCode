function FinalBossTrigger()
    ----------- After 4 MBoss ---------
    BGM_SplitTL = {0.03, 16.238, 32.161, 33.865, 89.304, 92.109, 123.352, 125.331, 156.213, 158.496}
    BGM_Gentimeplot = {
        23.8, 27.6
    }

    TriggerX(FP, Always(), {
        CreateUnit(100, 1, "neutralbunker1", P1),
        CreateUnit(100, 1, "neutralbunker2", P1),
        CreateUnit(100, 1, "neutralbunker3", P1),
        CreateUnit(100, 1, "neutralbunker4", P1),
    })
    DoActions(FP, {
        ModifyUnitHitPoints(All, "Men", P1, "Anywhere", 100)
    }, preserved)
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

    
    
    TriggerX(FP, Always(), {
        SetDeaths(P6, SetTo, 1, 202),
        SetDeaths(P6, SetTo, 1, 203),
        SetDeaths(P6, SetTo, 1, 204),
        SetDeaths(P6, SetTo, 1, 205),
    })

    CIf(AllPlayers, {Deaths(P7, AtLeast, 1, 168)})

    TriggerX(FP, {Deaths(P7, AtLeast, 1, 168)}, {
        AddCD(FBOSS_Initvar, 1),
        AddCD(FBOSS_Tmpvar, 1)}, preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, 2, FBOSS_Tmpvar)}, {SetCD(FBOSS_Tmpvar, 0)}, preserved)
    Trigger2X(FP, {CDeaths(FP, AtMost, 68, FBOSS_Initvar), CDeaths(FP, AtMost, 2, FBOSS_Tmpvar)}, {SetMemoryB(0x657A9C, Subtract, 1)
    }, preserved)
    for i = 1,31 do
        TriggerX(FP, {CDeaths(FP, AtLeast, 136 + i, FBOSS_Initvar)}, {SetMemoryB(0x657A9C, SetTo, i)})
    end
    TriggerX(FP, {CDeaths(FP, AtLeast, 67, FBOSS_Initvar)}, {
        SetSpriteImage(203, 215),
        SetImageScript(215, 131)
    })
    CSPlot2(CellScattered, P8, 119, "HealZone", nil, 1, 32, FP, {CDeaths(FP, AtLeast, 100, FBOSS_Initvar)},{SetImageScript(215, 144)})

    ----- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 
    TmpNextptr,FnBossPtr,FnBossHP,FnBossHP2 = CreateVars(4, FP)
    CIfOnce(FP,{CDeaths(FP, AtLeast, 100, FBOSS_Initvar)},{})
        f_Read(FP,0x628438,nil,TmpNextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,FnBossPtr,TmpNextptr) -- Save FnBossPtr from TmpNextptr's 
            CDoActions(FP,{
                CreateUnit(1,122,"HealZone",P8);
                TSetMemory(Vi(TmpNextptr[2],2),SetTo,256*2000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(TmpNextptr[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set
                TSetMemory(0x62855B,SetTo,1);
                SetInvincibility(Enable, 122, P8, "Anywhere");
            })
        CMov(FP,FnBossHP,TmpNextptr,2) 
        DoActionsX(FP,{SetNVar(FnBossHP2,SetTo,2)})
    CIfEnd()

    CTrigger(FP,{
        TMemory(FnBossHP,AtMost,256*1000);
        NVar(FnBossHP2,AtLeast,1);
    },{
        TSetMemory(FnBossHP,SetTo,256*2000);
        SetNVar(FnBossHP2,Subtract,1);
    },{preserved})
    ------------ End of Boss HP Overflow Trigger ----------------------
    TriggerX(FP, {CDeaths(FP, AtLeast, 198, FBOSS_Initvar)}, {
        RotatePlayer({
            DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04────┫● ● ● \x08 ＦＩＮＡＬ ＮＯＴＩＣＥ\x04┠──── \x04 ● ● ●\n\x14\n\x14\n",4);
            DisplayTextX(StrDesignX("\x11모든 세계관의 지식\x04을 가진 \x08재앙이 \x04깨어났습니다."), 4);
            DisplayTextX(StrDesignX("\x04여기서 막지않으면, 이곳도 \x19다른 세계관처럼 \x08그\x04에게 \x10한낱 지식으로 \x08흡수\x04되어질 것 입니다."), 4);
            DisplayTextX(StrDesignX("\x04。 。 。 \x08최후의 전투를 \x1f준비하십시길 바랍니다.\x04"), 4);
            DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04────┫● ● ● \x08 ＦＩＮＡＬ ＮＯＴＩＣＥ\x04● ● ●┠──── \x04 \n\x14\n\x14\n",4),
            MinimapPing("HealZone"),
        }, {Force1,Force5}, FP),
        SetInvincibility(Disable, 122, P8, "Anywhere"),  
    })
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1)}, {SetCDeaths(FP, Add, 1, Start_var1)}, preserved)
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtMost, 68, Start_var1)}, {
        CreateUnit(1, 72, "HealZone", P5),
        SetInvincibility(Enable, 122, P8, "HealZone")
    }, preserved)
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 69, Start_var1)}, {
        KillUnit(119, Force2),
    })
    for i = 1, 15 do
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 69 + (i + 3), Start_var1)}, {
        RotatePlayer({
            DisplayTextX("setmemory flag", 4)
        }, Force1, FP),
        SetMemoryB(0x657A9C, SetTo, 31-i)
    })
    end
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 170, Start_var1)}, {
        AddCD(FBOSS_BGM, 1),
    }, preserved)
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)}, {SetMemoryB(0x657A9C, SetTo, 31)})


    for i = 1, 10 do
		local wav
        if i <= 9 then
            wav = "staredit\\wav\\final00"..i..".ogg"
        elseif i >= 10 then
            wav = "staredit\\wav\\final0"..i..".ogg"
        end
        TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_SplitTL[i] * SDspeed, FBOSS_BGM)}, {
            RotatePlayer({
                PlayWAVX(wav),
                PlayWAVX(wav),
            }, {Force1,Force5}, FP)
        })
    end
    CIfEnd()
--------------- End of Final Boss Initial Setup -------------

    CIfX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)})

    CSPlotOrder(FBossMainplot, P5, 77, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 78, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 88, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)})

    CSPlotOrder(FBossMainplot, P5, 77, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 77, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 77, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse12, P8, 70, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[2] * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse6, P8, 23, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[2] * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse1, P8, 58, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+1) * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse7, P8, 7, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +1)* SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse2, P8, 60, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+2) * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse8, P8, 3, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+2) * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse3, P8, 86, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +3)* SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse9, P8, 64, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+3) * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse4, P8, 28, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +4)* SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse10, P8, 69, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +4)* SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse5, P8, 29, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+5) * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse11, P8, 74, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +5)* SDspeed, FBOSS_BGM)})



-- Todo : PerAction == SetInvincibility Enable to Spawn tables | SetPlayerColor and SetMinimapColor of P8 and plotting



-------------------------- Start of Hard Plot --------------------
    CElseX()



    
    CIfXEnd()
end