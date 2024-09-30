function FinalBossTrigger()
    ----------- After 4 MBoss ---------
    BGM_SplitTL = {0.03, 16.238, 32.161, 33.865, 89.304, 92.109, 123.352, 125.331, 156.213, 158.496}
    BGM_Gentimeplot = {
        23.8, 27.6, 37.4, 47.8, 61.8, 75.8, 88.9, -- End of palm island
        92.14, 92.63, 123.3, -- End of rhegb 
        125.33, 
    }
    PalmGenTime = {
        40.5, 42.6, 47.8, 51.3, 54.6, 61.8, 64.6, 68.5, 72.3, 75.8, 78.6, 82.5
    }

    TriggerX(FP, Always(), {
        CreateUnit(100, 1, "neutralbunker1", P1),
        CreateUnit(100, 1, "neutralbunker2", P1),
        CreateUnit(100, 1, "neutralbunker3", P1),
        CreateUnit(100, 1, "neutralbunker4", P1),
    })
    CDoActions(FP, {
        ModifyUnitHitPoints(All, "Men", P1, "Anywhere", 100),
        SetCDeaths(FP, Add, 1, P8minimap),
        SetMinimapColor(P8, SetTo, P8minimap)
    }, preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, 255, P8minimap)}, {SetCDeaths(FP, SetTo, 1, P8minimap)}, preserved)
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
        RemoveUnitAt(All, "Buildings", "Anywhere", Force2)
    })

    CIf(AllPlayers, {Deaths(P7, AtLeast, 1, 168)})

    Trigger {
        players = {Force1},
        conditions = {
            Deaths(P7, AtLeast, 1, 168)
        },
        actions = {
            RunAIScript("Turn OFF Shared Vision for Player 8");
            
        },
        }

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

    Trigger {
        players = {Force1},
        conditions = {
            Always();
        },
        actions = {
            RunAIScript("Turn ON Shared Vision for Player 5");
            RunAIScript("Turn ON Shared Vision for Player 6");
            RunAIScript("Turn ON Shared Vision for Player 7");
            RunAIScript("Turn ON Shared Vision for Player 8");
            PreserveTrigger();
        },
        }

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

    CSPlotOrder(FBossMainplot, P5, 3, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 8, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 12, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})

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

    TriggerX(FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[3] * SDspeed, FBOSS_BGM)}, {SetInvincibility(Enable, "Men", P8, "Anywhere")})

    function PalmPhase(Timeplot, Mainunit, Battlelocation)
        TriggerX(FP, {CDeaths(FP, AtLeast, Timeplot * SDspeed, FBOSS_BGM)}, {
            GiveUnits(All, Mainunit, P8, "Anywhere", P5),
            SetInvincibility(Disable, Mainunit, P5, "Anywhere"),
            CreateUnit(1, 27, Battlelocation, P5),
            Order(Mainunit, P5, "Anywhere", Attack, "callArrival"),
            Order(27, P5, "Anywhere", Attack, "callArrival"),
        })
    end

    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +5)* SDspeed, FBOSS_BGM)}, {
        SetCDeaths(FP, Add, 1, BattleGen)
    }, preserved)

    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 17, BattleGen)}, {
        SetCDeaths(FP, SetTo, 1, BattleGen)
    },preserved)

    function PalmBattlegen(StartVar, EndVar, Unitid)
        Trigger2X(P6, {
        CDeaths(FP, AtLeast, 16, BattleGen), 
        CDeaths(FP, AtLeast, StartVar * SDspeed, FBOSS_BGM), 
        CDeaths(FP, AtMost, (EndVar - 1) * SDspeed, FBOSS_BGM)
    }, {
            RotatePlayer({
                DisplayTextX("\x04Battle Gen Initiated.", 4)
            }, {Force1,Force5}, FP),
            CreateUnit(1, 72, "battlegen1", P6),
            CreateUnit(1, Unitid, "battlegen1", P6),
            CreateUnit(1, 72, "battlegen2", P6),
            CreateUnit(1, Unitid, "battlegen2", P6),
            CreateUnit(1, 72, "battlegen3", P6),
            CreateUnit(1, Unitid, "battlegen3", P6),
            CreateUnit(1, 72, "battlegen4", P6),
            CreateUnit(1, Unitid, "battlegen4", P6),
            CreateUnit(1, 72, "battlegen5", P6),
            CreateUnit(1, Unitid, "battlegen5", P6),
            CreateUnit(1, 72, "battlegen6", P6),
            CreateUnit(1, Unitid, "battlegen6", P6),
            CreateUnit(1, 72, "battlegen7", P6),
            CreateUnit(1, Unitid, "battlegen7", P6),
            CreateUnit(1, 72, "battlegen8", P6),
            CreateUnit(1, Unitid, "battlegen8", P6),
        },preserved)
    end

    PalmBattlegen(BGM_Gentimeplot[3], BGM_Gentimeplot[4], 12)
    PalmBattlegen(BGM_Gentimeplot[4], BGM_Gentimeplot[5], 89)
    PalmBattlegen(BGM_Gentimeplot[5], BGM_Gentimeplot[6], 96)
    PalmBattlegen(BGM_Gentimeplot[6], BGM_Gentimeplot[7], 89)

    PalmPhase(PalmGenTime[1], 70, "celebrate2")
    PalmPhase(PalmGenTime[2], 58, "hive7")
    PalmPhase(PalmGenTime[3], 60, "hive4")
    PalmPhase(PalmGenTime[4], 86, "admin1")
    PalmPhase(PalmGenTime[5], 28, "starg8")
    PalmPhase(PalmGenTime[6], 29, "hive5")
    PalmPhase(PalmGenTime[7], 23, "celebrate1")
    PalmPhase(PalmGenTime[8], 7, "hive10")
    PalmPhase(PalmGenTime[9], 3, "hive3")
    PalmPhase(PalmGenTime[10], 64, "mainLocation")
    PalmPhase(PalmGenTime[11], 69, "starg3")
    PalmPhase(PalmGenTime[12], 74, "hive8")

    Palm_gen_tier1 = {51,93,3,52,3,46,95}
    Palm_gen_tier2 = {78,104,23,60,23,104,25}
    Palm_gen_tier3 = {88,58,89,7,86,28,58}
    
    local j = 1
    for i = 1, 12, 2 do
        if PalmGenTime[i] then
            if Palm_gen_tier1[j] and Palm_gen_tier2[j] and Palm_gen_tier3[j] then
                CSPlotOrder(FBossMainplot, P5, Palm_gen_tier1[j], "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, PalmGenTime[i] * SDspeed, FBOSS_BGM)})
                CSPlotOrder(FBossMainplot, P5, Palm_gen_tier2[j], "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, PalmGenTime[i] * SDspeed, FBOSS_BGM)})
                CSPlotOrder(FBossMainplot, P5, Palm_gen_tier3[j], "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, PalmGenTime[i] * SDspeed, FBOSS_BGM)})
            end
        end
        j = j + 1
    end

    ------------------- Start of rhegb part -----------------------
    
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[9] * SDspeed, FBOSS_BGM)}, {CreateUnit(1, 32, "callArrival", P5)})


function Simple_TSetLoc(Player,LocID,LeftValue,UpValue,RightValue,DownValue,AddonTrigger)
	CDoActions(Player,{
		TSetLoc(LocID,0,SetTo,LeftValue);
		TSetLoc(LocID,4,SetTo,UpValue);
		TSetLoc(LocID,8,SetTo,RightValue);
		TSetLoc(LocID,12,SetTo,DownValue);
		AddonTrigger
	})
end

SpellcasterPatch = {}

function SetUnitAdvFlag(UnitID,Value,Mask)
	table.insert(SpellcasterPatch,SetMemoryX(0x664080 + (UnitID*4),SetTo,Value,Mask))
end
for i = 0, 227 do
	SetUnitAdvFlag(i,0x200000,0x200000)
end

Trigger2(FP,{},SpellcasterPatch)



BackupCp, BPosXY, BPosX, BPosY = CreateVars(4,FP)
LocSize = 128

CunitCtrig_Part1(FP)
MoveCp("X",25*4)

NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,32,0,0xFF))

ClearCalc()

NJumpXEnd(FP,0x1)

DoActions(FP,MoveCp(Subtract,15*4))
SaveCp(FP,BackupCp)
CMov(FP,BPosXY,_Read(BackupCp))
CMov(FP,BPosX,_Mov(BPosXY,0xFFFF))
CMov(FP,BPosY,_Div(_Mov(BPosXY,0xFFFF0000),65536))
Simple_TSetLoc(FP,"emp2",_Sub(BPosX,LocSize),_Sub(BPosY,LocSize),_Add(BPosX,LocSize),_Add(BPosY,LocSize))
LoadCp(FP,BackupCp)
DoActions(FP,MoveCp(Add,15*4))

TriggerX(FP,{DeathsX(CurrentPlayer,Exactly,32,0,0xFF),CDeaths(FP, AtMost, (BGM_Gentimeplot[10] * SDspeed) - 10, FBOSS_BGM)},{
	CreateUnit(2,32,"emp2",P7);
	CreateUnit(1,84,"emp2",P6);
},{Preserved})

ClearCalc()
CJumpEnd(FP,0x2)
CunitCtrig_Part2()
CunitCtrig_Part3X()
for i = 0, 1699 do
CunitCtrig_Part4X(i,{
	DeathsX(EPDF(0x628298-0x150*i+(40*4)),AtLeast,1*16777216,0,0xFF000000),
	DeathsX(EPDF(0x628298-0x150*i+(19*4)),Exactly,0*256,0,0xFF00),
},
{	SetDeathsX(EPDF(0x628298-0x150*i+(40*4)),SetTo,0*16777216,0,0xFF000000);
	MoveCp(Add,25*4);})
end
CunitCtrig_End()

TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[10] * SDspeed, FBOSS_BGM)}, {KillUnit(32, Force2)})



-- Todo : PerAction == SetInvincibility Enable to Spawn tables | SetPlayerColor and SetMinimapColor of P8 and plotting



-------------------------- Start of Hard Plot --------------------
    CElseX()



    
    CIfXEnd()
end